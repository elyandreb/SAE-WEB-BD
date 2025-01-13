from project import app, db
from flask import render_template, url_for, redirect, request, flash
from flask_wtf import FlaskForm
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256
from wtforms import IntegerField, StringField, PasswordField, EmailField, DateField, HiddenField, DecimalField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError, NumberRange, AnyOf
from wtforms_sqlalchemy.fields import QuerySelectMultipleField
from wtforms.widgets import RadioInput, ListWidget
from project.models import Utilisateur, Poney, Cours
import time
import sqlalchemy.exc as sql


class PoneyForm(FlaskForm) :
    nom_po = StringField("Nom du poney", validators=[DataRequired(), 
                                                     Length(max=64)])
    charge = DecimalField("Charge maximal du poney", 
                          validators=[DataRequired(), 
                                      NumberRange(min=0, 
                                                  message='La charge doit être un nombre positif.')])

class MoniteurForm(FlaskForm) :
    name = StringField("Nom", validators=[DataRequired(), 
                                          Length(max=42)])
                                          
    first_name = StringField("Prénom", validators=[DataRequired(), 
                                                   Length(max=42)])

    email = EmailField("Email", validators=[DataRequired(), Email(message='Adresse mail invalide.'), 
                                            Length(max=64)])
    
    birth_date = DateField("Date de naissance", format='%Y-%m-%d', validators=[DataRequired()])

    poids = DecimalField("Poids", validators=[DataRequired(), NumberRange(min=0, message='Le poids doit être un nombre positif.')])

    password = PasswordField("Mot de passe", validators=[DataRequired(), 
                                                         Length(max=64)])

    password_check = PasswordField("Confirmez son mot de passe", validators=[DataRequired(), 
                                                                               EqualTo('password', message='Les mots de passe doivent correspondre.'),])

    def validate_email(self, field):
        if Utilisateur.query.filter_by(email=field.data).first():
            raise ValidationError("Cet e-mail est déjà utilisé.")

    def get_authentificated_user(self):
        """permet de savoir si le mot de passe de 
        l'utilisateur est bon

        Returns:
            Utilisateur: L'utilisateur si le mot de passe est correct, None sinon
        """
        user = Utilisateur.get_by_email(self.email.data)
        if user is None:
            return None
        m = sha256()
        m.update(self.password.data.encode())
        passwd = m.hexdigest()
        return user if passwd == user.mdp else None
    
    def create_moniteur(self) :
        passwd = self.password.data
        m = sha256()
        m.update(passwd.encode())
        return Utilisateur(
                 nom_u = self.name.data,
                 prenom_u = self.first_name.data,
                 date_de_naissance=self.birth_date.data,
                 email = self.email.data,
                 poids = self.poids.data,
                 mdp=m.hexdigest(),
                 le_role="moniteur")
    
class CoursForm(FlaskForm) :
    moniteur = QuerySelectMultipleField(
        "Les moniteurs",
        query_factory=lambda: Utilisateur.get_moniteurs(),
        get_label="nom_u",
        widget=ListWidget(prefix_label=False),
        option_widget=RadioInput()
    )
    nb_personne = IntegerField("Le nombre de personne max",validators=[DataRequired(), NumberRange(min=1, max=10)])

    h_debut = IntegerField("L'heure de début",validators=[DataRequired()])

    duree = IntegerField("La durée du cours",validators=[DataRequired(), 
                                     AnyOf([1, 2])])
    
    date = DateField("La date du cours",validators=[DataRequired()])

    prix = DecimalField('Le prix du cours', places=2, validators=[DataRequired(), 
                                                      NumberRange(min=0, max=999.99)])

@app.route("/test_p")
def test_p() :
    f = PoneyForm()
    utilisateur = current_user
    return render_template("test_p.html", form = f, utilisateur = utilisateur)

@app.route("/test_m")
def test_m() :
    f = MoniteurForm()
    utilisateur = current_user
    return render_template("test_m.html", form = f, utilisateur = utilisateur)

@app.route("/test_c")
def test_c() :
    f = CoursForm()
    utilisateur = current_user
    return render_template("test_c.html", form = f, utilisateur = utilisateur)


@app.route("/add_poney", methods=["POST"])
def add_poney() :
    f = PoneyForm()
    if f.validate_on_submit() :
        poney = Poney(nom_po = f.nom_po.data,
                      charge_max = f.charge.data)
        db.session.add(poney)
        db.session.commit()
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/delete_poney/<int:id>", methods=["POST"])
def drop_poney(id_po) :
    poney = Poney.query.get(id_po)
    poney_reserves = Poney.get_poney_reserves()
    if poney in poney_reserves() :
        flash("Suppression impossible, le poney est réservé dans au moins un cours", "danger")
        time.sleep(1)
    else :
        db.session.delete(poney)
        db.session.commit()
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/update_poney/<int:id>", methods=["POST"])
def update_poney(id_po) :
    poney = Poney.query.get(id_po)
    f = PoneyForm()
    if f.validate_on_submit() :
        verif, message = Poney.verifier_charge(id_po, f.charge.data)
        if verif : 
            poney.nom_po = f.nom_po.data
            poney.charge_max = f.charge.data
            db.session.commit()
            flash(message, "success")
        else :
            flash(message, "danger")
        time.sleep(1)
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/add_moniteur", methods=["POST"])
def add_moniteur() :
    f = MoniteurForm()
    if f.validate_on_submit() :
        moniteur = f.create_moniteur()
        db.session.add(moniteur)
        db.session.commit()
        flash("Moniteur créé, id : " + moniteur.get_id(), "success")
        time.sleep(1)
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/delete_moniteur/<int:id>", methods=["POST"])
def drop_moniteur(id_u) :
    moniteur = Utilisateur.query.get(id_u)
    moniteur_attribues = Utilisateur.get_moniteurs_attribues()
    if moniteur in moniteur_attribues() :
        flash("Suppression impossible, le moniteur est attribué dans au moins un cours", "danger")
        time.sleep(1)
    else :
        db.session.delete(moniteur)
        db.session.commit()
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))
    
@app.route("/update_moniteur/<int:id>", methods=["POST"])
def update_moniteur(id_u) :
    moniteur = Utilisateur.query.get(id_u)
    f = MoniteurForm()
    if f.validate_on_submit() :
        passwd = f.password.data
        m = sha256()
        m.update(passwd.encode())
        moniteur.nom_u = f.name.data,
        moniteur.prenom_u = f.first_name.data,
        moniteur.date_de_naissance=f.birth_date.data,
        moniteur.email = f.email.data,
        moniteur.poids = f.poids.data,
        moniteur.mdp=m.hexdigest(),
        db.session.commit()
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/add_cours", methods=["POST"])
def add_cours() :
    f = CoursForm()
    if f.validate_on_submit() :
        try :
            print(f.moniteur)
            print(f.moniteur.get_id())
            cours = Cours(
                id_u = f.moniteur.data.get_id(),
                nb_pe = f.nb_personne.data,
                h_de_debut = f.h_debut.data,
                duree = f.duree.data,
                date_c = f.date.data,
                prix = f.prix.data
            )
            db.session.add(cours)
            db.session.commit()
            flash("Cours ajouté avec succès.", "success")
        except sql.SQLAlchemyError as e: # Les triggers se mettent en action s'il y a un soucis
            db.session.rollback()
            flash(f"Erreur lors de l'ajout du cours : {str(e)}", "danger")
        time.sleep(1)
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/delete_cours/<int:id>", methods=["POST"])
def drop_cours(id_c) :
    cours = Cours.query.get(id_c)
    cours_remplis = Cours.get_cours_remplis()
    if cours in cours_remplis() :
        flash("Suppression impossible, le cours a au moins une réservation", "danger")
        time.sleep(1)
    else :
        db.session.delete(cours)
        db.session.commit()
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))

@app.route("/update_cours/<int:id>", methods=["POST"])
def update_cours(id_c) :
    cours = Cours.query.get(id_c)
    f = CoursForm()
    if f.validate_on_submit() :
        try :
            verif, message = Cours.verifier_nb_pe(id_c, f.nb_personne.data)
            if verif :
                cours.id_u = f.moniteur.get_id(),
                cours.nb_pe = f.nb_personne.data,
                cours.h_de_debut = f.h_debut.data,
                cours.duree = f.duree.data,
                cours.date_c = f.date.data,
                cours.prix = f.prix.data
                db.session.commit()
                flash(message, "success")
            else :
                flash(message, "danger")
        except sql.SQLAlchemyError as e: # Les triggers se mettent en action s'il y a un soucis
            db.session.rollback()
            flash(f"Erreur lors de l'ajout du cours : {str(e)}", "danger")
        time.sleep(1)
    return redirect(url_for("accueil", adherent_id = current_user.get_id()))
