DROP TABLE IF EXISTS RESERVER;
DROP TABLE IF EXISTS COURS;
DROP TABLE IF EXISTS PERSONNE;
DROP TABLE IF EXISTS PONEY;

CREATE TABLE PONEY (
    id_po INT,
    nom_po VARCHAR(42),
    charge_max DECIMAL(3,2),
    PRIMARY KEY(id_po)
);

CREATE TABLE PERSONNE (
    id_pe INT,
    nom_pe VARCHAR(42),
    prenom_pe VARCHAR(42),
    age INT,
    categorie VARCHAR(10),
    poids DECIMAL(3,2),
    email VARCHAR(42),
    PRIMARY KEY (id_pe)
);

CREATE TABLE COURS (
    id_c INT,
    id_pe INT,
    nb_pe INT CHECK (nb_pe <= 10 AND nb_pe >= 1),
    h_de_debut TIME,
    duree INT CHECK (duree = 1 OR duree = 2),
    date_c DATE,
    PRIMARY KEY (id_c)
);

CREATE TABLE RESERVER(
    id_pe INT,
    id_po INT,
    id_c INT,
    PRIMARY KEY (id_pe,id_po,id_c)
);

ALTER TABLE COURS ADD FOREIGN KEY (id_pe) REFERENCES PERSONNE (id_pe);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_pe) REFERENCES PERSONNE (id_pe);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_po) REFERENCES PONEY (id_po);
ALTER TABLE RESERVER ADD FOREIGN KEY (id_c) REFERENCES COURS (id_c);