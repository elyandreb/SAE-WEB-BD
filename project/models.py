"""
module sqlalchemy
"""
from datetime import date
from sqlalchemy import CheckConstraint, text
from flask_login import UserMixin
from .app import db, login_manager



class Poney(db.Model):
    """classe de Poney
    """
    __tablename__ = 'PONEY'
    id_po = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nom_po = db.Column(db.String(42))
    charge_max = db.Column(db.Numeric(4, 2))
    reservations = db.relationship('Reserver', back_populates='poney')

    @classmethod
    def get_poneys(cls) :
        """getter des poneys

        Returns:
            list(Poney): la liste des poneys
        """        
        return cls.query.all()

    @classmethod
    def get_poney_reserves(cls):
        """Permet de récupérer les poneys réservés au moins une fois

        Returns:
            list(Poney): La liste des poneys réservés au moins une fois
        """
        return cls.query.join(Reserver).distinct().all()

    @classmethod
    def verifier_charge(cls, poney_id, nouvelle_charge):
        """Permet de vérifier si la nouvelle charge 
        est compatible avec le poney

        Args:
            poney_id (int): l'id du poney
            nouvelle_charge (str): la nouvelle charge a tester

        Returns:
            (boolean, str): True si la charge est valide, False sinon 
            + un message indiquant plus précisément le pourquoi du comment
        """
        poney = cls.query.get(poney_id)
        if not poney:
            return False, "Poney non trouvé."

        for reservation in poney.reservations:
            utilisateur = reservation.user
            if utilisateur.poids > nouvelle_charge:
                return False, (f"L'utilisateur {utilisateur.nom_u} {utilisateur.prenom_u} "
                               "dépasse la nouvelle charge maximale.")

        return True, "La nouvelle charge est suffisante pour tous les utilisateurs."
    
    @classmethod
    def get_other_poneys(cls, poneys_reserves) :
        return cls.query.filter(
            cls.id_po.notin_(poneys_reserves)).all()


class Utilisateur(db.Model, UserMixin):
    """classe d'Utilisateur
    """
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
    def get_adherents(cls):
        """Permet de récupérer les adherents

        Returns:
            list(Utilisateur): la liste des adherents
        """
        return cls.query.filter_by(le_role="adherent").all()

    @classmethod
    def get_moniteurs(cls):
        """Permet de récupérer les moniteurs

        Returns:
            list(Utilisateur): la liste des moniteurs
        """
        return cls.query.filter_by(le_role="moniteur").all()

    @classmethod
    def get_moniteurs_attribues(cls):
        """Permet de récupérer les moniteurs 
        attribués à au moins un cours

        Returns:
            list(Utilisateur): la liste des moniteurs attribués à au moins un cours
        """
        return cls.query.join(Cours, cls.id_u == Cours.id_u).filter(
            cls.le_role == "moniteur").distinct().all()

    @classmethod
    def get_by_email(cls, email):
        """return l'utilisateur grâce à son email

        Args:
            email (str): le mail de l'utilisateur

        Returns:
            Utilisateur: l'Utilisateur trouvé avec son email
        """
        return cls.query.filter_by(email=email).first()


class Reserver(db.Model):
    """classe de Reserver
    """
    __tablename__ = 'RESERVER'
    id_u = db.Column(db.Integer,
                     db.ForeignKey('UTILISATEUR.id_u'),
                     primary_key=True)
    id_po = db.Column(db.Integer, db.ForeignKey('PONEY.id_po'))
    id_c = db.Column(db.Integer, db.ForeignKey('COURS.id_c'), primary_key=True)
    user = db.relationship('Utilisateur', back_populates='reservations')
    poney = db.relationship('Poney', back_populates='reservations')
    cours = db.relationship('Cours', back_populates='reservations')

    @classmethod
    def get_reservations_by_cours(cls, id_cours) :
        """getter des réservations d'un cours

        Args:
            id_cours (int): l'id du cours

        Returns:
            list(Reserver): la liste de réservation du cours
        """        
        return cls.query.filter_by(id_c=id_cours).all()
    
    @classmethod
    def get_reservations_by_poney(cls, id_poney) :
        """getter des réservations en fonction du poney

        Args:
            id_poney (int): l'id du poney

        Returns:
            list(Reserver): la liste de réservation du poney
        """        
        return cls.query.filter_by(id_po=id_poney).all()
    
    @classmethod
    def get_reservations_by_utilisateur(cls, id_u) :
        """getter des réservations en fonction de l'utilisateur

        Args:
            id_u (int): l'id de l'utilisateur

        Returns:
            list(Reserver): la liste de réservation de l'utilisateur
        """        
        return cls.query.filter_by(id_u=id_u).all()
            
    @classmethod
    def get_reservation_utilisateur_by_cours(cls, id_utilisateur, id_cours) :
        """getter des réservations d'un cours

        Args:
            id_cours (int): l'id du cours

        Returns:
            Reserver: la réservation du cours
        """        
        return cls.query.filter_by(
            id_u=id_utilisateur, id_c=id_cours).first()
    
    @classmethod
    def get_nb_inscription(cls, id_cours) :
        """Retourne le nombre d'inscription d'un cours

        Args:
            id_cours (int): l'id du cours choisi

        Returns:
            (int): le nombre d'inscription du cours
        """        
        return cls.query.filter_by(
                id_c=id_cours).count()

class Cours(db.Model):
    """classe de Cours
    """
    __tablename__ = 'COURS'
    id_c = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_u = db.Column(db.Integer, db.ForeignKey('UTILISATEUR.id_u'))  # Moniteur
    nb_pe = db.Column(db.Integer, CheckConstraint("nb_pe <= 10 AND nb_pe >= 1"))
    h_de_debut = db.Column(db.Integer)
    duree = db.Column(db.Integer, CheckConstraint("duree = 1 OR duree = 2"))
    date_c = db.Column(db.Date)
    prix = db.Column(db.Numeric(5, 2))
    reservations = db.relationship('Reserver', back_populates='cours')
    moniteur = db.relationship('Utilisateur', back_populates='cours')

    @classmethod
    def get_cours_remplis(cls):
        """permet de récupérer les cours 
        ayant au moins une réservation

        Returns:
            list(Cours): les cours ayant au moins une réservation
        """
        return cls.query.join(Reserver).distinct().all()

    @classmethod
    def verifier_nb_pe(cls, id_c, nouv_nb_pe):
        """Fonction permettant de vérifier que 
        le nb max de personnes ne soit pas inférieur 
        au nombre de personnes ayant déjà réservées

        Args:
            id_c (int): l'id du cours
            nouv_nb_pe (str): le nouveau nb de personnes max

        Returns:
            (boolean, str): True si le nombre est valide, False sinon 
            + un message indiquant plus précisément le pourquoi du comment
        """
        cours = cls.query.get(id_c)
        if not cours:
            return False, "Cours non trouvé."
        nb_reservations = len(cours.reservations)
        if nouv_nb_pe < nb_reservations:
            return False, ("Le nombre de participants ne peut pas être inférieur "
               f"au nombre de réservations existantes ({nb_reservations}).")

        return True, "Le nombre de participants est valide."
    
    @classmethod
    def get_prochain_cours(cls, adherent_id):
        """Méthode qui retourne le prochain cours de l'utilisateur

        Args:
            adherent_id (int): l'id de l'utilisateur

        Returns:
            Cours: le prochain cours de l'utilisateur
        """        
        return cls.query.join(Reserver).filter(
            Reserver.id_u == adherent_id,
            cls.date_c >= date.today()
        ).order_by(cls.date_c.asc()).first()

    @classmethod
    def get_3_prochain_cours(cls, adherent_id):
        """Méthode qui retourne les 3 prochains cours de l'utilisateur

        Args:
            adherent_id (int): l'id de l'utilisateur

        Returns:
            list(Cours): les 3 prochains cours de l'utilisateur
        """
        return cls.query.filter(cls.id_u == adherent_id, 
                                               cls.date_c >= date.today()).order_by(cls.date_c.asc(), 
                                                                                    cls.h_de_debut.asc()).limit(3).all()
    
    @classmethod
    def get_cours_semaine(cls, semaine_debut, semaine_fin) :
        """Getter des cours compris entre semaine_debut
        et semaine_fin

        Args:
            semaine_debut (date): date de début de la semaine
            semaine_fin (date): date de fin de la semaine

        Returns:
            list(Cours): la liste des cours
            entre semaine_debut et semaine_fin
        """        
        return cls.query.filter(
        cls.date_c.between(semaine_debut, semaine_fin)).order_by(cls.date_c,
                                                  cls.h_de_debut).all()
    
    @classmethod
    def get_cours_by_utilisateur(cls, id_u) :
        return cls.query.filter_by(id_u=id_u).all()
    
    @classmethod
    def get_cours_semaine_utilisateur(cls, id_u, semaine_debut, semaine_fin) :
        """Getter des cours compris entre semaine_debut
        et semaine_fin

        Args:
            semaine_debut (date): date de début de la semaine
            semaine_fin (date): date de fin de la semaine

        Returns:
            list(Cours): la liste des cours
            entre semaine_debut et semaine_fin
        """        
        return cls.query.filter( cls.id_u == id_u,
        cls.date_c.between(semaine_debut, semaine_fin)).order_by(cls.date_c,
                                                  cls.h_de_debut).all()
class Cotiser(db.Model):
    """classe de Cotiser
    """
    __tablename__ = 'COTISER'
    id_u = db.Column(db.Integer,
                     db.ForeignKey('UTILISATEUR.id_u'),
                     primary_key=True)
    annee_debut = db.Column(db.Integer,
                            db.ForeignKey('COTISATION.annee_debut'),
                            primary_key=True)
    annee_fin = db.Column(db.Integer,
                          db.ForeignKey('COTISATION.annee_fin'),
                          primary_key=True)
    paye = db.Column(db.Boolean)
    user = db.relationship('Utilisateur', back_populates='cotisations')

    cotisation = db.relationship(
        'Cotisation',
        back_populates='cotisants',
        primaryjoin=("and_(Cotiser.annee_debut == Cotisation.annee_debut, "
                     "Cotiser.annee_fin == Cotisation.annee_fin)"),
        foreign_keys=[annee_debut, annee_fin])
    
    @classmethod
    def get_cotisation_by_utilisateur(cls, id_u) :
        return cls.query.filter_by(id_u=id_u).all()

    @classmethod
    def get_cotisation_by_utilisateur_annee(cls, id_u, annee_debut, annee_fin) :
        return cls.query.filter_by(id_u=id_u,
                                             annee_debut=annee_debut,
                                             annee_fin=annee_fin).first()


class Cotisation(db.Model):
    """classe de Cotisation
    """
    __tablename__ = 'COTISATION'
    annee_debut = db.Column(db.Integer, primary_key=True)
    annee_fin = db.Column(db.Integer, primary_key=True)
    cotisants = db.relationship(
        'Cotiser',
        back_populates='cotisation',
        primaryjoin=("and_(Cotiser.annee_debut == Cotisation.annee_debut, "
                     "Cotiser.annee_fin == Cotisation.annee_fin)"),
        foreign_keys="[Cotiser.annee_debut, Cotiser.annee_fin]")


@login_manager.user_loader
def load_user(user_id):
    """fonction pour load l'Utilisateur

    Args:
        user_id (str): l'id de l'User

    Returns:
        Utilisateur: l'Utilisateur
    """
    return Utilisateur.query.get(int(user_id))


class TriggerManager:
    """classe des triggers
    """

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

    def trigger_cavalier_moins_charge_poney_insert(self) -> str:
        """trigger qui test si un cavalier à un poids plus
        petit que la charge max du poney avant un insert

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER cavalier_moins_charge_poney_insert 
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

    def trigger_cavalier_moins_charge_poney_update(self) -> str:
        """trigger qui test si un cavalier à un poids plus
        petit que la charge max du poney avant un update

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER cavalier_moins_charge_poneyUpdate 
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

    def trigger_nb_inscrit_inferieur_max_inscription_insert(self) -> str:
        """trigger qui vérifie s'il reste une place dans la réservation
        avant un insert

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER nb_inscrit_inferieur_max_inscription_insert 
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

    def trigger_nb_inscrit_inferieur_max_inscription_update(self) -> str:
        """trigger qui vérifie s'il reste une place dans la réservation
        avant un update

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER nb_inscrit_inferieur_max_inscription_update 
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

    def trigger_pas_de_cheuvauchement_adherant_insert(self) -> str:
        """trigger qui vérifie qu'il n'y est pas de chevauchement
        de cours pour un adhérent avant un insert

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER pas_de_cheuvauchement_adherant_insert 
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

    def trigger_pas_de_cheuvauchement_adherant_update(self) -> str:
        """trigger qui vérifie qu'il n'y est pas de chevauchement
        de cours pour un adhérent avant un update

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER pas_de_cheuvauchement_adherant_update 
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

    def trigger_pas_de_cheuvauchement_poney_insert(self) -> str:
        """trigger qui vérifie qu'il n'y est pas de chevauchement
        de cours pour un poney avant un insert

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER pas_de_cheuvauchement_poney_insert 
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

    def trigger_pas_de_cheuvauchement_poney_update(self) -> str:
        """trigger qui vérifie qu'il n'y est pas de chevauchement
        de cours pour un poney avant un update

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER pas_de_cheuvauchement_poney_update 
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

    def trigger_pas_de_cheuvauchement_moniteur_insert(self) -> str:
        """trigger qui vérifie qu'il n'y est pas de chevauchement
        de cours pour un moniteur avant un insert

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER pas_de_cheuvauchement_moniteur_insert 
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

    def trigger_pas_de_cheuvauchement_moniteur_update(self) -> str:
        """trigger qui vérifie qu'il n'y est pas de chevauchement
        de cours pour un moniteur avant un update

        Returns:
            str: le trigger
        """
        return """
        CREATE TRIGGER pas_de_cheuvauchement_moniteur_update 
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
