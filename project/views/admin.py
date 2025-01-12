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
    
