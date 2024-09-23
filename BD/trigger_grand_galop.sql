-- Trigger pour verifier que le poid du cavalier est inférieure à la charge max du poney

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

-- insert temporaires de test

insert into PONEY(id_po,nom_po,charge_max) values
(1,"Nathanael",30),
(2,"Joe",40);

insert into PERSONNE(id_pe,nom_pe,prenom_pe,age,categorie,poids,email) values
(1,"Smith","John",14,"adherant",39,"john.smith"),
(2,"Lenon","Harry",8,"adherant",27.5,"harry.lenon"),
(3,"Marley","Johnson",25,"moniteur",65,"johnson.marley");

insert into COURS(id_c,id_pe,nb_pe,h_de_debut,duree,date_c) values
(1,3,10,15,1,NOW()),
(2,3,5,17,1,NOW());

insert into RESERVER values
(1,2,1),
(2,1,1),
(2,2,2),
(1,1,2);