from datetime import date, timedelta
import locale
from project import app, db
from flask import render_template, url_for, redirect, request, flash
from flask_wtf import FlaskForm
from flask_login import login_user, current_user, logout_user, login_required
from hashlib import sha256
from wtforms import IntegerField, StringField, PasswordField, EmailField, DateField, HiddenField, DecimalField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError, NumberRange, AnyOf
from wtforms_sqlalchemy.fields import QuerySelectField
from wtforms.widgets import RadioInput, ListWidget
from project.models import Cotiser, Reserver, Utilisateur, Poney, Cours
import time
import sqlalchemy.exc as sql


class PoneyForm(FlaskForm):
    nom_po = StringField("Nom du poney",
                         validators=[DataRequired(),
                                     Length(max=64)])
    charge = DecimalField(
        "Charge maximal du poney",
        validators=[
            DataRequired(),
            NumberRange(min=0, message='La charge doit être un nombre positif.')
        ])


class UtilisateurForm(FlaskForm):
    nom_u = StringField("Nom", validators=[DataRequired(), Length(max=42)])

    prenom_u = StringField("Prénom",
                           validators=[DataRequired(),
                                       Length(max=42)])

    email = EmailField("Email",
                       validators=[
                           DataRequired(),
                           Email(message='Adresse mail invalide.'),
                           Length(max=64)
                       ])

    birth_date = DateField("Date de naissance",
                           format='%Y-%m-%d',
                           validators=[DataRequired()])

    poids = DecimalField(
        "Poids",
        validators=[
            DataRequired(),
            NumberRange(min=0, message='Le poids doit être un nombre positif.')
        ])

    password = PasswordField("Mot de passe",
                             validators=[DataRequired(),
                                         Length(max=64)])

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

    def create_moniteur(self):
        passwd = self.password.data
        m = sha256()
        m.update(passwd.encode())
        return Utilisateur(nom_u=self.nom_u.data,
                           prenom_u=self.prenom_u.data,
                           date_de_naissance=self.birth_date.data,
                           email=self.email.data,
                           poids=self.poids.data,
                           mdp=m.hexdigest(),
                           le_role="moniteur")

    def create_adherent(self):
        passwd = self.password.data
        m = sha256()
        m.update(passwd.encode())
        return Utilisateur(nom_u=self.nom_u.data,
                           prenom_u=self.prenom_u.data,
                           date_de_naissance=self.birth_date.data,
                           email=self.email.data,
                           poids=self.poids.data,
                           mdp=m.hexdigest(),
                           le_role="adherent")


class CoursForm(FlaskForm):
    moniteur = QuerySelectField(
        "Les moniteurs",
        query_factory=lambda: Utilisateur.get_moniteurs(),
        get_label="nom_u",
        widget=ListWidget(prefix_label=False),
        option_widget=RadioInput())
    nb_personne = IntegerField(
        "Le nombre de personne max",
        validators=[DataRequired(), NumberRange(min=1, max=10)])

    h_de_debut = IntegerField("L'heure de début", validators=[DataRequired()])

    duree = IntegerField("La durée du cours",
                         validators=[DataRequired(),
                                     AnyOf([1, 2])])

    date = DateField("La date du cours", validators=[DataRequired()])

    prix = DecimalField(
        'Le prix du cours',
        places=2,
        validators=[DataRequired(),
                    NumberRange(min=0, max=999.99)])


@app.route("/gerer-poney")
@login_required
def gerer_poney():
    f = PoneyForm()
    utilisateur = current_user
    poneys = Poney.query.all()
    print(poneys)
    return render_template("gerer-poney.html",
                           form=f,
                           utilisateur=utilisateur,
                           poneys=poneys)


@app.route("/gerer-moniteur")
@login_required
def gerer_moniteur():
    f = UtilisateurForm()
    utilisateur = current_user
    moniteurs = Utilisateur.get_moniteurs()
    return render_template("gerer-moniteur.html",
                           form=f,
                           utilisateur=utilisateur,
                           moniteurs=moniteurs)


@app.route("/gerer-adherent")
@login_required
def gerer_adherent():
    adherents = Utilisateur.query.filter_by(le_role="adherent").all()
    f = UtilisateurForm()

    return render_template("gerer-adherent.html",
                           adherents=adherents,
                           form=f,
                           utilisateur=current_user)


@app.route("/gerer-cours")
@login_required
def gerer_cours():
    f = CoursForm()
    # Configurer les dates en français
    locale.setlocale(locale.LC_TIME, 'fr_FR.UTF-8')

    # Récupérer la semaine à afficher
    today = date.today()
    semaine_index = int(request.args.get('week', 0))  # Décalage de la semaine
    semaine_debut = today + timedelta(weeks=semaine_index,
                                      days=-today.weekday())
    semaine_fin = semaine_debut + timedelta(days=6)

    # Générer les jours de la semaine
    jours = [semaine_debut + timedelta(days=i) for i in range(7)]

    # Générer les horaires
    horaires = range(9, 21)  # De 9h à 20h

    # Récupération des cours pour la semaine
    cours_semaine = Cours.query.filter(
        Cours.date_c.between(semaine_debut, semaine_fin)).all()

    moniteurs = Utilisateur.get_moniteurs()

    return render_template('gerer-cours.html',
                           semaine_debut=semaine_debut,
                           jours=jours,
                           horaires=horaires,
                           cours_semaine=cours_semaine,
                           previous_week=semaine_index - 1,
                           next_week=semaine_index + 1,
                           utilisateur=current_user,
                           moniteurs=moniteurs)


@app.route("/add_poney", methods=["POST"])
@login_required
def add_poney():
    f = PoneyForm()
    poney = Poney(nom_po=f.nom_po.data, charge_max=f.charge.data)
    db.session.add(poney)
    db.session.commit()
    flash("Poney ajouté avec succès.", "success")
    return redirect(url_for("gerer_poney", adherent_id=current_user.get_id()))


@app.route("/delete_poney/<int:id_po>", methods=["POST"])
@login_required
def drop_poney(id_po):
    poney = Poney.query.get(id_po)
    res_poney = Reserver.query.filter_by(id_po=id_po).all()
    for res in res_poney:
        db.session.delete(res)
    db.session.delete(poney)
    db.session.commit()
    flash("Poney supprimé avec succès.", "success")
    return redirect(url_for("gerer_poney", adherent_id=current_user.get_id()))


@app.route("/update_poney/<int:id_po>", methods=["POST"])
@login_required
def update_poney(id_po):
    poney = Poney.query.get(id_po)
    f = PoneyForm()
    verif, message = Poney.verifier_charge(id_po, f.charge.data)
    if verif:
        poney.nom_po = f.nom_po.data
        poney.charge_max = f.charge.data
        db.session.commit()
        flash(message, "success")
    else:
        flash(message, "danger")
        time.sleep(1)
    return redirect(url_for("gerer_poney", adherent_id=current_user.get_id()))


@app.route("/add_moniteur", methods=["POST"])
@login_required
def add_moniteur():
    f = UtilisateurForm()
    moniteur = f.create_moniteur()
    db.session.add(moniteur)
    db.session.commit()
    flash("Moniteur créé, id : " + moniteur.get_id(), "success")
    time.sleep(1)
    return redirect(url_for("gerer_moniteur",
                            adherent_id=current_user.get_id()))


@app.route("/delete_moniteur/<int:id_u>", methods=["POST"])
@login_required
def drop_moniteur(id_u):
    print(id_u)
    moniteur = Utilisateur.query.get(id_u)
    cours_moniteur = Cours.query.filter_by(id_u=id_u).all()

    for cours in cours_moniteur:
        for res in Reserver.query.filter_by(id_c=cours.id_c).all():
            db.session.delete(res)
        db.session.delete(cours)

    db.session.delete(moniteur)
    db.session.commit()
    flash("Moniteur supprimé avec succès.", "success")
    return redirect(url_for("gerer_moniteur",
                            adherent_id=current_user.get_id()))


@app.route("/update_moniteur/<int:id_u>", methods=["POST"])
@login_required
def update_moniteur(id_u):
    moniteur = Utilisateur.query.get(id_u)
    f = UtilisateurForm()
    moniteur.nom_u = f.nom_u.data,
    moniteur.prenom_u = f.prenom_u.data,
    moniteur.date_de_naissance = f.birth_date.data,
    moniteur.email = f.email.data,
    moniteur.poids = f.poids.data,
    db.session.commit()
    flash("Moniteur modifié avec succès.", "success")
    return redirect(url_for("gerer_moniteur",
                            adherent_id=current_user.get_id()))


@app.route("/add_cours", methods=["POST"])
@login_required
def add_cours():
    f = CoursForm()
    try:
        cours = Cours(id_u=f.moniteur.data.get_id(),
                      nb_pe=f.nb_personne.data,
                      h_de_debut=f.h_de_debut.data,
                      duree=f.duree.data,
                      date_c=f.date.data,
                      prix=f.prix.data)
        print(f.data)
        db.session.add(cours)
        db.session.commit()
        flash("Cours ajouté avec succès.", "success")
    except sql.SQLAlchemyError as e:  # Les triggers se mettent en action s'il y a un soucis
        db.session.rollback()
        flash(f"Erreur lors de l'ajout du cours : {str(e)}", "danger")
    time.sleep(1)
    return redirect(url_for("gerer_cours", adherent_id=current_user.get_id()))


@app.route("/delete_cours/<int:id_c>", methods=["POST"])
@login_required
def drop_cours(id_c):
    cours = Cours.query.get(id_c)
    res_cours = Reserver.query.filter_by(id_c=id_c).all()
    for res in res_cours:
        db.session.delete(res)
    db.session.delete(cours)
    db.session.commit()
    flash("Cours supprimé avec succès.", "success")
    return redirect(url_for("gerer_cours", adherent_id=current_user.get_id()))


@app.route("/update_cours/<int:id_c>", methods=["POST"])
@login_required
def update_cours(id_c):
    cours = Cours.query.get(id_c)
    f = CoursForm()
    try:
        verif = Cours.verifier_nb_pe(id_c, f.nb_personne.data)
        if verif:
            cours.id_u = f.moniteur.data.get_id(),
            cours.nb_pe = f.nb_personne.data,
            cours.h_de_debut = f.h_de_debut.data,
            cours.duree = f.duree.data,
            cours.date_c = f.date.data,
            cours.prix = f.prix.data
            db.session.commit()
            flash("Le cours a été mit à jour ", "success")
    except sql.SQLAlchemyError as e:  # Les triggers se mettent en action s'il y a un soucis
        db.session.rollback()
        flash(f"Erreur lors de l'ajout du cours : {str(e)}", "danger")
    time.sleep(1)
    return redirect(url_for("gerer_cours", adherent_id=current_user.get_id()))


@app.route("/add_adherent", methods=["POST"])
@login_required
def add_adherent():
    f = UtilisateurForm()
    adherent = f.create_adherent()
    db.session.add(adherent)
    db.session.commit()
    flash("Adhérent ajouté avec succès.", "success")

    return redirect(url_for("gerer_adherent",
                            adherent_id=current_user.get_id()))


@app.route("/delete_adherent/<int:id_u>", methods=["POST"])
@login_required
def drop_adherent(id_u):
    adherent = Utilisateur.query.get(id_u)
    cours_adherent = Reserver.query.filter_by(id_u=id_u).all()
    cotisation_adherent = Cotiser.query.filter_by(id_u=id_u).all()

    for res in cours_adherent:
        db.session.delete(res)

    for cot in cotisation_adherent:
        db.session.delete(cot)

    db.session.delete(adherent)
    db.session.commit()
    flash("Adhérent supprimé avec succès.", "success")
    return redirect(url_for("gerer_adherent",
                            adherent_id=current_user.get_id()))


@app.route("/update_adherent/<int:id_u>", methods=["POST"])
@login_required
def update_adherent(id_u):
    adherent = Utilisateur.query.get(id_u)
    f = UtilisateurForm()
    adherent.nom_u = f.nom_u.data,
    adherent.prenom_u = f.prenom_u.data,
    adherent.date_de_naissance = f.birth_date.data,
    adherent.email = f.email.data,
    adherent.poids = f.poids.data,
    db.session.commit()
    flash("Adhérent modifié avec succès.", "success")
    return redirect(url_for("gerer_adherent",
                            adherent_id=current_user.get_id()))
