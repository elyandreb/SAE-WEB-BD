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


class PoneyForm(FlaskForm) :
    id_po = HiddenField("Id du poney", validators=[DataRequired()])

    nom_po = StringField("Nom du poney", validators=[DataRequired(), 
                                                     Length(max=64)])
    charge = DecimalField("Charge maximal du poney", 
                          validators=[DataRequired(), 
                                      NumberRange(min=0, 
                                                  message='La charge doit être un nombre positif.')])

class MoniteurForm(FlaskForm) :
    id_u = HiddenField()

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
        user = Utilisateur.query.get(self.id_u.data)
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
    id_c = HiddenField(validators=[DataRequired()])

    moniteur = QuerySelectMultipleField(
        "Les moniteurs",
        query_factory=lambda: Utilisateur.get_moniteurs(),
        get_label="id moniteur",
        widget=ListWidget(prefix_label=False),
        option_widget=RadioInput()
    )
    nb_personne = IntegerField("Le nombre de personne max",validators=[DataRequired()])

    h_debut = IntegerField("L'heure de début",validators=[DataRequired()])

    duree = IntegerField("La durée du cours",validators=[DataRequired(), 
                                     AnyOf([1, 2])])
    
    date = DateField("La date du cours",validators=[DataRequired()])

    prix = DecimalField('Le prix du cours', places=2, validators=[DataRequired(), 
                                                      NumberRange(min=0, max=999.99)])
    
@app.route("/add_poney", methods=["POST"])
def add_poney() :
    f = PoneyForm()
    if f.validate_on_submit() :
        poney = Poney(nom_po = f.nom_po.data,
                      charge_max = f.charge.data)
        db.session.add(poney)
        db.session.commit()
    return redirect(url_for("acceuil", adherent_id = current_user.get_id()))

@app.route("/delete_poney/<int:id>", methods=["POST"])
def drop_poney(id_po) :
    poney = Poney.query.get(id_po)
    poney_reserves = Poney.get_poney_reserves()
    if poney in poney_reserves() :
        flash("Suppression impossible, le poney est réservé dans au moins un cours", "danger")
    else :
        db.session.delete(poney)
        db.session.commit()
    return redirect(url_for("acceuil", adherent_id = current_user.get_id()))