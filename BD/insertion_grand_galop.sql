-- Insertions des poneys. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO PONEY (id_po, nom_po, charge_max) VALUES
(1, 'Bella', 23.45),
(2, 'Charlie', 27.89),
(3, 'Daisy', 35.67),
(4, 'Max', 29.34),
(5, 'Luna', 41.23),
(6, 'Rocky', 33.21),
(7, 'Molly', 38.76),
(8, 'Buddy', 24.56),
(9, 'Lucy', 45.67),
(10, 'Jack', 30.12),
(11, 'Sadie', 26.78),
(12, 'Toby', 39.45),
(13, 'Coco', 28.34),
(14, 'Bailey', 42.56),
(15, 'Milo', 31.78),
(16, 'Ruby', 36.89),
(17, 'Oscar', 25.67),
(18, 'Rosie', 44.23),
(19, 'Teddy', 32.45),
(20, 'Lola', 37.89),
(21, 'Leo', 29.56),
(22, 'Zoe', 40.12),
(23, 'Nala', 34.78),
(24, 'Finn', 43.21),
(25, 'Ellie', 27.34),
(26, 'Rex', 46.78),
(27, 'Penny', 30.45),
(28, 'Archie', 35.12),
(29, 'Maggie', 28.89),
(30, 'Duke', 41.67);


-- Insertion de 100 adhérents générés par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO USER (id_u, nom_a, prenom_a, date_de_naissance, poids, email, le_role) VALUES
(1, 'Durand', 'Paul', STR_TO_DATE('10/03/2014', '%d/%m/%Y'), 30.50, 'paul.durand@gmail.com', "adherent"),
(2, 'Petit', 'Marie', STR_TO_DATE('15/06/2012', '%d/%m/%Y'), 35.20, 'marie.petit@yahoo.com', "adherent"),
(3, 'Martin', 'Julien', STR_TO_DATE('18/01/2015', '%d/%m/%Y'), 28.40, 'julien.martin@laposte.fr', "adherent"),
(4, 'Bernard', 'Camille', STR_TO_DATE('22/08/2013', '%d/%m/%Y'), 32.10, 'camille.bernard@wanadoo.fr', "adherent"),
(5, 'Dubois', 'Léon', STR_TO_DATE('30/12/2016', '%d/%m/%Y'), 25.30, 'leon.dubois@gmail.com', "adherent"),
(6, 'Thomas', 'Léa', STR_TO_DATE('03/11/2011', '%d/%m/%Y'), 40.50, 'lea.thomas@yahoo.com', "adherent"),
(7, 'Robert', 'Anna', STR_TO_DATE('11/05/2014', '%d/%m/%Y'), 29.80, 'anna.robert@laposte.fr', "adherent"),
(8, 'Richard', 'Maxime', STR_TO_DATE('19/07/2012', '%d/%m/%Y'), 34.60, 'maxime.richard@wanadoo.fr', "adherent"),
(9, 'Simon', 'Louise', STR_TO_DATE('27/10/2015', '%d/%m/%Y'), 27.90, 'louise.simon@gmail.com', "adherent"),
(10, 'Michel', 'Oscar', STR_TO_DATE('14/02/2013', '%d/%m/%Y'), 31.70, 'oscar.michel@yahoo.com', "adherent"),
(11, 'Lemoine', 'Alice', STR_TO_DATE('04/11/2014', '%d/%m/%Y'), 30.50, 'alice.lemoine@gmail.com', "adherent"),
(12, 'Morel', 'Lucas', STR_TO_DATE('15/06/2012', '%d/%m/%Y'), 35.20, 'lucas.morel@yahoo.com', "adherent"),
(13, 'Garcia', 'Emma', STR_TO_DATE('08/05/2015', '%d/%m/%Y'), 28.40, 'emma.garcia@laposte.fr', "adherent"),
(14, 'Roux', 'Hugo', STR_TO_DATE('22/07/2013', '%d/%m/%Y'), 32.10, 'hugo.roux@wanadoo.fr', "adherent"),
(15, 'Fournier', 'Chloe', STR_TO_DATE('30/09/2016', '%d/%m/%Y'), 25.30, 'chloe.fournier@gmail.com', "adherent"),
(16, 'Girard', 'Louis', STR_TO_DATE('03/01/2011', '%d/%m/%Y'), 40.50, 'louis.girard@yahoo.com', "adherent"),
(17, 'Bonnet', 'Léa', STR_TO_DATE('11/08/2014', '%d/%m/%Y'), 29.80, 'lea.bonnet@laposte.fr', "adherent"),
(18, 'Dupuis', 'Tom', STR_TO_DATE('19/11/2012', '%d/%m/%Y'), 34.60, 'tom.dupuis@wanadoo.fr', "adherent"),
(19, 'Michel', 'Jade', STR_TO_DATE('27/02/2015', '%d/%m/%Y'), 27.90, 'jade.michel@gmail.com', "adherent"),
(20, 'Lemoine', 'Arthur', STR_TO_DATE('14/04/2013', '%d/%m/%Y'), 31.70, 'arthur.lemoine@yahoo.com', "adherent"),
(21, 'Blanc', 'Nina', STR_TO_DATE('10/03/2014', '%d/%m/%Y'), 30.00, 'nina.blanc@gmail.com', "adherent"),
(22, 'Renard', 'Leo', STR_TO_DATE('06/12/2012', '%d/%m/%Y'), 36.00, 'leo.renard@yahoo.com', "adherent"),
(23, 'Marchand', 'Lina', STR_TO_DATE('22/02/2015', '%d/%m/%Y'), 28.00, 'lina.marchand@laposte.fr', "adherent"),
(24, 'Gauthier', 'Ethan', STR_TO_DATE('05/11/2013', '%d/%m/%Y'), 33.00, 'ethan.gauthier@wanadoo.fr', "adherent"),
(25, 'Perrin', 'Mia', STR_TO_DATE('30/01/2016', '%d/%m/%Y'), 26.00, 'mia.perrin@gmail.com', "adherent"),
(26, 'Renaud', 'Noah', STR_TO_DATE('11/05/2011', '%d/%m/%Y'), 41.00, 'noah.renaud@yahoo.com', "adherent"),
(27, 'Barbier', 'Léonie', STR_TO_DATE('17/06/2014', '%d/%m/%Y'), 30.50, 'leonie.barbier@laposte.fr', "adherent"),
(28, 'Lemoine', 'Tom', STR_TO_DATE('09/03/2012', '%d/%m/%Y'), 35.50, 'tom.lemoine@wanadoo.fr', "adherent"),
(29, 'Lefevre', 'Lola', STR_TO_DATE('29/05/2015', '%d/%m/%Y'), 27.50, 'lola.lefevre@gmail.com', "adherent"),
(30, 'Dupont', 'Arthur', STR_TO_DATE('18/02/2013', '%d/%m/%Y'), 32.50, 'arthur.dupont@yahoo.com', "adherent"),
(31, 'Moreau', 'Emma', STR_TO_DATE('23/10/2014', '%d/%m/%Y'), 29.00, 'emma.moreau@gmail.com', "adherent"),
(32, 'Simon', 'Lucas', STR_TO_DATE('03/09/2012', '%d/%m/%Y'), 34.00, 'lucas.simon@yahoo.com', "adherent"),
(33, 'Michel', 'Chloe', STR_TO_DATE('11/11/2015', '%d/%m/%Y'), 28.50, 'chloe.michel@laposte.fr', "adherent"),
(34, 'Garcia', 'Hugo', STR_TO_DATE('21/06/2013', '%d/%m/%Y'), 33.50, 'hugo.garcia@wanadoo.fr', "adherent"),
(35, 'Roux', 'Léa', STR_TO_DATE('17/04/2016', '%d/%m/%Y'), 25.50, 'lea.roux@gmail.com', "adherent"),
(36, 'Fournier', 'Louis', STR_TO_DATE('13/11/2011', '%d/%m/%Y'), 40.00, 'louis.fournier@yahoo.com', "adherent"),
(37, 'Girard', 'Alice', STR_TO_DATE('05/05/2014', '%d/%m/%Y'), 30.20, 'alice.girard@laposte.fr', "adherent"),
(38, 'Bonnet', 'Tom', STR_TO_DATE('24/08/2012', '%d/%m/%Y'), 35.80, 'tom.bonnet@wanadoo.fr', "adherent"),
(39, 'Dupuis', 'Lina', STR_TO_DATE('17/03/2015', '%d/%m/%Y'), 27.80, 'lina.dupuis@gmail.com', "adherent"),
(40, 'Michel', 'Ethan', STR_TO_DATE('12/04/2013', '%d/%m/%Y'), 32.80, 'ethan.michel@yahoo.com', "adherent"),
(41, 'Lemoine', 'Mia', STR_TO_DATE('02/02/2014', '%d/%m/%Y'), 29.80, 'mia.lemoine@gmail.com', "adherent"),
(42, 'Morel', 'Noah', STR_TO_DATE('20/07/2012', '%d/%m/%Y'), 36.20, 'noah.morel@yahoo.com', "adherent"),
(43, 'Garcia', 'Léonie', STR_TO_DATE('27/11/2015', '%d/%m/%Y'), 28.20, 'leonie.garcia@laposte.fr', "adherent"),
(44, 'Roux', 'Tom', STR_TO_DATE('30/09/2013', '%d/%m/%Y'), 33.20, 'tom.roux@wanadoo.fr', "adherent"),
(45, 'Fournier', 'Lola', STR_TO_DATE('19/06/2016', '%d/%m/%Y'), 26.20, 'lola.fournier@gmail.com', "adherent"),
(46, 'Girard', 'Arthur', STR_TO_DATE('09/01/2011', '%d/%m/%Y'), 41.20, 'arthur.girard@yahoo.com', "adherent"),
(47, 'Bonnet', 'Emma', STR_TO_DATE('23/12/2014', '%d/%m/%Y'), 30.40, 'emma.bonnet@laposte.fr', "adherent"),
(48, 'Dupuis', 'Lucas', STR_TO_DATE('14/04/2012', '%d/%m/%Y'), 35.40, 'lucas.dupuis@wanadoo.fr', "adherent"),
(49, 'Michel', 'Chloe', STR_TO_DATE('21/10/2015', '%d/%m/%Y'), 27.40, 'chloe.michel@gmail.com', "adherent"),
(50, 'Lemoine', 'Hugo', STR_TO_DATE('26/07/2013', '%d/%m/%Y'), 32.40, 'hugo.lemoine@yahoo.com', "adherent"),
(51, 'Blanc', 'Léa', STR_TO_DATE('13/12/2014', '%d/%m/%Y'), 30.60, 'lea.blanc@gmail.com', "adherent"),
(52, 'Renard', 'Louis', STR_TO_DATE('08/06/2012', '%d/%m/%Y'), 36.60, 'louis.renard@yahoo.com', "adherent"),
(53, 'Marchand', 'Alice', STR_TO_DATE('20/01/2015', '%d/%m/%Y'), 28.60, 'alice.marchand@laposte.fr', "adherent"),
(54, 'Gauthier', 'Tom', STR_TO_DATE('14/05/2013', '%d/%m/%Y'), 33.60, 'tom.gauthier@wanadoo.fr', "adherent"),
(55, 'Perrin', 'Lina', STR_TO_DATE('29/08/2016', '%d/%m/%Y'), 26.60, 'lina.gauthier@orange.fr', "adherent"),
(56, 'Renaud', 'Ethan', STR_TO_DATE('17/02/2011', '%d/%m/%Y'), 41.60, 'ethan.renaud@yahoo.com', "adherent"),
(57, 'Barbier', 'Mia', STR_TO_DATE('10/11/2014', '%d/%m/%Y'), 30.80, 'mia.barbier@laposte.fr', "adherent"),
(58, 'Lemoine', 'Noah', STR_TO_DATE('02/03/2012', '%d/%m/%Y'), 36.80, 'noah.lemoine@wanadoo.fr', "adherent"),
(59, 'Lefevre', 'Léonie', STR_TO_DATE('27/07/2015', '%d/%m/%Y'), 28.80, 'leonie.lefevre@gmail.com', "adherent"),
(60, 'Dupont', 'Tom', STR_TO_DATE('17/09/2013', '%d/%m/%Y'), 33.80, 'tom.dupont@yahoo.com', "adherent"),
(61, 'Moreau', 'Lola', STR_TO_DATE('25/05/2014', '%d/%m/%Y'), 29.20, 'lola.moreau@gmail.com', "adherent"),
(62, 'Simon', 'Arthur', STR_TO_DATE('14/07/2012', '%d/%m/%Y'), 34.20, 'arthur.simon@yahoo.com', "adherent"),
(63, 'Michel', 'Emma', STR_TO_DATE('30/08/2015', '%d/%m/%Y'), 28.20, 'emma.michel@laposte.fr', "adherent"),
(64, 'Garcia', 'Lucas', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 33.20, 'lucas.garcia@wanadoo.fr', "adherent"),
(65, 'Roux', 'Chloe', STR_TO_DATE('09/03/2016', '%d/%m/%Y'), 25.20, 'chloe.roux@gmail.com', "adherent"),
(66, 'Fournier', 'Louis', STR_TO_DATE('11/01/2011', '%d/%m/%Y'), 40.20, 'louis.fournier@yahoo.com', "adherent"),
(67, 'Girard', 'Alice', STR_TO_DATE('05/11/2014', '%d/%m/%Y'), 30.30, 'alice.girard@laposte.fr', "adherent"),
(68, 'Bonnet', 'Tom', STR_TO_DATE('29/04/2012', '%d/%m/%Y'), 35.30, 'tom.bonnet@wanadoo.fr', "adherent"),
(69, 'Dupuis', 'Lina', STR_TO_DATE('26/12/2015', '%d/%m/%Y'), 27.30, 'lina.dupuis@gmail.com', "adherent"),
(70, 'Michel', 'Ethan', STR_TO_DATE('18/09/2013', '%d/%m/%Y'), 32.30, 'ethan.michel@yahoo.com', "adherent"),
(71, 'Lemoine', 'Mia', STR_TO_DATE('07/04/2014', '%d/%m/%Y'), 29.30, 'mia.lemoine@gmail.com', "adherent"),
(72, 'Morel', 'Noah', STR_TO_DATE('14/06/2012', '%d/%m/%Y'), 36.30, 'noah.morel@yahoo.com', "adherent"),
(73, 'Garcia', 'Léonie', STR_TO_DATE('23/07/2015', '%d/%m/%Y'), 28.30, 'leonie.garcia@laposte.fr', "adherent"),
(74, 'Roux', 'Tom', STR_TO_DATE('21/10/2013', '%d/%m/%Y'), 33.30, 'tom.roux@wanadoo.fr', "adherent"),
(75, 'Fournier', 'Lola', STR_TO_DATE('31/12/2016', '%d/%m/%Y'), 26.30, 'lola.fournier@gmail.com', "adherent"),
(76, 'Girard', 'Arthur', STR_TO_DATE('13/03/2011', '%d/%m/%Y'), 41.30, 'arthur.girard@yahoo.com', "adherent"),
(77, 'Bonnet', 'Emma', STR_TO_DATE('08/05/2014', '%d/%m/%Y'), 30.40, 'emma.bonnet@laposte.fr', "adherent"),
(78, 'Dupuis', 'Lucas', STR_TO_DATE('01/06/2012', '%d/%m/%Y'), 35.40, 'lucas.dupuis@wanadoo.fr', "adherent"),
(79, 'Michel', 'Chloe', STR_TO_DATE('22/11/2015', '%d/%m/%Y'), 27.40, 'chloe.michel@gmail.com', "adherent"),
(80, 'Lemoine', 'Hugo', STR_TO_DATE('19/08/2013', '%d/%m/%Y'), 32.40, 'hugo.lemoine@yahoo.com', "adherent"),
(81, 'Blanc', 'Léa', STR_TO_DATE('02/09/2014', '%d/%m/%Y'), 30.60, 'lea.blanc@gmail.com', "adherent"),
(82, 'Renard', 'Louis', STR_TO_DATE('12/04/2012', '%d/%m/%Y'), 36.60, 'louis.renard@yahoo.com', "adherent"),
(83, 'Marchand', 'Alice', STR_TO_DATE('05/02/2015', '%d/%m/%Y'), 28.60, 'alice.marchand@laposte.fr', "adherent"),
(84, 'Gauthier', 'Tom', STR_TO_DATE('15/03/2013', '%d/%m/%Y'), 33.60, 'tom.gauthier@wanadoo.fr', "adherent"),
(85, 'Perrin', 'Lina', STR_TO_DATE('29/10/2016', '%d/%m/%Y'), 26.60, 'lina.perrin@gmail.com', "adherent"),
(86, 'Renaud', 'Ethan', STR_TO_DATE('14/01/2011', '%d/%m/%Y'), 41.60, 'ethan.renaud@yahoo.com', "adherent"),
(87, 'Barbier', 'Mia', STR_TO_DATE('11/08/2014', '%d/%m/%Y'), 30.80, 'mia.barbier@laposte.fr', "adherent"),
(88, 'Lemoine', 'Noah', STR_TO_DATE('22/12/2012', '%d/%m/%Y'), 36.80, 'noah.lemoine@wanadoo.fr', "adherent"),
(89, 'Lefevre', 'Léonie', STR_TO_DATE('03/09/2015', '%d/%m/%Y'), 28.80, 'leonie.lefevre@gmail.com', "adherent"),
(90, 'Dupont', 'Tom', STR_TO_DATE('10/10/2013', '%d/%m/%Y'), 33.80, 'tom.dupont@yahoo.com', "adherent"),
(91, 'Moreau', 'Lola', STR_TO_DATE('07/05/2014', '%d/%m/%Y'), 29.20, 'lola.moreau@gmail.com', "adherent"),
(92, 'Simon', 'Arthur', STR_TO_DATE('14/07/2012', '%d/%m/%Y'), 34.20, 'arthur.simon@yahoo.com', "adherent"),
(93, 'Michel', 'Emma', STR_TO_DATE('30/08/2015', '%d/%m/%Y'), 28.20, 'emma.michel@laposte.fr', "adherent"),
(94, 'Garcia', 'Lucas', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 33.20, 'lucas.garcia@wanadoo.fr', "adherent"),
(95, 'Roux', 'Chloe', STR_TO_DATE('09/03/2016', '%d/%m/%Y'), 25.20, 'chloe.roux@gmail.com', "adherent"),
(96, 'Fournier', 'Louis', STR_TO_DATE('11/01/2011', '%d/%m/%Y'), 40.20, 'louis.fournier@yahoo.com', "adherent"),
(97, 'Girard', 'Alice', STR_TO_DATE('05/11/2014', '%d/%m/%Y'), 30.30, 'alice.girard@laposte.fr', "adherent"),
(98, 'Bonnet', 'Tom', STR_TO_DATE('29/04/2012', '%d/%m/%Y'), 35.30, 'tom.bonnet@wanadoo.fr', "adherent"),
(99, 'Dupuis', 'Lina', STR_TO_DATE('14/08/2015', '%d/%m/%Y'), 27.30, 'lina.dupuis@gmail.com', "adherent"),
(100, 'Michel', 'Ethan', STR_TO_DATE('24/02/2013', '%d/%m/%Y'), 32.30, 'ethan.michel@yahoo.com', "adherent"),

-- Insertion de 10 moniteurs générés par IA (Copilot de Bing) car tâche répétitive.
(101, 'Dupont', 'Jean', STR_TO_DATE('21/05/1991', '%d/%m/%Y'), 75.50, 'jean.dupont@gmail.com', "moniteur"),
(102, 'Martin', 'Sophie', STR_TO_DATE('02/03/1995', '%d/%m/%Y'), 62.30, 'sophie.martin@wanadoo.com', "moniteur"),
(103, 'Bernard', 'Luc', STR_TO_DATE('30/11/1972', '%d/%m/%Y'), 80.20, 'luc.bernard@yahoo.com', "moniteur"),
(104, 'Robert', 'Marie', STR_TO_DATE('27/07/1994', '%d/%m/%Y'), 68.40, 'marie.robert@yahoo.com', "moniteur"),
(105, 'Petit', 'Pierre', STR_TO_DATE('13/01/1983', '%d/%m/%Y'), 77.10, 'pierre.petit@gmail.com', "moniteur"),
(106, 'Durand', 'Claire', STR_TO_DATE('05/09/1996', '%d/%m/%Y'), 59.80, 'claire.durand@wanadoo.com', "moniteur"),
(107, 'Leroy', 'Julien', STR_TO_DATE('06/10/1979', '%d/%m/%Y'), 85.60, 'julien.leroy@gmail.com', "moniteur"),
(108, 'Moreau', 'Isabelle', STR_TO_DATE('04/04/1991', '%d/%m/%Y'), 64.50, 'isabelle.moreau@gmail.com', "moniteur"),
(109, 'Simon', 'Thomas', STR_TO_DATE('17/01/1985', '%d/%m/%Y'), 78.90, 'thomas.simon@laposte.fr', "moniteur"),
(110, 'Laurent', 'Emilie', STR_TO_DATE('24/03/1994', '%d/%m/%Y'), 61.70, 'emilie.laurent@orange.fr', "moniteur"),

-- Insertion de l'admin
(111, 'Admin', 'Auguste', STR_TO_DATE('01/01/1978', '%d/%m/%Y'), 75.50, 'auguste.admin@gmail.com', "admin");

-- Insertions des cours hebdomadaires. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO COURS (id_c, id_u, nb_pe, h_de_debut, duree, date_c, prix) VALUES

-- Cours hebdomadaires du lundi
(1, 101, 10, 18, 1, '2025-01-08', 25.00), -- Lundi
(2, 101, 10, 18, 1, '2025-01-15', 25.00), -- Lundi
(3, 101, 10, 18, 1, '2025-01-22', 25.00), -- Lundi
(4, 101, 10, 18, 1, '2025-01-29', 25.00), -- Lundi
(5, 101, 10, 18, 1, '2025-02-05', 25.00), -- Lundi
(6, 101, 10, 18, 1, '2025-02-12', 25.00), -- Lundi
(7, 101, 10, 18, 1, '2025-02-19', 25.00), -- Lundi
(8, 101, 10, 18, 1, '2025-02-26', 25.00), -- Lundi
(9, 101, 10, 18, 1, '2025-03-04', 25.00), -- Lundi
(10, 101, 10, 18, 1, '2025-03-11', 25.00), -- Lundi
(11, 101, 10, 18, 1, '2025-03-18', 25.00), -- Lundi
(12, 101, 10, 18, 1, '2025-03-25', 25.00), -- Lundi
(13, 101, 10, 18, 1, '2025-04-01', 25.00), -- Lundi
(14, 101, 10, 18, 1, '2025-04-08', 25.00), -- Lundi
(15, 101, 10, 18, 1, '2025-04-15', 25.00), -- Lundi
(16, 101, 10, 18, 1, '2025-04-22', 25.00), -- Lundi
(17, 101, 10, 18, 1, '2025-04-29', 25.00), -- Lundi
(18, 101, 10, 18, 1, '2025-05-06', 25.00), -- Lundi
(19, 101, 10, 18, 1, '2025-05-13', 25.00), -- Lundi
(20, 101, 10, 18, 1, '2025-05-20', 25.00), -- Lundi
(21, 101, 10, 18, 1, '2025-05-27', 25.00), -- Lundi
(22, 101, 10, 18, 1, '2025-06-03', 25.00), -- Lundi
(23, 101, 10, 18, 1, '2025-06-10', 25.00), -- Lundi
(24, 101, 10, 18, 1, '2025-06-17', 25.00), -- Lundi

-- Cours hebdomadaires du mardi
(25, 101, 10, 18, 1, '2025-01-09', 25.00), -- Mardi
(26, 101, 10, 18, 1, '2025-01-16', 25.00), -- Mardi
(27, 101, 10, 18, 1, '2025-01-23', 25.00), -- Mardi
(28, 101, 10, 18, 1, '2025-01-30', 25.00), -- Mardi
(29, 101, 10, 18, 1, '2025-02-06', 25.00), -- Mardi
(30, 101, 10, 18, 1, '2025-02-13', 25.00), -- Mardi
(31, 101, 10, 18, 1, '2025-02-20', 25.00), -- Mardi
(32, 101, 10, 18, 1, '2025-02-27', 25.00), -- Mardi
(33, 101, 10, 18, 1, '2025-03-05', 25.00), -- Mardi
(34, 101, 10, 18, 1, '2025-03-12', 25.00), -- Mardi
(35, 101, 10, 18, 1, '2025-03-19', 25.00), -- Mardi
(36, 101, 10, 18, 1, '2025-03-26', 25.00), -- Mardi
(37, 101, 10, 18, 1, '2025-04-02', 25.00), -- Mardi
(38, 101, 10, 18, 1, '2025-04-09', 25.00), -- Mardi
(39, 101, 10, 18, 1, '2025-04-16', 25.00), -- Mardi
(40, 101, 10, 18, 1, '2025-04-23', 25.00), -- Mardi
(41, 101, 10, 18, 1, '2025-04-30', 25.00), -- Mardi
(42, 101, 10, 18, 1, '2025-05-07', 25.00), -- Mardi
(43, 101, 10, 18, 1, '2025-05-14', 25.00), -- Mardi
(44, 101, 10, 18, 1, '2025-05-21', 25.00), -- Mardi
(45, 101, 10, 18, 1, '2025-05-28', 25.00), -- Mardi
(46, 101, 10, 18, 1, '2025-06-04', 25.00), -- Mardi
(47, 101, 10, 18, 1, '2025-06-11', 25.00), -- Mardi
(48, 101, 10, 18, 1, '2025-06-18', 25.00), -- Mardi

-- Cours hebdomadaires du mercredi
(49, 102, 8, 14, 1, '2025-01-10', 28.00), -- Mercredi
(50, 102, 8, 16, 1, '2025-01-10', 28.00), -- Mercredi
(51, 102, 8, 17, 1, '2025-01-10', 28.00), -- Mercredi
(52, 102, 8, 14, 1, '2025-01-17', 28.00), -- Mercredi
(53, 102, 8, 16, 1, '2025-01-17', 28.00), -- Mercredi
(54, 102, 8, 17, 1, '2025-01-17', 28.00), -- Mercredi
(55, 102, 8, 14, 1, '2025-01-24', 28.00), -- Mercredi
(56, 102, 8, 16, 1, '2025-01-24', 28.00), -- Mercredi
(57, 102, 8, 17, 1, '2025-01-24', 28.00), -- Mercredi
(58, 102, 8, 14, 1, '2025-01-31', 28.00), -- Mercredi
(59, 102, 8, 16, 1, '2025-01-31', 28.00), -- Mercredi
(60, 102, 8, 17, 1, '2025-01-31', 28.00), -- Mercredi
(61, 102, 8, 14, 1, '2025-02-07', 28.00), -- Mercredi
(62, 102, 8, 16, 1, '2025-02-07', 28.00), -- Mercredi
(63, 102, 8, 17, 1, '2025-02-07', 28.00), -- Mercredi
(64, 102, 8, 14, 1, '2025-02-14', 28.00), -- Mercredi
(65, 102, 8, 16, 1, '2025-02-14', 28.00), -- Mercredi
(66, 102, 8, 17, 1, '2025-02-14', 28.00), -- Mercredi
(67, 102, 8, 14, 1, '2025-02-21', 28.00), -- Mercredi
(68, 102, 8, 16, 1, '2025-02-21', 28.00), -- Mercredi
(69, 102, 8, 17, 1, '2025-02-21', 28.00), -- Mercredi
(70, 102, 8, 14, 1, '2025-02-28', 28.00), -- Mercredi
(71, 102, 8, 16, 1, '2025-02-28', 28.00), -- Mercredi
(72, 102, 8, 17, 1, '2025-02-28', 28.00), -- Mercredi
(73, 102, 8, 14, 1, '2025-03-06', 28.00), -- Mercredi
(74, 102, 8, 16, 1, '2025-03-06', 28.00), -- Mercredi
(75, 102, 8, 17, 1, '2025-03-06', 28.00), -- Mercredi
(76, 102, 8, 14, 1, '2025-03-13', 28.00), -- Mercredi
(77, 102, 8, 16, 1, '2025-03-13', 28.00), -- Mercredi
(78, 102, 8, 17, 1, '2025-03-13', 28.00), -- Mercredi
(79, 102, 8, 14, 1, '2025-03-20', 28.00), -- Mercredi
(80, 102, 8, 16, 1, '2025-03-20', 28.00), -- Mercredi
(81, 102, 8, 17, 1, '2025-03-20', 28.00), -- Mercredi
(82, 102, 8, 14, 1, '2025-03-27', 28.00), -- Mercredi
(83, 102, 8, 16, 1, '2025-03-27', 28.00), -- Mercredi
(84, 102, 8, 17, 1, '2025-03-27', 28.00), -- Mercredi
(85, 102, 8, 14, 1, '2025-04-03', 28.00), -- Mercredi
(86, 102, 8, 16, 1, '2025-04-03', 28.00), -- Mercredi
(87, 102, 8, 17, 1, '2025-04-03', 28.00), -- Mercredi
(88, 102, 8, 14, 1, '2025-04-10', 28.00), -- Mercredi
(89, 102, 8, 16, 1, '2025-04-10', 28.00), -- Mercredi
(90, 102, 8, 17, 1, '2025-04-10', 28.00), -- Mercredi
(91, 102, 8, 14, 1, '2025-04-17', 28.00), -- Mercredi
(92, 102, 8, 16, 1, '2025-04-17', 28.00), -- Mercredi
(93, 102, 8, 17, 1, '2025-04-17', 28.00), -- Mercredi
(94, 102, 8, 14, 1, '2025-04-24', 28.00), -- Mercredi
(95, 102, 8, 16, 1, '2025-04-24', 28.00), -- Mercredi
(96, 102, 8, 17, 1, '2025-04-24', 28.00), -- Mercredi
(97, 102, 8, 14, 1, '2025-05-01', 28.00), -- Mercredi
(98, 102, 8, 16, 1, '2025-05-01', 28.00), -- Mercredi
(99, 102, 8, 17, 1, '2025-05-01', 28.00), -- Mercredi
(100, 102, 8, 14, 1, '2025-05-08', 28.00), -- Mercredi
(101, 102, 8, 16, 1, '2025-05-08', 28.00), -- Mercredi
(102, 102, 8, 17, 1, '2025-05-08', 28.00), -- Mercredi
(103, 102, 8, 14, 1, '2025-05-15', 28.00), -- Mercredi
(104, 102, 8, 16, 1, '2025-05-15', 28.00), -- Mercredi
(105, 102, 8, 17, 1, '2025-05-15', 28.00), -- Mercredi
(106, 102, 8, 14, 1, '2025-05-22', 28.00), -- Mercredi
(107, 102, 8, 16, 1, '2025-05-22', 28.00), -- Mercredi
(108, 102, 8, 17, 1, '2025-05-22', 28.00), -- Mercredi
(109, 102, 8, 14, 1, '2025-05-29', 28.00), -- Mercredi
(110, 102, 8, 16, 1, '2025-05-29', 28.00), -- Mercredi
(111, 102, 8, 17, 1, '2025-05-29', 28.00), -- Mercredi
(112, 102, 8, 17, 1, '2025-05-29', 28.00), -- Mercredi
(113, 102, 8, 14, 1, '2025-06-05', 28.00), -- Mercredi
(114, 102, 8, 16, 1, '2025-06-05', 28.00), -- Mercredi
(115, 102, 8, 17, 1, '2025-06-05', 28.00), -- Mercredi
(116, 102, 8, 14, 1, '2025-06-12', 28.00), -- Mercredi
(117, 102, 8, 16, 1, '2025-06-12', 28.00), -- Mercredi
(118, 102, 8, 17, 1, '2025-06-12', 28.00), -- Mercredi
(119, 102, 8, 14, 1, '2025-06-19', 28.00), -- Mercredi
(120, 102, 8, 16, 1, '2025-06-19', 28.00), -- Mercredi
(121, 102, 8, 17, 1, '2025-06-19', 28.00), -- Mercredi
(122, 102, 8, 14, 1, '2025-06-26', 28.00), -- Mercredi
(123, 102, 8, 16, 1, '2025-06-26', 28.00), -- Mercredi
(124, 102, 8, 17, 1, '2025-06-26', 28.00), -- Mercredi

-- Cours hebdomadaires du jeudi
(125, 102, 8, 17, 1, '2025-01-11', 28.00), -- Jeudi
(126, 102, 8, 17, 1, '2025-01-18', 28.00), -- Jeudi
(127, 102, 8, 17, 1, '2025-01-25', 28.00), -- Jeudi
(128, 102, 8, 17, 1, '2025-02-01', 28.00), -- Jeudi
(129, 102, 8, 17, 1, '2025-02-08', 28.00), -- Jeudi
(130, 102, 8, 17, 1, '2025-02-15', 28.00), -- Jeudi
(131, 102, 8, 17, 1, '2025-02-22', 28.00), -- Jeudi
(132, 102, 8, 17, 1, '2025-02-29', 28.00), -- Jeudi
(133, 102, 8, 17, 1, '2025-03-07', 28.00), -- Jeudi
(134, 102, 8, 17, 1, '2025-03-14', 28.00), -- Jeudi
(135, 102, 8, 17, 1, '2025-03-21', 28.00), -- Jeudi
(136, 102, 8, 17, 1, '2025-03-28', 28.00), -- Jeudi
(137, 102, 8, 17, 1, '2025-04-04', 28.00), -- Jeudi
(138, 102, 8, 17, 1, '2025-04-11', 28.00), -- Jeudi
(139, 102, 8, 17, 1, '2025-04-18', 28.00), -- Jeudi
(140, 102, 8, 17, 1, '2025-04-25', 28.00), -- Jeudi
(141, 102, 8, 17, 1, '2025-05-02', 28.00), -- Jeudi
(142, 102, 8, 17, 1, '2025-05-09', 28.00), -- Jeudi
(143, 102, 8, 17, 1, '2025-05-16', 28.00), -- Jeudi
(144, 102, 8, 17, 1, '2025-05-23', 28.00), -- Jeudi
(145, 102, 8, 17, 1, '2025-05-30', 28.00), -- Jeudi
(146, 102, 8, 17, 1, '2025-06-06', 28.00), -- Jeudi
(147, 102, 8, 17, 1, '2025-06-13', 28.00), -- Jeudi
(148, 102, 8, 17, 1, '2025-06-20', 28.00), -- Jeudi

-- Cours hebdomadaires du vendredi
(149, 103, 6, 19, 2, '2025-01-12', 30.00), -- Vendredi
(150, 103, 6, 19, 2, '2025-01-19', 30.00), -- Vendredi
(151, 103, 6, 19, 2, '2025-01-26', 30.00), -- Vendredi
(152, 103, 6, 19, 2, '2025-02-02', 30.00), -- Vendredi
(153, 103, 6, 19, 2, '2025-02-09', 30.00), -- Vendredi
(154, 103, 6, 19, 2, '2025-02-16', 30.00), -- Vendredi
(155, 103, 6, 19, 2, '2025-02-23', 30.00), -- Vendredi
(156, 103, 6, 19, 2, '2025-03-01', 30.00), -- Vendredi
(157, 103, 6, 19, 2, '2025-03-08', 30.00), -- Vendredi
(158, 103, 6, 19, 2, '2025-03-15', 30.00), -- Vendredi
(159, 103, 6, 19, 2, '2025-03-22', 30.00), -- Vendredi
(160, 103, 6, 19, 2, '2025-03-29', 30.00), -- Vendredi
(161, 103, 6, 19, 2, '2025-04-05', 30.00), -- Vendredi
(162, 103, 6, 19, 2, '2025-04-12', 30.00), -- Vendredi
(163, 103, 6, 19, 2, '2025-04-19', 30.00), -- Vendredi
(164, 103, 6, 19, 2, '2025-04-26', 30.00), -- Vendredi
(165, 103, 6, 19, 2, '2025-05-03', 30.00), -- Vendredi
(166, 103, 6, 19, 2, '2025-05-10', 30.00), -- Vendredi
(167, 103, 6, 19, 2, '2025-05-17', 30.00), -- Vendredi
(168, 103, 6, 19, 2, '2025-05-24', 30.00), -- Vendredi
(169, 103, 6, 19, 2, '2025-05-31', 30.00), -- Vendredi
(170, 103, 6, 19, 2, '2025-06-07', 30.00), -- Vendredi
(171, 103, 6, 19, 2, '2025-06-14', 30.00), -- Vendredi
(172, 103, 6, 19, 2, '2025-06-21', 30.00), -- Vendredi


-- Cours hebdomadaires du samedi
(173, 102, 8, 9, 1, '2025-01-06', 28.00),  -- Samedi matin
(174, 102, 8, 11, 1, '2025-01-06', 28.00), -- Samedi fin de matinée
(175, 102, 8, 14, 1, '2025-01-06', 28.00), -- Samedi après-midi
(176, 102, 8, 16, 1, '2025-01-06', 28.00), -- Samedi après-midi
(177, 102, 8, 9, 1, '2025-01-13', 28.00),  -- Samedi matin
(178, 102, 8, 11, 1, '2025-01-13', 28.00), -- Samedi fin de matinée
(179, 102, 8, 14, 1, '2025-01-13', 28.00), -- Samedi après-midi
(180, 102, 8, 16, 1, '2025-01-13', 28.00), -- Samedi après-midi
(181, 102, 8, 9, 1, '2025-01-20', 28.00),  -- Samedi matin
(182, 102, 8, 11, 1, '2025-01-20', 28.00), -- Samedi fin de matinée
(183, 102, 8, 14, 1, '2025-01-20', 28.00), -- Samedi après-midi
(184, 102, 8, 16, 1, '2025-01-20', 28.00), -- Samedi après-midi
(185, 102, 8, 9, 1, '2025-01-27', 28.00),  -- Samedi matin
(186, 102, 8, 11, 1, '2025-01-27', 28.00), -- Samedi fin de matinée
(187, 102, 8, 14, 1, '2025-01-27', 28.00), -- Samedi après-midi
(188, 102, 8, 16, 1, '2025-01-27', 28.00), -- Samedi après-midi
(189, 102, 8, 9, 1, '2025-02-03', 28.00),  -- Samedi matin
(190, 102, 8, 11, 1, '2025-02-03', 28.00), -- Samedi fin de matinée
(191, 102, 8, 14, 1, '2025-02-03', 28.00), -- Samedi après-midi
(192, 102, 8, 16, 1, '2025-02-03', 28.00), -- Samedi après-midi
(193, 102, 8, 9, 1, '2025-02-10', 28.00),  -- Samedi matin
(194, 102, 8, 11, 1, '2025-02-10', 28.00), -- Samedi fin de matinée
(195, 102, 8, 14, 1, '2025-02-10', 28.00), -- Samedi après-midi
(196, 102, 8, 16, 1, '2025-02-10', 28.00), -- Samedi après-midi
(197, 102, 8, 9, 1, '2025-02-17', 28.00),  -- Samedi matin
(198, 102, 8, 11, 1, '2025-02-17', 28.00), -- Samedi fin de matinée
(199, 102, 8, 14, 1, '2025-02-17', 28.00), -- Samedi après-midi
(200, 102, 8, 16, 1, '2025-02-17', 28.00), -- Samedi après-midi
(201, 102, 8, 9, 1, '2025-02-24', 28.00),  -- Samedi matin
(202, 102, 8, 11, 1, '2025-02-24', 28.00), -- Samedi fin de matinée
(203, 102, 8, 14, 1, '2025-02-24', 28.00), -- Samedi après-midi
(204, 102, 8, 16, 1, '2025-02-24', 28.00), -- Samedi après-midi
(205, 102, 8, 9, 1, '2025-03-02', 28.00),  -- Samedi matin
(206, 102, 8, 11, 1, '2025-03-02', 28.00), -- Samedi fin de matinée
(207, 102, 8, 14, 1, '2025-03-02', 28.00), -- Samedi après-midi
(208, 102, 8, 16, 1, '2025-03-02', 28.00), -- Samedi après-midi
(209, 102, 8, 9, 1, '2025-03-09', 28.00),  -- Samedi matin
(210, 102, 8, 11, 1, '2025-03-09', 28.00), -- Samedi fin de matinée
(211, 102, 8, 14, 1, '2025-03-09', 28.00), -- Samedi après-midi
(212, 102, 8, 16, 1, '2025-03-09', 28.00), -- Samedi après-midi
(213, 102, 8, 9, 1, '2025-03-16', 28.00),  -- Samedi matin
(214, 102, 8, 11, 1, '2025-03-16', 28.00), -- Samedi fin de matinée
(215, 102, 8, 14, 1, '2025-03-16', 28.00), -- Samedi après-midi
(216, 102, 8, 16, 1, '2025-03-16', 28.00), -- Samedi après-midi
(217, 102, 8, 9, 1, '2025-03-23', 28.00),  -- Samedi matin
(218, 102, 8, 11, 1, '2025-03-23', 28.00), -- Samedi fin de matinée
(219, 102, 8, 14, 1, '2025-03-23', 28.00), -- Samedi après-midi
(220, 102, 8, 16, 1, '2025-03-23', 28.00), -- Samedi après-midi
(221, 102, 8, 9, 1, '2025-03-30', 28.00),  -- Samedi matin
(222, 102, 8, 11, 1, '2025-03-30', 28.00), -- Samedi fin de matinée
(223, 102, 8, 14, 1, '2025-03-30', 28.00), -- Samedi après-midi
(224, 102, 8, 16, 1, '2025-03-30', 28.00), -- Samedi après-midi
(225, 102, 8, 9, 1, '2025-04-06', 28.00),  -- Samedi matin
(226, 102, 8, 11, 1, '2025-04-06', 28.00), -- Samedi fin de matinée
(227, 102, 8, 14, 1, '2025-04-06', 28.00), -- Samedi après-midi
(228, 102, 8, 16, 1, '2025-04-06', 28.00), -- Samedi après-midi
(229, 102, 8, 9, 1, '2025-04-13', 28.00),  -- Samedi matin
(230, 102, 8, 11, 1, '2025-04-13', 28.00), -- Samedi fin de matinée
(231, 102, 8, 14, 1, '2025-04-13', 28.00), -- Samedi après-midi
(232, 102, 8, 16, 1, '2025-04-13', 28.00), -- Samedi après-midi
(233, 102, 8, 9, 1, '2025-04-20', 28.00),  -- Samedi matin
(234, 102, 8, 11, 1, '2025-04-20', 28.00), -- Samedi fin de matinée
(235, 102, 8, 14, 1, '2025-04-20', 28.00), -- Samedi après-midi
(236, 102, 8, 16, 1, '2025-04-20', 28.00), -- Samedi après-midi
(237, 102, 8, 9, 1, '2025-04-27', 28.00),  -- Samedi matin
(238, 102, 8, 11, 1, '2025-04-27', 28.00), -- Samedi fin de matinée
(239, 102, 8, 14, 1, '2025-04-27', 28.00), -- Samedi après-midi
(240, 102, 8, 16, 1, '2025-04-27', 28.00), -- Samedi après-midi
(241, 102, 8, 9, 1, '2025-05-04', 28.00),  -- Samedi matin
(242, 102, 8, 11, 1, '2025-05-04', 28.00), -- Samedi fin de matinée
(243, 102, 8, 14, 1, '2025-05-04', 28.00), -- Samedi après-midi
(244, 102, 8, 16, 1, '2025-05-04', 28.00), -- Samedi après-midi
(245, 102, 8, 9, 1, '2025-05-11', 28.00),  -- Samedi matin
(246, 102, 8, 11, 1, '2025-05-11', 28.00), -- Samedi fin de matinée
(247, 102, 8, 14, 1, '2025-05-11', 28.00), -- Samedi après-midi
(248, 102, 8, 16, 1, '2025-05-11', 28.00), -- Samedi après-midi
(249, 102, 8, 9, 1, '2025-05-18', 28.00),  -- Samedi matin
(250, 102, 8, 11, 1, '2025-05-18', 28.00), -- Samedi fin de matinée
(251, 102, 8, 14, 1, '2025-05-18', 28.00), -- Samedi après-midi
(252, 102, 8, 16, 1, '2025-05-18', 28.00), -- Samedi après-midi
(253, 102, 8, 9, 1, '2025-05-25', 28.00),  -- Samedi matin
(254, 102, 8, 11, 1, '2025-05-25', 28.00), -- Samedi fin de matinée
(255, 102, 8, 14, 1, '2025-05-25', 28.00), -- Samedi après-midi
(256, 102, 8, 16, 1, '2025-05-25', 28.00), -- Samedi après-midi
(257, 102, 8, 9, 1, '2025-06-01', 28.00),  -- Samedi matin
(258, 102, 8, 11, 1, '2025-06-01', 28.00), -- Samedi fin de matinée
(259, 102, 8, 14, 1, '2025-06-01', 28.00), -- Samedi après-midi
(260, 102, 8, 16, 1, '2025-06-01', 28.00), -- Samedi après-midi
(261, 102, 8, 9, 1, '2025-06-08', 28.00),  -- Samedi matin
(262, 102, 8, 11, 1, '2025-06-08', 28.00), -- Samedi fin de matinée
(263, 102, 8, 14, 1, '2025-06-08', 28.00), -- Samedi après-midi
(264, 102, 8, 16, 1, '2025-06-08', 28.00), -- Samedi après-midi
(265, 102, 8, 9, 1, '2025-06-15', 28.00),  -- Samedi matin
(266, 102, 8, 11, 1, '2025-06-15', 28.00), -- Samedi fin de matinée
(267, 102, 8, 14, 1, '2025-06-15', 28.00), -- Samedi après-midi
(268, 102, 8, 16, 1, '2025-06-15', 28.00), -- Samedi après-midi
(269, 102, 8, 9, 1, '2025-06-22', 28.00),  -- Samedi matin
(270, 102, 8, 11, 1, '2025-06-22', 28.00), -- Samedi fin de matinée
(271, 102, 8, 14, 1, '2025-06-22', 28.00), -- Samedi après-midi
(272, 102, 8, 16, 1, '2025-06-22', 28.00), -- Samedi après-midi
(273, 102, 8, 9, 1, '2025-06-29', 28.00),  -- Samedi matin
(274, 102, 8, 11, 1, '2025-06-29', 28.00), -- Samedi fin de matinée
(275, 102, 8, 14, 1, '2025-06-29', 28.00), -- Samedi après-midi
(276, 102, 8, 16, 1, '2025-06-29', 28.00); -- Samedi après-midi

-- Insertions des réservations. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO RESERVER (id_u, id_po, id_c) VALUES
(11, 1, 25),  -- Adhérent Alice monte Poney 1 le 9 janvier
(12, 2, 25),  -- Adhérent Lucas monte Poney 2 le 9 janvier
(13, 3, 25),  -- Adhérent Emma monte Poney 3 le 9 janvier
(14, 4, 25),  -- Adhérent Hugo monte Poney 4 le 9 janvier
(15, 5, 25),  -- Adhérent Chloe monte Poney 5 le 9 janvier
(16, 6, 25),  -- Adhérent Louis monte Poney 6 le 9 janvier
(17, 7, 25),  -- Adhérent Léa monte Poney 7 le 9 janvier
(18, 8, 25),  -- Adhérent Tom monte Poney 8 le 9 janvier
(19, 9, 25),  -- Adhérent Jade monte Poney 9 le 9 janvier
(20, 10, 25), -- Adhérent Arthur monte Poney 10 le 9 janvier

(11, 1, 26),  -- Adhérent Alice monte Poney 1 le 16 janvier
(12, 2, 26),  -- Adhérent Lucas monte Poney 2 le 16 janvier
(13, 3, 26),  -- Adhérent Emma monte Poney 3 le 16 janvier
(14, 4, 26),  -- Adhérent Hugo monte Poney 4 le 16 janvier
(15, 5, 26),  -- Adhérent Chloe monte Poney 5 le 16 janvier
(16, 6, 26),  -- Adhérent Louis monte Poney 6 le 16 janvier
(17, 7, 26),  -- Adhérent Léa monte Poney 7 le 16 janvier
(18, 8, 26),  -- Adhérent Tom monte Poney 8 le 16 janvier
(19, 9, 26),  -- Adhérent Jade monte Poney 9 le 16 janvier
(20, 10, 26), -- Adhérent Arthur monte Poney 10 le 16 janvier

-- Réservations pour les mardis
(11, 1, 27),  -- Adhérent Alice monte Poney 1 le 23 janvier
(12, 2, 27),  -- Adhérent Lucas monte Poney 2 le 23 janvier
(13, 3, 27),  -- Adhérent Emma monte Poney 3 le 23 janvier
(14, 4, 27),  -- Adhérent Hugo monte Poney 4 le 23 janvier
(15, 5, 27),  -- Adhérent Chloe monte Poney 5 le 23 janvier
(16, 6, 27),  -- Adhérent Louis monte Poney 6 le 23 janvier
(17, 7, 27),  -- Adhérent Léa monte Poney 7 le 23 janvier
(18, 8, 27),  -- Adhérent Tom monte Poney 8 le 23 janvier
(19, 9, 27),  -- Adhérent Jade monte Poney 9 le 23 janvier
(20, 10, 27), -- Adhérent Arthur monte Poney 10 le 23 janvier

-- Réservations pour les mercredis
(21, 11, 49),  -- Adhérent Nina monte Poney 11 le 10 janvier
(22, 12, 49),  -- Adhérent Leo monte Poney 12 le 10 janvier
(23, 13, 49),  -- Adhérent Lina monte Poney 13 le 10 janvier
(24, 14, 49),  -- Adhérent Ethan monte Poney 14 le 10 janvier
(25, 15, 49),  -- Adhérent Mia monte Poney 15 le 10 janvier
(26, 16, 49),  -- Adhérent Noah monte Poney 16 le 10 janvier
(27, 17, 49),  -- Adhérent Léonie monte Poney 17 le 10 janvier
(28, 18, 49),  -- Adhérent Tom monte Poney 18 le 10 janvier
(29, 19, 49),  -- Adhérent Lola monte Poney 19 le 10 janvier
(30, 20, 49),  -- Adhérent Arthur monte Poney 20 le 10 janvier

-- Réservations pour les jeudis
(31, 21, 125),  -- Adhérent Alice monte Poney 21 le 11 janvier
(32, 22, 125),  -- Adhérent Lucas monte Poney 22 le 11 janvier
(33, 23, 125),  -- Adhérent Emma monte Poney 23 le 11 janvier
(34, 24, 125),  -- Adhérent Hugo monte Poney 24 le 11 janvier
(35, 25, 125),  -- Adhérent Chloe monte Poney 25 le 11 janvier
(36, 26, 125),  -- Adhérent Louis monte Poney 26 le 11 janvier
(37, 27, 125),  -- Adhérent Léa monte Poney 27 le 11 janvier
(38, 28, 125),  -- Adhérent Tom monte Poney 28 le 11 janvier
(39, 29, 125),  -- Adhérent Jade monte Poney 29 le 11 janvier
(40, 30, 125),  -- Adhérent Arthur monte Poney 30 le 11 janvier

-- Réservations pour les vendredis
(41, 31, 149),  -- Adhérent Alice monte Poney 31 le 12 janvier
(42, 32, 149),  -- Adhérent Lucas monte Poney 32 le 12 janvier
(43, 33, 149),  -- Adhérent Emma monte Poney 33 le 12 janvier
(44, 34, 149),  -- Adhérent Hugo monte Poney 34 le 12 janvier
(45, 35, 149),  -- Adhérent Chloe monte Poney 35 le 12 janvier
(46, 36, 149),  -- Adhérent Louis monte Poney 36 le 12 janvier
(47, 37, 149),  -- Adhérent Léa monte Poney 37 le 12 janvier
(48, 38, 149),  -- Adhérent Tom monte Poney 38 le 12 janvier
(49, 39, 149);  -- Adhérent Jade monte Poney 39 le 12 janvier

INSERT INTO COTISATION VALUES 
(2021,2022),
(2022,2023),
(2023,2024),
(2024,2025),
(2025,2026);

-- Insertions de COTISER. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO COTISER (id_u, annee_debut, annee_fin, paye) VALUES
-- Pour l'année 2023-2024
(1, 2023, 2024, TRUE),
(2, 2023, 2024, TRUE),
(3, 2023, 2024, TRUE),
(4, 2023, 2024, TRUE),
(5, 2023, 2024, TRUE),
(6, 2023, 2024, TRUE),
(7, 2023, 2024, TRUE),
(8, 2023, 2024, TRUE),
(9, 2023, 2024, TRUE),
(10, 2023, 2024, FALSE),
(11, 2023, 2024, TRUE),
(12, 2023, 2024, TRUE),
(13, 2023, 2024, TRUE),
(14, 2023, 2024, TRUE),
(15, 2023, 2024, TRUE),
(16, 2023, 2024, TRUE),
(17, 2023, 2024, TRUE),
(18, 2023, 2024, FALSE),
(19, 2023, 2024, TRUE),
(20, 2023, 2024, TRUE),
(21, 2023, 2024, TRUE),
(22, 2023, 2024, TRUE),
(23, 2023, 2024, TRUE),
(24, 2023, 2024, TRUE),
(25, 2023, 2024, TRUE),
(26, 2023, 2024, TRUE),
(27, 2023, 2024, TRUE),
(28, 2023, 2024, TRUE),
(29, 2023, 2024, TRUE),
(30, 2023, 2024, TRUE),
(31, 2023, 2024, TRUE),
(32, 2023, 2024, TRUE),
(33, 2023, 2024, TRUE),
(34, 2023, 2024, TRUE),
(35, 2023, 2024, TRUE),
(36, 2023, 2024, TRUE),
(37, 2023, 2024, TRUE),
(38, 2023, 2024, TRUE),
(39, 2023, 2024, TRUE),
(40, 2023, 2024, TRUE),
(41, 2023, 2024, TRUE),
(42, 2023, 2024, TRUE),
(43, 2023, 2024, TRUE),
(44, 2023, 2024, TRUE),
(45, 2023, 2024, TRUE),
(46, 2023, 2024, TRUE),
(47, 2023, 2024, TRUE),
(48, 2023, 2024, TRUE),
(49, 2023, 2024, TRUE),
(50, 2023, 2024, TRUE),
(51, 2023, 2024, TRUE),
(52, 2023, 2024, TRUE),
(53, 2023, 2024, TRUE),
(54, 2023, 2024, TRUE),
(55, 2023, 2024, TRUE),
(56, 2023, 2024, TRUE),
(57, 2023, 2024, TRUE),
(58, 2023, 2024, TRUE),
(59, 2023, 2024, TRUE),
(60, 2023, 2024, TRUE),
(61, 2023, 2024, TRUE),
(62, 2023, 2024, TRUE),
(63, 2023, 2024, TRUE),
(64, 2023, 2024, TRUE),
(65, 2023, 2024, TRUE),
(66, 2023, 2024, TRUE),
(67, 2023, 2024, TRUE),
(68, 2023, 2024, TRUE),
(69, 2023, 2024, TRUE),
(70, 2023, 2024, TRUE),
(71, 2023, 2024, TRUE),
(72, 2023, 2024, TRUE),
(73, 2023, 2024, TRUE),
(74, 2023, 2024, TRUE),
(75, 2023, 2024, TRUE),
(76, 2023, 2024, TRUE),
(77, 2023, 2024, TRUE),
(78, 2023, 2024, TRUE),
(79, 2023, 2024, TRUE),
(80, 2023, 2024, TRUE),
(81, 2023, 2024, TRUE),
(82, 2023, 2024, TRUE),
(83, 2023, 2024, TRUE),
(84, 2023, 2024, TRUE),
(85, 2023, 2024, TRUE),
(86, 2023, 2024, TRUE),
(87, 2023, 2024, TRUE),
(88, 2023, 2024, TRUE),
(89, 2023, 2024, TRUE),
(90, 2023, 2024, TRUE),
(91, 2023, 2024, TRUE),
(92, 2023, 2024, TRUE),
(93, 2023, 2024, TRUE),
(94, 2023, 2024, TRUE),
(95, 2023, 2024, TRUE),
(96, 2023, 2024, TRUE),
(97, 2023, 2024, TRUE),
(98, 2023, 2024, TRUE),
(99, 2023, 2024, TRUE),
(100, 2023, 2024, TRUE),

-- Pour l'année 2024-2025
(1, 2024, 2025, TRUE),
(2, 2024, 2025, TRUE),
(3, 2024, 2025, TRUE),
(4, 2024, 2025, TRUE),
(5, 2024, 2025, TRUE),
(6, 2024, 2025, TRUE),
(7, 2024, 2025, TRUE),
(8, 2024, 2025, TRUE),
(9, 2024, 2025, TRUE),
(10, 2024, 2025, FALSE),
(11, 2024, 2025, TRUE),
(12, 2024, 2025, TRUE),
(13, 2024, 2025, TRUE),
(14, 2024, 2025, TRUE),
(15, 2024, 2025, TRUE),
(16, 2024, 2025, TRUE),
(17, 2024, 2025, TRUE),
(18, 2024, 2025, FALSE),
(19, 2024, 2025, TRUE),
(20, 2024, 2025, TRUE),
(21, 2024, 2025, TRUE),
(22, 2024, 2025, TRUE),
(23, 2024, 2025, TRUE),
(24, 2024, 2025, TRUE),
(25, 2024, 2025, TRUE),
(26, 2024, 2025, TRUE),
(27, 2024, 2025, TRUE),
(28, 2024, 2025, TRUE),
(29, 2024, 2025, TRUE),
(30, 2024, 2025, TRUE),
(31, 2024, 2025, TRUE),
(32, 2024, 2025, TRUE),
(33, 2024, 2025, TRUE),
(34, 2024, 2025, TRUE),
(35, 2024, 2025, TRUE),
(36, 2024, 2025, TRUE),
(37, 2024, 2025, TRUE),
(38, 2024, 2025, TRUE),
(39, 2024, 2025, TRUE),
(40, 2024, 2025, TRUE),
(41, 2024, 2025, TRUE),
(42, 2024, 2025, TRUE),
(43, 2024, 2025, TRUE),
(44, 2024, 2025, TRUE),
(45, 2024, 2025, TRUE),
(46, 2024, 2025, TRUE),
(47, 2024, 2025, TRUE),
(48, 2024, 2025, TRUE),
(49, 2024, 2025, TRUE),
(50, 2024, 2025, TRUE),
(51, 2024, 2025, TRUE),
(52, 2024, 2025, TRUE),
(53, 2024, 2025, TRUE),
(54, 2024, 2025, TRUE),
(55, 2024, 2025, TRUE),
(56, 2024, 2025, TRUE),
(57, 2024, 2025, TRUE),
(58, 2024, 2025, TRUE),
(59, 2024, 2025, TRUE),
(60, 2024, 2025, TRUE),
(61, 2024, 2025, TRUE),
(62, 2024, 2025, TRUE),
(63, 2024, 2025, TRUE),
(64, 2024, 2025, TRUE),
(65, 2024, 2025, TRUE),
(66, 2024, 2025, TRUE),
(67, 2024, 2025, TRUE),
(68, 2024, 2025, TRUE),
(69, 2024, 2025, TRUE),
(70, 2024, 2025, TRUE),
(71, 2024, 2025, TRUE),
(72, 2024, 2025, TRUE),
(73, 2024, 2025, TRUE),
(74, 2024, 2025, TRUE),
(75, 2024, 2025, TRUE),
(76, 2024, 2025, TRUE),
(77, 2024, 2025, TRUE),
(78, 2024, 2025, TRUE),
(79, 2024, 2025, TRUE),
(80, 2024, 2025, TRUE),
(81, 2024, 2025, TRUE),
(82, 2024, 2025, TRUE),
(83, 2024, 2025, TRUE),
(84, 2024, 2025, TRUE),
(85, 2024, 2025, TRUE),
(86, 2024, 2025, TRUE),
(87, 2024, 2025, TRUE),
(88, 2024, 2025, TRUE),
(89, 2024, 2025, TRUE),
(90, 2024, 2025, TRUE),
(91, 2024, 2025, TRUE),
(92, 2024, 2025, TRUE),
(93, 2024, 2025, TRUE),
(94, 2024, 2025, TRUE),
(95, 2024, 2025, TRUE),
(96, 2024, 2025, TRUE),
(97, 2024, 2025, TRUE),
(98, 2024, 2025, TRUE),
(99, 2024, 2025, TRUE),
(100, 2024, 2025, TRUE),

-- Quelques enregistrements pour l'année 2022-2023
(1, 2022, 2023, TRUE),
(2, 2022, 2023, TRUE),
(3, 2022, 2023, TRUE),
(4, 2022, 2023, TRUE),
(5, 2022, 2023, TRUE),
(6, 2022, 2023, TRUE),
(7, 2022, 2023, TRUE),
(8, 2022, 2023, TRUE),
(9, 2022, 2023, TRUE),
(10, 2022, 2023, FALSE),
(11, 2022, 2023, TRUE),
(12, 2022, 2023, TRUE),

-- Quelques enregistrements pour l'année 2021-2022
(1, 2021, 2022, TRUE),
(2, 2021, 2022, TRUE),
(3, 2021, 2022, TRUE),
(4, 2021, 2022, TRUE),
(5, 2021, 2022, TRUE),
(6, 2021, 2022, TRUE),
(7, 2021, 2022, TRUE),
(8, 2021, 2022, TRUE);
