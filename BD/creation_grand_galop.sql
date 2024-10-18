DROP TABLE IF EXISTS RESERVER;
DROP TABLE IF EXISTS COURS;
DROP TABLE IF EXISTS ADHERENT;
DROP TABLE IF EXISTS MONITEUR;
DROP TABLE IF EXISTS PONEY;

CREATE TABLE PONEY (
    id_po INT,
    nom_po VARCHAR(42),
    charge_max DECIMAL(4,2),
    PRIMARY KEY(id_po)
);

CREATE TABLE ADHERENT (
    id_a INT,
    nom_a VARCHAR(42),
    prenom_a VARCHAR(42),
    date_de_naissance DATE,
    poids DECIMAL(3,2),
    email VARCHAR(42),
    PRIMARY KEY (id_a)
);

CREATE TABLE MONITEUR (
    id_m INT,
    nom_m VARCHAR(42),
    prenom_m VARCHAR(42),
    date_de_naissance DATE,
    poids DECIMAL(3,2),
    email VARCHAR(42),
    PRIMARY KEY (id_m)
);

CREATE TABLE COURS (
    id_c INT,
    id_m INT,
    nb_pe INT CHECK (nb_pe <= 10 AND nb_pe >= 1),
    h_de_debut INT,
    duree INT CHECK (duree = 1 OR duree = 2),
    date_c DATE,
    prix DECIMAL(5,2),
    PRIMARY KEY (id_c)
);

CREATE TABLE RESERVER(
    id_a INT,
    id_po INT,
    id_c INT,
    PRIMARY KEY (id_a,id_po,id_c)
);

ALTER TABLE COURS ADD FOREIGN KEY (id_m) REFERENCES MONITEUR (id_m);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_a) REFERENCES ADHERENT (id_a);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_po) REFERENCES PONEY (id_po);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_c) REFERENCES COURS (id_c);