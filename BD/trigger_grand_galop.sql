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
        set mes = concat(mes,"Ajout impossible car le cavalier ",new.id_a, " pèse ",poidCavalier,"kg et le poney ", new.id_po," supporte un charge max de ",chargePoney,"kg.");
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
        set mes = concat(mes,"Ajout impossible car le cavalier",new.id_a, "pèse ",poidCavalier,"kg et le poney ", new.id_po, "  supporte un charge max de ",chargePoney,"kg.");
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
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours,". Pour l'adhérant",new.id_a);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut ajouter
    IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours,". Pour l'adhérant",new.id_a);
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
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours,". Pour l'adhérant",new.id_a);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut modifier
    IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours,". Pour l'adhérant",new.id_a);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;


--Trigger vérifiant si les cours d'un poney ne se chevauchent pas (insert)

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchementPoneyInsert before insert on RESERVER for each row
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
    WHERE date_c = dateCours AND h_de_debut < heureCours AND id_po = new.id_po
    ORDER BY h_de_debut DESC LIMIT 1;

    -- on récupère les info du plus proche cours suivant
    SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = dateCours AND h_de_debut > heureCours AND id_po = new.id_po
    ORDER BY h_de_debut LIMIT 1;

    -- on verifie que le cours d'avant ne chevauche pas la reservation qu'on veut ajouter
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant  THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours,". pour le poney ",new.id_po);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut ajouter
    IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours,". pour le poney ",new.id_po);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

--Trigger vérifiant si les cours d'un poney ne se chevauchent pas (update)

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchementPoneyUpdate before update on RESERVER for each row
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
    WHERE date_c = dateCours AND h_de_debut < heureCours AND id_po = new.id_po
    ORDER BY h_de_debut DESC LIMIT 1;

    -- on récupère les info du plus proche cours suivant
    SELECT h_de_debut INTO heureApres FROM RESERVER NATURAL JOIN COURS 
    WHERE date_c = dateCours AND h_de_debut > heureCours AND id_po = new.id_po
    ORDER BY h_de_debut LIMIT 1;

    -- on verifie que le cours d'avant ne chevauche pas la reservation qu'on veut modifier
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND heureCours < heureAvant + dureeAvant  THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", heureCours, "-", heureCours+dureeCours,". pour le poney ",new.id_po);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut modifier
    IF heureApres IS NOT NULL AND heureCours + dureeCours > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", heureCours, "-", heureCours+dureeCours,". pour le poney ",new.id_po);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;


--Trigger vérifiant si les cours d'un moniteur ne se chevauchent pas (insert)

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchementMoniteurInsert before insert on COURS for each row
begin
    DECLARE heureAvant INT;
    DECLARE heureApres INT;
    DECLARE mes VARCHAR(100) default '';
    DECLARE dureeAvant INT;
    
    -- on récupère les info du plus proche cours précédent
    SELECT h_de_debut,duree INTO heureAvant, dureeAvant FROM COURS 
    WHERE date_c = new.date_c AND h_de_debut < new.h_de_debut AND id_m = new.id_m
    ORDER BY h_de_debut DESC LIMIT 1;

    -- on récupère les info du plus proche cours suivant
    SELECT h_de_debut INTO heureApres FROM COURS 
    WHERE date_c = new.date_c AND h_de_debut > new.h_de_debut AND id_m = new.id_m
    ORDER BY h_de_debut LIMIT 1;

    -- on verifie que le cours d'avant ne chevauche pas la reservation qu'on veut ajouter
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND new.h_de_debut < heureAvant + dureeAvant THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", new.h_de_debut, "-", new.h_de_debut+new.duree,". Pour le moniteur",new.id_m);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut ajouter
    IF heureApres IS NOT NULL AND new.h_de_debut + new.duree > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", new.h_de_debut, "-", new.h_de_debut+new.duree,". Pour le moniteur",new.id_m);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;

--Trigger vérifiant si les cours d'un moniteur ne se chevauchent pas (update)

delimiter |
CREATE OR REPLACE TRIGGER pasDeCheuvauchementMoniteurUpdate before update on COURS for each row
begin
    DECLARE heureAvant INT;
    DECLARE heureApres INT;
    DECLARE mes VARCHAR(100) default '';
    DECLARE dureeAvant INT;

    -- on récupère les info du plus proche cours précédent
    SELECT h_de_debut,duree INTO heureAvant, dureeAvant FROM COURS 
    WHERE date_c = new.date_c AND h_de_debut < new.h_de_debut AND id_m = new.id_m
    ORDER BY h_de_debut DESC LIMIT 1;

    -- on récupère les info du plus proche cours suivant
    SELECT h_de_debut INTO heureApres FROM COURS 
    WHERE date_c = new.date_c AND h_de_debut > new.h_de_debut AND id_m = new.id_m
    ORDER BY h_de_debut LIMIT 1;

    -- on verifie que le cours d'avant ne chevauche pas la reservation qu'on veut modifier
    IF heureAvant IS NOT NULL AND dureeAvant IS NOT NULL AND new.h_de_debut < heureAvant + dureeAvant  THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours précédent sur le créneau ", new.h_de_debut, "-", new.h_de_debut+new.duree,". Pour le moniteur",new.id_m);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
    -- on verifie que le cours d'après ne chevauche pas la reservation qu'on veut modifier
    IF heureApres IS NOT NULL AND new.h_de_debut + new.duree > heureApres THEN
        SET mes = concat(mes,"Ajout impossible car il existe déjà un cours suivant sur le créneau ", new.h_de_debut, "-", new.h_de_debut+new.duree,". Pour le moniteur",new.id_m);
        signal SQLSTATE '45000' SET MESSAGE_TEXT = mes ;
    end if;
end|
delimiter ;