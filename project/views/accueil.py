from wtforms import EmailField, StringField, TextAreaField
from project import app, db
from flask import render_template, url_for, redirect, request
from flask_wtf import FlaskForm
from flask_login import login_user , current_user, logout_user, login_required
from hashlib import sha256

@app.route("/")
def home():
    images = ["img/slide-1.jpg", "img/slide-2.jpg", "img/slide-3.jpg", "img/quelques-plats-japonais.jpg"]
    return render_template("home.html",
                           images=images)