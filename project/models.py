from .app import db, login_manager

class Poney(db.Model):
    __tablename__ = 'PONEY'
    id_po = db.Column(db.Integer, primary_key=True)
    nom_po = db.Column(db.String(42))
    charge_max = db.Column(db.Numeric(4, 2))
    reservations = db.relationship('Reserver', back_populates='poney')

class Adherent(db.Model):
    __tablename__ = 'ADHERENT'
    id_a = db.Column(db.Integer, primary_key=True)
    nom_a = db.Column(db.String(42))
    prenom_a = db.Column(db.String(42))
    date_de_naissance = db.Column(db.Date)
    poids = db.Column(db.Numeric(4, 2))
    email = db.Column(db.String(42))
    cotisations = db.relationship('Cotiser', back_populates='adherent')
    reservations = db.relationship('Reserver', back_populates='adherent')

class Reserver(db.Model):
    __tablename__ = 'RESERVER'
    id_a = db.Column(db.Integer, db.ForeignKey('ADHERENT.id_a'), primary_key=True)
    id_po = db.Column(db.Integer, db.ForeignKey('PONEY.id_po'), primary_key=True)
    id_c = db.Column(db.Integer, db.ForeignKey('COURS.id_c'), primary_key=True)
    adherent = db.relationship('Adherent', back_populates='reservations')
    poney = db.relationship('Poney', back_populates='reservations')
    cours = db.relationship('Cours', back_populates='reservations')

class Cours(db.Model):
    __tablename__ = 'COURS'
    id_c = db.Column(db.Integer, primary_key=True)
    id_m = db.Column(db.Integer, db.ForeignKey('MONITEUR.id_m'))
    nb_pe = db.Column(db.Integer, check_constraint="nb_pe <= 10 AND nb_pe >= 1")
    h_de_debut = db.Column(db.Integer)
    duree = db.Column(db.Integer, check_constraint="duree = 1 OR duree = 2")
    date_c = db.Column(db.Date)
    prix = db.Column(db.Numeric(5, 2))
    reservations = db.relationship('Reserver', back_populates='cours')

    # Relation avec Moniteur
    moniteur = db.relationship('Moniteur', back_populates='cours')


class Cotiser(db.Model):
    __tablename__ = 'COTISER'
    id_a = db.Column(db.Integer, db.ForeignKey('ADHERENT.id_a'), primary_key=True)
    annee_debut = db.Column(db.Integer, db.ForeignKey('COTISATION.annee_debut'), primary_key=True)
    annee_fin = db.Column(db.Integer, db.ForeignKey('COTISATION.annee_fin'), primary_key=True)
    paye = db.Column(db.Boolean)

    adherent = db.relationship('Adherent', back_populates='cotisations')
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



class Moniteur(db.Model):
    __tablename__ = 'MONITEUR'
    id_m = db.Column(db.Integer, primary_key=True)
    nom_m = db.Column(db.String(42))
    prenom_m = db.Column(db.String(42))
    date_de_naissance = db.Column(db.Date)
    poids = db.Column(db.Numeric(4, 2))
    email = db.Column(db.String(42))

    # Relation avec Cours
    cours = db.relationship('Cours', back_populates='moniteur')


@login_manager.user_loader
def load_user(user_id):
    return Adherent.query.get(int(user_id))
