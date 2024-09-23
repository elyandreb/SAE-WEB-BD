-- Triggers verifiant que le poid du cavalier est inférieur à la charge max du poney

delimiter |
CREATE OR REPLACE TRIGGER cavalierMoinsChargePoneyInsert before insert on RESERVER for each row
begin
    DECLARE poidCavalier INT;
    DECLARE chargePoney INT;
    DECLARE mes VARCHAR(100) default '';
    select poids into poidCavalier from PERSONNE where id_pe = new.id_pe;
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
    select poids into poidCavalier from PERSONNE where id_pe = new.id_pe;
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

--Trigger vérifiant si les cours d'une personne ne se chevauchent pas

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchement before insert on RESERVER for each row
begin
    DECLARE heureAvant INT;
    DECLARE heureApres INT;
    DECLARE dureeCours INT;
    DECLARE mes VARCHAR(100) default '';
    DECLARE dureeAvant INT;
    DECLARE heureCours INT;

    SELECT h_de_debut,duree INTO heureAvant, dureeAvant FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = new.date_c AND h_de_debut < new.h_de_debut AND id_pe = new.id_pe 
    ORDER BY h_de_debut DESC LIMIT 1;

    SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = new.date_c AND h_de_debut > new.h_de_debut AND id_pe = new.id_pe 
    ORDER BY h_de_debut LIMIT 1;

    SELECT h_de_debut, duree INTO heureCours, dureeCours FROM RESERVER NATURAL JOIN COURS WHERE id_c = new.id_c;
    
    IF heureCours < heureAvant + dureeAvant OR heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours sur le créneau ", heureCours, "-", heureCours+dureeCours".");
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

insert into PERSONNE(id_pe,nom_pe,prenom_pe,age,categorie,poids,email) values
(1,"Smith","John",14,"adherant",39,"john.smith"),
(2,"Lenon","Harry",8,"adherant",27.5,"harry.lenon"),
(4,"Fred","Bob",8,"adherant",27.5,"harry.lenon"),
(5,"Sobas","Sebastien",8,"adherant",24.5,"harry.lenon"),
(3,"Marley","Johnson",25,"moniteur",65,"johnson.marley"),
(6,"Jedusor","Tom",25,"moniteur",65,"tom.jedusor");

insert into COURS(id_c,id_pe,nb_pe,h_de_debut,duree,date_c) values
(1,3,10,15,1,NOW()),
(2,3,3,17,1,NOW()),
(3,6,9,14,2, NOW());

insert into RESERVER(id_pe,id_po,id_c) values(1,2,1);
insert into RESERVER(id_pe,id_po,id_c) values(2,1,1);
insert into RESERVER(id_pe,id_po,id_c) values(1,2,2);
insert into RESERVER(id_pe,id_po,id_c) values(2,1,2);
insert into RESERVER(id_pe,id_po,id_c) values(4,3,2);
insert into RESERVER(id_pe,id_po,id_c) values(5,4,2);
INSERT INTO RESERVER VALUES (1,2,3);