from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm, RecaptchaField
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256

@app.route("/adherent")
def home_adherent():
     return render_template("home_adherent.html",
                           )
@app.route("/moniteur")
def home_adherent():
     return render_template("home_moniteur.html",
                           )
