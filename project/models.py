from .app import db, login_manager
from flask_login import UserMixin

class Poney(db.Model):
    __tablename__ = 'PONEY'
    id_po = db.Column(db.Integer, primary_key=True)
    nom_po = db.Column(db.String(42))
    charge_max = db.Column(db.Numeric(4, 2))
    reservations = db.relationship('Reserver', back_populates='poney')

class Utilisateur(db.Model, UserMixin):
    __tablename__ = 'UTILISATEUR'
    id_u = db.Column(db.Integer, primary_key=True)
    nom_u = db.Column(db.String(42))
    prenom_u = db.Column(db.String(42))
    date_de_naissance = db.Column(db.Date)
    poids = db.Column(db.Numeric(4, 2))
    email = db.Column(db.String(42))
    mdp = db.Column(db.String(42))
    le_role = db.Column(db.Enum("admin", "adherent", "moniteur"))
    cotisations = db.relationship('Cotiser', back_populates='user')
    reservations = db.relationship('Reserver', back_populates='user')
    cours = db.relationship('Cours', back_populates='moniteur')

class Reserver(db.Model):
    __tablename__ = 'RESERVER'
    id_u = db.Column(db.Integer, db.ForeignKey('UTILISATEUR.id_u'), primary_key=True)
    id_po = db.Column(db.Integer, db.ForeignKey('PONEY.id_po'), primary_key=True)
    id_c = db.Column(db.Integer, db.ForeignKey('COURS.id_c'), primary_key=True)
    user = db.relationship('Utilisateur', back_populates='reservations')
    poney = db.relationship('Poney', back_populates='reservations')
    cours = db.relationship('Cours', back_populates='reservations')

class Cours(db.Model):
    __tablename__ = 'COURS'
    id_c = db.Column(db.Integer, primary_key=True)
    id_u = db.Column(db.Integer, db.ForeignKey('UTILISATEUR.id_u'))  # Moniteur
    nb_pe = db.Column(db.Integer, check_constraint="nb_pe <= 10 AND nb_pe >= 1")
    h_de_debut = db.Column(db.Integer)
    duree = db.Column(db.Integer, check_constraint="duree = 1 OR duree = 2")
    date_c = db.Column(db.Date)
    prix = db.Column(db.Numeric(5, 2))
    reservations = db.relationship('Reserver', back_populates='cours')
    moniteur = db.relationship('Utilisateur', back_populates='cours')


class Cotiser(db.Model):
    __tablename__ = 'COTISER'
    id_u = db.Column(db.Integer, db.ForeignKey('UTILISATEUR.id_u'), primary_key=True)
    annee_debut = db.Column(db.Integer, db.ForeignKey('COTISATION.annee_debut'), primary_key=True)
    annee_fin = db.Column(db.Integer, db.ForeignKey('COTISATION.annee_fin'), primary_key=True)
    paye = db.Column(db.Boolean)
    user = db.relationship('Utilisateur', back_populates='cotisations')

    cotisation = db.relationship(
        'Cotisation',
        back_populates='cotisants',
        primaryjoin=(
            "and_(Cotiser.annee_debut == Cotisation.annee_debut, "
            "Cotiser.annee_fin == Cotisation.annee_fin)"
        ),
        foreign_keys=[annee_debut, annee_fin]
    )


class Cotisation(db.Model):
    __tablename__ = 'COTISATION'
    annee_debut = db.Column(db.Integer, primary_key=True)
    annee_fin = db.Column(db.Integer, primary_key=True)
    cotisants = db.relationship(
        'Cotiser',
        back_populates='cotisation',
        primaryjoin=(
            "and_(Cotiser.annee_debut == Cotisation.annee_debut, "
            "Cotiser.annee_fin == Cotisation.annee_fin)"
        ),
        foreign_keys="[Cotiser.annee_debut, Cotiser.annee_fin]"
    )


@login_manager.user_loader
def load_user(user_id):
    return Utilisateur.query.get(int(user_id))
