from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm, RecaptchaField
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256
from wtforms import StringField, PasswordField, EmailField, DateField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError
from project.models import Moniteur, Adherent

class LoginForm (FlaskForm):
    id_a = StringField("id de l'adhérent", validators=[DataRequired(), 
                                                                  Regexp(r'^\d{10}$', message="L'id est invalide'.")])
    password = PasswordField("Mot de passe", validators=[DataRequired(), Length(max=64)])

    def get_authentificated_user(self):
        """permet de savoir si le mot de passe de 
        l'utilisateur est bon

        Returns:
            User: L'utilisateur si le mot de passe est correct, None sinon
        """
        id_user = self.id_a.data
        if id_user[0] == "a" :
            user = Adherent.query.get(id_user[1:])
            if user is None:
                return None
            m = sha256()
            m.update(self.password.data.encode())
            passwd = m.hexdigest()
            return user if passwd == user.mdp else None

        if id_user[0] == "m" :
            user = Moniteur.query.get(id_user[1:])
            if user is None:
                return None
            m = sha256()
            m.update(self.password.data.encode())
            passwd = m.hexdigest()
            return user if passwd == user.mdp else None

        else : 
            return None

class RegisterForm (FlaskForm):
    id_a = StringField("Id de l'utilisateur", validators=[DataRequired(), 
                                                          Length(min=2, message='Longueur incorrecte.'), 
                                                          Regexp(r'^[am]\d*$', message="L'id est invalide.")])

    name = StringField("Nom", validators=[DataRequired(), 
                                          Length(max=42)])
                                          
    first_name = StringField("Prénom", validators=[DataRequired(), 
                                                   Length(max=42)])

    email = EmailField("Email", validators=[DataRequired(), Email(message='Adresse mail invalide.'), 
                                            Length(max=64)])
    
    birth_date = DateField('Date de naissance', format='%d/%m/%Y', validators=[DataRequired()])

    password = PasswordField("Mot de passe", validators=[DataRequired(), 
                                                         Length(max=64)])

    password_check = PasswordField("Confirmez votre mot de passe", validators=[DataRequired(), 
                                                                               EqualTo('password', message='Les mots de passe doivent correspondre.'),])

    def get_authentificated_user(self):
        """permet de savoir si le mot de passe de 
        l'utilisateur est bon

        Returns:
            User: L'utilisateur si le mot de passe est correct, None sinon
        """
        id_user = self.id_a.data
        if id_user[0] == "a" :
            user = Adherent.query.get(id_user[1:])
            if user is None:
                return None
            m = sha256()
            m.update(self.password.data.encode())
            passwd = m.hexdigest()
            return user if passwd == user.mdp else None

        if id_user[0] == "m" :
            user = Moniteur.query.get(id_user[1:])
            if user is None:
                return None
            m = sha256()
            m.update(self.password.data.encode())
            passwd = m.hexdigest()
            return user if passwd == user.mdp else None

        else : 
            return None
    
    def create_user(self) :
        passwd = self.password.data
        m = sha256()
        m.update(passwd.encode())
        return Adherent(id_ad=self.id_a.data,
                 mdp=m.hexdigest(),
                 nom = self.name.data,
                 prenom = self.first_name.data,
                 adresse = self.address.data,
                 email = self.email.data)

@app.route("/connexion", methods = ("GET", "POST", ))
def login():
    f = LoginForm()
    if f.validate_on_submit():
        the_user = f.get_authentificated_user()
        if the_user:
            login_user(the_user)
            return redirect(url_for("home"))
        return render_template("connexion.html", form = f, error = 'Mot de passe incorrect.')
    return render_template("connexion.html", form = f)

@app.route("/deconnexion")
def logout():
    logout_user()
    return redirect(url_for("home"))

@app.route("/inscription", methods = ["GET", "POST"])
def register():
    f = RegisterForm()
    if f.validate_on_submit():
        u = f.create_user()
        if Adherent.query.get(u.get_id()) :
            return render_template("inscription.html", form = f)
        else :
            db.session.add(u)
            db.session.commit()
            login_user(u)
            return redirect(url_for("home"))
    return render_template("inscription.html", form = f)