-- Triggers verifiant que le poid du cavalier est inférieur à la charge max du poney

delimiter |
CREATE OR REPLACE TRIGGER cavalierMoinsChargePoneyInsert before insert on RESERVER for each row
begin
    DECLARE poidCavalier INT;
    DECLARE chargePoney INT;
    DECLARE mes VARCHAR(100) default '';
    select poids into poidCavalier from ADHERENT where id_a = new.id_a;
    select charge_max into chargePoney from PONEY where id_po = new.id_po;
    if poidCavalier > chargePoney then
        set mes = concat(mes,"Ajout impossible car le cavalier pèse ",poidCavalier,"kg et le poney supporte un charge max de ",chargePoney,"kg.");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

delimiter |
CREATE OR REPLACE TRIGGER cavalierMoinsChargePoneyUpdate before update on RESERVER for each row
begin
    DECLARE poidCavalier INT;
    DECLARE chargePoney INT;
    DECLARE mes VARCHAR(100) default '';
    select poids into poidCavalier from ADHERENT where id_a = new.id_a;
    select charge_max into chargePoney from PONEY where id_po = new.id_po;
    if poidCavalier > chargePoney then
        set mes = concat(mes,"Ajout impossible car le cavalier pèse ",poidCavalier,"kg et le poney supporte un charge max de ",chargePoney,"kg.");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

-- Triggers verifiant que le nombre d'élève inscrit est inferieur aux nombre max d'eleve au cours

delimiter |
CREATE OR REPLACE TRIGGER nbInscritInferieurMaxInscriptionInsert before insert on RESERVER for each row
begin
    DECLARE nbInscrit INT;
    DECLARE maxInscription INT;
    DECLARE mes VARCHAR(100) default '';
    select count(*) into nbInscrit from RESERVER where id_c=new.id_c GROUP BY id_c;
    select nb_pe into maxInscription from COURS where id_c=new.id_c;
    if nbInscrit >= maxInscription then
        set mes = concat(mes,"Ajout impossible car le cours à déjà le nombre max d'inscrit (",maxInscription,")");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

delimiter |
CREATE OR REPLACE TRIGGER nbInscritInferieurMaxInscriptionUpdate before update on RESERVER for each row
begin
    DECLARE nbInscrit INT;
    DECLARE maxInscription INT;
    DECLARE mes VARCHAR(100) default '';
    select count(*) into nbInscrit from RESERVER where id_c=new.id_c GROUP BY id_c;
    select nb_pe into maxInscription from COURS where id_c=new.id_c;
    if nbInscrit >= maxInscription then
        set mes = concat(mes,"Ajout impossible car le cours à déjà le nombre max d'inscrit (",maxInscription,")");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

--Trigger vérifiant si les cours d'un adhérant ne se chevauchent pas (insert)

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchementAdherantInsert before insert on RESERVER for each row
begin
    DECLARE heureAvant INT;
    DECLARE heureApres INT;
    DECLARE mes VARCHAR(100) default '';
    DECLARE dureeAvant INT;
    DECLARE heureCours INT;
    DECLARE dureeCours INT;
    DECLARE dateCours INT;

    -- on recupère les donnée sur le cour
    SELECT h_de_debut, duree, date_c INTO heureCours, dureeCours, dateCours FROM COURS WHERE id_c = new.id_c;
    
    -- on récupère les info du plus proche cours précédent
    SELECT h_de_debut,duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = dateCours AND h_de_debut < heureCours AND id_a = new.id_a
    ORDER BY h_de_debut DESC LIMIT 1;

    -- on récupère les info du plus proche cours suivant
    SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = dateCours AND h_de_debut > heureCours AND id_a = new.id_a
    ORDER BY h_de_debut LIMIT 1;

    -- on verifie que le cours d'avant ne chevauche pas la reservation qu'on veut ajouter
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant  THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours,".");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut ajouter
    IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours,".");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

--Trigger vérifiant si les cours d'un adhérant ne se chevauchent pas (update)

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchementAdherantUpdate before update on RESERVER for each row
begin
    DECLARE heureAvant INT;
    DECLARE heureApres INT;
    DECLARE mes VARCHAR(100) default '';
    DECLARE dureeAvant INT;
    DECLARE heureCours INT;
    DECLARE dureeCours INT;
    DECLARE dateCours INT;

    -- on recupère les donnée sur le cour
    SELECT h_de_debut, duree, date_c INTO heureCours, dureeCours, dateCours FROM COURS WHERE id_c = new.id_c;
    
    -- on récupère les info du plus proche cours précédent
    SELECT h_de_debut,duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = dateCours AND h_de_debut < heureCours AND id_a = new.id_a
    ORDER BY h_de_debut DESC LIMIT 1;

    -- on récupère les info du plus proche cours suivant
    SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = dateCours AND h_de_debut > heureCours AND id_a = new.id_a
    ORDER BY h_de_debut LIMIT 1;

    -- on verifie que le cours d'avant ne chevauche pas la reservation qu'on veut modifier
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant  THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours,".");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut modifier
    IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours,".");
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

-- insert temporaires de test

insert into PONEY(id_po,nom_po,charge_max) values
(1,"Nathanael",30),
(2,"Joe",40),
(3,"BigGuy",50),
(4,"Joey",25);

insert into ADHERENT values
(1,"Smith","John",STR_TO_DATE("10/10/2010", "%d/%m/%Y"),39.0,"john.smith"), -- date mauvaise par rapport au NOW()
(2,"Lenon","Harry",STR_TO_DATE("10/10/2010", "%d/%m/%Y"),27.5,"harry.lenon"),
(4,"Fred","Bob",STR_TO_DATE("10/10/2010", "%d/%m/%Y"),27.5,"harry.lenon"),
(5,"Sobas","Sebastien",STR_TO_DATE("10/10/2010", "%d/%m/%Y"),24.5,"harry.lenon");

INSERT into MONITEUR VALUES
(1,"Marley","Johnson",STR_TO_DATE("10/10/1999", "%d/%m/%Y"),65,"johnson.marley"),
(2,"Jedusor","Tom",STR_TO_DATE("10/10/2000", "%d/%m/%Y"),65,"tom.jedusor");

insert into COURS(id_c,id_m,nb_pe,h_de_debut,duree,date_c) values (1,1,10,15,1,NOW());
insert into COURS(id_c,id_m,nb_pe,h_de_debut,duree,date_c) values(2,1,3,17,1,NOW());
insert into COURS(id_c,id_m,nb_pe,h_de_debut,duree,date_c) values (3,2,9,14,2, NOW());
insert into COURS(id_c,id_m,nb_pe,h_de_debut,duree,date_c) values (4,1,9,15,2, NOW());

insert into RESERVER(id_a,id_po,id_c) values(1,2,1);
insert into RESERVER(id_a,id_po,id_c) values(2,1,1);
insert into RESERVER(id_a,id_po,id_c) values(1,2,2);
insert into RESERVER(id_a,id_po,id_c) values(2,1,2);
insert into RESERVER(id_a,id_po,id_c) values(4,3,2);
insert into RESERVER(id_a,id_po,id_c) values(5,4,2);
INSERT INTO RESERVER VALUES (1,2,3);
INSERT INTO RESERVER VALUES (1,2,4);
