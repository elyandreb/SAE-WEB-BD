from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256
from wtforms import StringField, PasswordField, EmailField, DateField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError
from project.models import Utilisateur

class LoginForm (FlaskForm):
    id_u = StringField("Id de l'utilisateur", validators=[DataRequired(), 
                                                        Length(min=2, message='Longueur incorrecte.'), 
                                                        Regexp(r'^(a|m|admin)\d*$', message="L'id est invalide.")
                                                        ])
    password = PasswordField("Mot de passe", validators=[DataRequired(), Length(max=64)])

    def get_authentificated_user(self):
        """permet de savoir si le mot de passe de 
        l'utilisateur est bon

        Returns:
            Utilisateur: L'utilisateur si le mot de passe est correct, None sinon
        """
        id_entier = self.id_u.data
        if id_entier[0] == "a" or id_entier[0] == "m" or id_entier[0:5] == "admin" :
            print("id_entier passe")
            print(id_entier[1:])
            user = Utilisateur.query.get(id_entier[1:])
            print(user)
            if user is None:
                return None
            m = sha256()
            m.update(self.password.data.encode())
            passwd = m.hexdigest()
            return user if passwd == user.mdp else None
        return None

class RegisterForm (FlaskForm):
    id_u = StringField("Id de l'utilisateur", validators=[DataRequired(), 
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

    # Commentaire de la ligne en-dessous à enlever une fois le captcha mis en place 
    #recaptcha = RecaptchaField() 

    def validate_email(self, field):
        if Utilisateur.query.filter_by(email=field.data).first():
            raise ValidationError("Cet e-mail est déjà utilisé.")

    def validate_id_a(self, field):
        if Utilisateur.query.filter_by(num_tel=field.data).first():
            raise ValidationError("Ce numéro de téléphone est déjà utilisé.")

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
        return Utilisateur(num_tel=self.id_u.data,
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
        print(the_user)
        if the_user:
            login_user(the_user)
            if f.id_u.data[0:5] == "admin" :
                return render_template("home_admin.html")
            elif f.id_u.data[0] == "m" : 
                return render_template("home_moniteur.html")
            else : # l'utilisateur est trouvé donc c'est forcément un adherent
                return render_template("home_adherent.html")
        return render_template("connexion.html", form = f, error = 'Mot de passe incorrect.')
    return render_template("connexion.html", form = f)

@app.route("/deconnexion")
def logout():
    logout_user()
    return redirect(url_for("register"))

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
            return redirect(url_for("home"))

        
    return render_template("inscription.html", form = f)