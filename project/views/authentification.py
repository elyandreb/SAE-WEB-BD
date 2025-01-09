from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256
from wtforms import StringField, PasswordField, EmailField, DateField, HiddenField, DecimalField
from wtforms.validators import DataRequired, EqualTo, Email, Length, Regexp, ValidationError, NumberRange
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
    print("test1")
    if f.validate_on_submit():
        print("test2")
        u = f.create_user()
        print(u)
        if Utilisateur.query.get(u.get_id()) :
            return render_template("inscription.html", form = f)
        else :
            print("ça va enregistrer")
            db.session.add(u)
            db.session.commit()
            login_user(u)
            return redirect(url_for("accueil",adherent_id = u.get_id())) 
    return render_template("inscription.html", form = f)