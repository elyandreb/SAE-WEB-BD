from hashlib import sha256
from flask import Flask, render_template, request, redirect, url_for, flash
from datetime import date
from flask_wtf import FlaskForm
from flask_login import login_required, current_user
from project.app import db, app
from project.models import Utilisateur, Cotiser
from wtforms import StringField, PasswordField, EmailField, DateField, HiddenField, DecimalField, SubmitField
from wtforms.validators import DataRequired, EqualTo, Email, Length, NumberRange


class ProfileForm(FlaskForm):
    id_u = HiddenField()

    name = StringField("Nom", validators=[DataRequired(), Length(max=42)])

    first_name = StringField("Prénom",
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


class ChangeMdpForm(FlaskForm):
    old_password = PasswordField("Ancien mot de passe",
                                 validators=[DataRequired()])
    new_password = PasswordField("Nouveau mot de passe",
                                 validators=[DataRequired()])
    confirm_password = PasswordField(
        "Confirmer le nouveau mot de passe",
        validators=[
            DataRequired(),
            EqualTo('new_password',
                    message="Les mots de passe ne correspondent pas")
        ])
    change_password = SubmitField("Enregistrer")


MOIS = {
    1: "janvier",
    2: "février",
    3: "mars",
    4: "avril",
    5: "mai",
    6: "juin",
    7: "juillet",
    8: "août",
    9: "septembre",
    10: "octobre",
    11: "novembre",
    12: "décembre"
}


@app.route("/profil/", methods=["GET", "POST"])
@login_required
def profil():
    f = ProfileForm()
    mdp_f = ChangeMdpForm()

    edit = request.args.get('edit', False, type=bool)

    utilisateur_id = current_user.get_id()

    jour = date.today()  # date actuelle
    annee = jour.year

    if date(annee, 9, 1) < jour < date(annee, 12, 31):
        cotisation = Cotiser.query.filter_by(id_u=utilisateur_id,
                                             annee_debut=annee,
                                             annee_fin=annee + 1).first()
    else:
        cotisation = Cotiser.query.filter_by(id_u=utilisateur_id,
                                             annee_debut=annee - 1,
                                             annee_fin=annee).first()

    jour_str = f"{jour.day:02d} {MOIS[jour.month]} {jour.year}"

    if request.method == 'GET':
        f.id_u.data = current_user.id_u
        f.name.data = current_user.nom_u
        f.first_name.data = current_user.prenom_u
        f.birth_date.data = current_user.date_de_naissance
        f.email.data = current_user.email
        f.poids.data = current_user.poids

    if request.method == 'POST':
        if 'save_profile' in request.form and f.validate():
            current_user.nom_u = f.name.data
            current_user.prenom_u = f.first_name.data
            current_user.date_de_naissance = f.birth_date.data
            current_user.email = f.email.data
            current_user.poids = f.poids.data
            db.session.commit()
            flash("Profil mis à jour avec succès", "success")
            return redirect(url_for("profil"))

        if 'change_password' in request.form and mdp_f.validate():
            old_hash = sha256(mdp_f.old_password.data.encode()).hexdigest()
            if old_hash != current_user.mdp:
                flash("Ancien mot de passe incorrect", "danger")
            else:
                new_hash = sha256(mdp_f.new_password.data.encode()).hexdigest()
                current_user.mdp = new_hash
                db.session.commit()
                flash("Mot de passe mis à jour avec succès", "success")
                return redirect(url_for("profil"))

    return render_template("profil.html",
                           form=f,
                           edit=edit,
                           mdp_f=mdp_f,
                           cotisation=cotisation,
                           jour=jour_str,
                           utilisateur=current_user)
