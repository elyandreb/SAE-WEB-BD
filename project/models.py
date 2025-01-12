from sqlalchemy import CheckConstraint, text
from .app import db, login_manager
from flask_login import UserMixin

class Poney(db.Model):
    __tablename__ = 'PONEY'
    id_po = db.Column(db.Integer, primary_key=True)
    nom_po = db.Column(db.String(42))
    charge_max = db.Column(db.Numeric(4, 2))
    reservations = db.relationship('Reserver', back_populates='poney')

    @classmethod
    def get_poney_reserves(cls) :
        return cls.join(Reserver).all()

class Utilisateur(db.Model, UserMixin):
    __tablename__ = 'UTILISATEUR'
    id_u = db.Column(db.Integer, primary_key=True, autoincrement=True)
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

    def get_id(self):
        return str(self.id_u)
    
    @classmethod
    def get_moniteurs(cls) :
        return cls.query.filter_by(le_role="moniteur").all()

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
    nb_pe = db.Column(db.Integer, CheckConstraint("nb_pe <= 10 AND nb_pe >= 1"))
    h_de_debut = db.Column(db.Integer)
    duree = db.Column(db.Integer, CheckConstraint("duree = 1 OR duree = 2"))
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

class TriggerManager:
    def __init__(self):
        self.execute_triggers()

    def execute_triggers(self) -> None:
        """
        Execute all trigger methods in the class.

        Trigger methods are methods that start with "trigger_".
        """
        for attr_name in dir(self):
            if attr_name.startswith("trigger_"):
                method = getattr(self, attr_name)
                if callable(method):
                    trigger_str = method()
                    db.session.execute(text(trigger_str))
                    db.session.commit()

    def trigger_cavalierMoinsChargePoneyInsert(self) -> str:
        return """
        CREATE TRIGGER cavalierMoinsChargePoneyInsert 
        BEFORE INSERT ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE poidCavalier INT;
            DECLARE chargePoney INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            SELECT poids INTO poidCavalier FROM UTILISATEUR WHERE id_u = NEW.id_u;
            SELECT charge_max INTO chargePoney FROM PONEY WHERE id_po = NEW.id_po;
            IF poidCavalier > chargePoney THEN
                SET mes = CONCAT(mes, "Ajout impossible car le cavalier ", NEW.id_u, " pèse ", poidCavalier, "kg et le poney ", NEW.id_po, " supporte une charge max de ", chargePoney, "kg.");
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_cavalierMoinsChargePoneyUpdate(self) -> str:
        return """
        CREATE TRIGGER cavalierMoinsChargePoneyUpdate 
        BEFORE UPDATE ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE poidCavalier INT;
            DECLARE chargePoney INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            SELECT poids INTO poidCavalier FROM UTILISATEUR WHERE id_u = NEW.id_u;
            SELECT charge_max INTO chargePoney FROM PONEY WHERE id_po = NEW.id_po;
            IF poidCavalier > chargePoney THEN
                SET mes = CONCAT(mes, "Ajout impossible car le cavalier ", NEW.id_u, " pèse ", poidCavalier, "kg et le poney ", NEW.id_po, " supporte une charge max de ", chargePoney, "kg.");
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_nbInscritInferieurMaxInscriptionInsert(self) -> str:
        return """
        CREATE TRIGGER nbInscritInferieurMaxInscriptionInsert 
        BEFORE INSERT ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE nbInscrit INT;
            DECLARE maxInscription INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            SELECT COUNT(*) INTO nbInscrit FROM RESERVER WHERE id_c=NEW.id_c GROUP BY id_c;
            SELECT nb_pe INTO maxInscription FROM COURS WHERE id_c=NEW.id_c;
            IF nbInscrit >= maxInscription THEN
                SET mes = CONCAT(mes, "Ajout impossible car le cours à déjà le nombre max d'inscrit (", maxInscription, ")");
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_nbInscritInferieurMaxInscriptionUpdate(self) -> str:
        return """
        CREATE TRIGGER nbInscritInferieurMaxInscriptionUpdate 
        BEFORE UPDATE ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE nbInscrit INT;
            DECLARE maxInscription INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            SELECT COUNT(*) INTO nbInscrit FROM RESERVER WHERE id_c=NEW.id_c GROUP BY id_c;
            SELECT nb_pe INTO maxInscription FROM COURS WHERE id_c=NEW.id_c;
            IF nbInscrit >= maxInscription THEN
                SET mes = CONCAT(mes, "Ajout impossible car le cours à déjà le nombre max d'inscrit (", maxInscription, ")");
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_pasDeCheuvauchementAdherantInsert(self) -> str:
        return """
        CREATE TRIGGER pasDeCheuvauchementAdherantInsert 
        BEFORE INSERT ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE heureAvant INT;
            DECLARE heureApres INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            DECLARE dureeAvant INT;
            DECLARE heureCours INT;
            DECLARE dureeCours INT;
            DECLARE dateCours DATE;
            SELECT h_de_debut, duree, date_c INTO heureCours, dureeCours, dateCours FROM COURS WHERE id_c = NEW.id_c;
            SELECT h_de_debut, duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut < heureCours AND id_u = NEW.id_u
            ORDER BY h_de_debut DESC LIMIT 1;
            SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut > heureCours AND id_u = NEW.id_u
            ORDER BY h_de_debut LIMIT 1;
            IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours, ". Pour l'adhérant", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
            IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours, ". Pour l'adhérant", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_pasDeCheuvauchementAdherantUpdate(self) -> str:
        return """
        CREATE TRIGGER pasDeCheuvauchementAdherantUpdate 
        BEFORE UPDATE ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE heureAvant INT;
            DECLARE heureApres INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            DECLARE dureeAvant INT;
            DECLARE heureCours INT;
            DECLARE dureeCours INT;
            DECLARE dateCours DATE;
            SELECT h_de_debut, duree, date_c INTO heureCours, dureeCours, dateCours FROM COURS WHERE id_c = NEW.id_c;
            SELECT h_de_debut, duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut < heureCours AND id_u = NEW.id_u
            ORDER BY h_de_debut DESC LIMIT 1;
            SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut > heureCours AND id_u = NEW.id_u
            ORDER BY h_de_debut LIMIT 1;
            IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours, ". Pour l'adhérant", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
            IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours, ". Pour l'adhérant", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """
    
    def trigger_pasDeCheuvauchementPoneyInsert(self) -> str:
        return """
        CREATE TRIGGER pasDeCheuvauchementPoneyInsert 
        BEFORE INSERT ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE heureAvant INT;
            DECLARE heureApres INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            DECLARE dureeAvant INT;
            DECLARE heureCours INT;
            DECLARE dureeCours INT;
            DECLARE dateCours DATE;
            SELECT h_de_debut, duree, date_c INTO heureCours, dureeCours, dateCours FROM COURS WHERE id_c = NEW.id_c;
            SELECT h_de_debut, duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut < heureCours AND id_po = NEW.id_po
            ORDER BY h_de_debut DESC LIMIT 1;
            SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut > heureCours AND id_po = NEW.id_po
            ORDER BY h_de_debut LIMIT 1;
            IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours, ". pour le poney ", NEW.id_po);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
            IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours, ". pour le poney ", NEW.id_po);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_pasDeCheuvauchementPoneyUpdate(self) -> str:
        return """
        CREATE TRIGGER pasDeCheuvauchementPoneyUpdate 
        BEFORE UPDATE ON RESERVER 
        FOR EACH ROW
        BEGIN
            DECLARE heureAvant INT;
            DECLARE heureApres INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            DECLARE dureeAvant INT;
            DECLARE heureCours INT;
            DECLARE dureeCours INT;
            DECLARE dateCours DATE;
            SELECT h_de_debut, duree, date_c INTO heureCours, dureeCours, dateCours FROM COURS WHERE id_c = NEW.id_c;
            SELECT h_de_debut, duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut < heureCours AND id_po = NEW.id_po
            ORDER BY h_de_debut DESC LIMIT 1;
            SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
            WHERE date_c = dateCours AND h_de_debut > heureCours AND id_po = NEW.id_po
            ORDER BY h_de_debut LIMIT 1;
            IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours, ". pour le poney ", NEW.id_po);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
            IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours, ". pour le poney ", NEW.id_po);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_pasDeCheuvauchementMoniteurInsert(self) -> str:
        return """
        CREATE TRIGGER pasDeCheuvauchementMoniteurInsert 
        BEFORE INSERT ON COURS 
        FOR EACH ROW
        BEGIN
            DECLARE heureAvant INT;
            DECLARE heureApres INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            DECLARE dureeAvant INT;
            SELECT h_de_debut, duree INTO heureAvant, dureeAvant FROM COURS 
            WHERE date_c = NEW.date_c AND h_de_debut < NEW.h_de_debut AND id_u = NEW.id_u
            ORDER BY h_de_debut DESC LIMIT 1;
            SELECT h_de_debut INTO heureApres FROM COURS 
            WHERE date_c = NEW.date_c AND h_de_debut > NEW.h_de_debut AND id_u = NEW.id_u
            ORDER BY h_de_debut LIMIT 1;
            IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND NEW.h_de_debut < heureAvant + dureeAvant THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours précédent sur le créneau ", NEW.h_de_debut, "-", NEW.h_de_debut+NEW.duree, ". Pour le moniteur", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
            IF heureApres IS NOT NULL AND NEW.h_de_debut + NEW.duree > heureApres THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours suivant sur le créneau ", NEW.h_de_debut, "-", NEW.h_de_debut+NEW.duree, ". Pour le moniteur", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """

    def trigger_pasDeCheuvauchementMoniteurUpdate(self) -> str:
        return """
        CREATE TRIGGER pasDeCheuvauchementMoniteurUpdate 
        BEFORE UPDATE ON COURS 
        FOR EACH ROW
        BEGIN
            DECLARE heureAvant INT;
            DECLARE heureApres INT;
            DECLARE mes VARCHAR(100) DEFAULT '';
            DECLARE dureeAvant INT;
            SELECT h_de_debut, duree INTO heureAvant, dureeAvant FROM COURS 
            WHERE date_c = NEW.date_c AND h_de_debut < NEW.h_de_debut AND id_u = NEW.id_u
            ORDER BY h_de_debut DESC LIMIT 1;
            SELECT h_de_debut INTO heureApres FROM COURS 
            WHERE date_c = NEW.date_c AND h_de_debut > NEW.h_de_debut AND id_u = NEW.id_u
            ORDER BY h_de_debut LIMIT 1;
            IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND NEW.h_de_debut < heureAvant + dureeAvant THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours précédent sur le créneau ", NEW.h_de_debut, "-", NEW.h_de_debut+NEW.duree, ". Pour le moniteur", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
            IF heureApres IS NOT NULL AND NEW.h_de_debut + NEW.duree > heureApres THEN
                SET mes = CONCAT(mes, "Ajout impossible car il existe déjà un cours suivant sur le créneau ", NEW.h_de_debut, "-", NEW.h_de_debut+NEW.duree, ". Pour le moniteur", NEW.id_u);
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mes;
            END IF;
        END;
        """
