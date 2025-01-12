from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256
from wtforms import IntegerField, StringField, PasswordField, EmailField, DateField, HiddenField, DecimalField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError, NumberRange
from project.models import Utilisateur


class PoneyForm(FlaskForm) :
    id_po = HiddenField("Id du poney", validators=[DataRequired()])
    nom_po = StringField("Nom du poney", validators=[DataRequired(), Length(max=64)])
    charge = DecimalField("Charge maximal du poney", validators=[DataRequired(),  NumberRange(min=0, message='La charge doit être un nombre positif.')])

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
    
    def create_user(self) :
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