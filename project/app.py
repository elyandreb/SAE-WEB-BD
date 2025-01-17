import os.path

from flask_sqlalchemy import SQLAlchemy
from flask import Flask
from flask_bootstrap import Bootstrap5
from flask_login import LoginManager
import project.auth as auth


def mkpath(p):
    return os.path.normpath(os.path.join(os.path.dirname(__file__), p))


app = Flask(__name__)
app.config['BOOSTRAP_SERVE_LOCAL'] = True
app.config['UPLOAD_FOLDER'] = os.path.join(
    os.path.abspath(os.path.dirname(__file__)), 'static', 'img', 'product')
app.config['ALLOWED_EXTENSIONS'] = {'png', 'jpg', 'jpeg', 'gif'}
bootstrap = Bootstrap5(app)

app.config['SECRET_KEY'] = 'ddf12011-f3d2-4e70-a180-3f07f1e0c6cd'

app.config[
    'SQLALCHEMY_DATABASE_URI'] = f'mysql://{auth.nom}:{auth.mdp}@{auth.db}/DB{auth.nom}'

db = SQLAlchemy(app)

login_manager = LoginManager(app)
login_manager.login_view = 'login'
