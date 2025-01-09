DROP TABLE IF EXISTS RESERVER;
DROP TABLE IF EXISTS COTISER;
DROP TABLE IF EXISTS COURS;
DROP TABLE IF EXISTS COTISATION;
DROP TABLE IF EXISTS UTILISATEUR;
DROP TABLE IF EXISTS PONEY;

CREATE TABLE PONEY (
    id_po INT,
    nom_po VARCHAR(42),
    charge_max DECIMAL(4,2),
    PRIMARY KEY(id_po)
);

CREATE TABLE UTILISATEUR (
    id_u INT,
    nom_u VARCHAR(42),
    prenom_u VARCHAR(42),
    date_de_naissance DATE,
    poids DECIMAL(4,2),
    email VARCHAR(42),
    mdp VARCHAR(128),
    le_role ENUM("admin", "adherent", "moniteur"),
    PRIMARY KEY (id_u)
);

CREATE TABLE COTISATION (
    annee_debut YEAR,
    annee_fin YEAR,
    PRIMARY KEY (annee_debut, annee_fin)
);


CREATE TABLE COURS (
    id_c INT,
    id_u INT,
    nb_pe INT CHECK (nb_pe <= 10 AND nb_pe >= 1),
    h_de_debut INT,
    duree INT CHECK (duree = 1 OR duree = 2),
    date_c DATE,
    prix DECIMAL(5,2),
    PRIMARY KEY (id_c)
);

CREATE TABLE RESERVER(
    id_u INT,
    id_po INT,
    id_c INT,
    PRIMARY KEY (id_u,id_po,id_c)
);

CREATE TABLE COTISER (
    id_u INT,
    annee_debut YEAR,
    annee_fin YEAR,
    paye BOOLEAN,
    PRIMARY KEY (id_u, annee_debut, annee_fin)
);

ALTER TABLE COURS ADD FOREIGN KEY (id_u) REFERENCES UTILISATEUR (id_u);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_u) REFERENCES UTILISATEUR (id_u);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_po) REFERENCES PONEY (id_po);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_c) REFERENCES COURS (id_c);
ALTER TABLE COTISER ADD FOREIGN KEY (id_u) REFERENCES UTILISATEUR (id_u);
ALTER TABLE COTISER ADD FOREIGN KEY (annee_debut, annee_fin) REFERENCES COTISATION (annee_debut, annee_fin);