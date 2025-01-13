from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256
from wtforms import StringField, PasswordField, EmailField, DateField, HiddenField, DecimalField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError, NumberRange
from project.models import Utilisateur

class LoginForm (FlaskForm):
    email = EmailField("Email de l'utilisateur", validators=[DataRequired(), Email(message='Adresse mail invalide.'), 
                                            Length(max=64)])
    
    password = PasswordField("Mot de passe", validators=[DataRequired(), Length(max=64)])

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

class RegisterForm (FlaskForm):
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

    password_check = PasswordField("Confirmez votre mot de passe", validators=[DataRequired(), 
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
                 le_role="adherent")

@app.route("/connexion", methods = ("GET", "POST", ))
def login():
    f = LoginForm()
    if f.validate_on_submit():
        the_user = f.get_authentificated_user()
        if the_user:
            login_user(the_user)
            print(the_user.get_id())
            return redirect(url_for("accueil",adherent_id = the_user.get_id()))
    return render_template("connexion.html", form = f)

@app.route("/deconnexion")
def logout():
    logout_user()
    return redirect(url_for("login"))

@app.route("/inscription", methods = ["GET", "POST"])
def register():
    f = RegisterForm()
    if f.validate_on_submit():
        u = f.create_user()
        if Utilisateur.query.get(u.get_id()) :
            return render_template("inscription.html", form = f)
        else :
            db.session.add(u)
            db.session.commit()
            login_user(u)
            return redirect(url_for("accueil",adherent_id = u.get_id())) 
    return render_template("inscription.html", form = f)

@app.route("/")
def racine ():
    return redirect(url_for("login"))
