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

-- Insertion de 10 moniteurs générés par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO MONITEUR (id_m, nom_m, prenom_m, date_de_naissance, poids, email) VALUES
(1, 'Dupont', 'Jean', STR_TO_DATE('21/05/1991', '%d/%m/%Y'), 75.50, 'jean.dupont@gmail.com'),
(2, 'Martin', 'Sophie', STR_TO_DATE('02/03/1995', '%d/%m/%Y'), 62.30, 'sophie.martin@wanadoo.com'),
(3, 'Bernard', 'Luc', STR_TO_DATE('30/11/1972', '%d/%m/%Y'), 80.20, 'luc.bernard@yahoo.com'),
(4, 'Robert', 'Marie', STR_TO_DATE('27/07/1994', '%d/%m/%Y'), 68.40, 'marie.robert@yahoo.com'),
(5, 'Petit', 'Pierre', STR_TO_DATE('13/01/1983', '%d/%m/%Y'), 77.10, 'pierre.petit@gmail.com'),
(6, 'Durand', 'Claire', STR_TO_DATE('05/09/1996', '%d/%m/%Y'), 59.80, 'claire.durand@wanadoo.com'),
(7, 'Leroy', 'Julien', STR_TO_DATE('06/10/1979', '%d/%m/%Y'), 85.60, 'julien.leroy@gmail.com'),
(8, 'Moreau', 'Isabelle', STR_TO_DATE('04/04/1991', '%d/%m/%Y'), 64.50, 'isabelle.moreau@gmail.com'),
(9, 'Simon', 'Thomas', STR_TO_DATE('17/01/1985', '%d/%m/%Y'), 78.90, 'thomas.simon@laposte.fr'),
(10, 'Laurent', 'Emilie', STR_TO_DATE('24/03/1994', '%d/%m/%Y'), 61.70, 'emilie.laurent@orange.fr');

-- Insertion de 100 adhérents générés par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO ADHERENT (id_a, nom_a, prenom_a, date_de_naissance, poids, email) VALUES
(1, 'Durand', 'Paul', STR_TO_DATE('10/03/2014', '%d/%m/%Y'), 30.50, 'paul.durand@gmail.com'),
(2, 'Petit', 'Marie', STR_TO_DATE('15/06/2012', '%d/%m/%Y'), 35.20, 'marie.petit@yahoo.com'),
(3, 'Martin', 'Julien', STR_TO_DATE('18/01/2015', '%d/%m/%Y'), 28.40, 'julien.martin@laposte.fr'),
(4, 'Bernard', 'Camille', STR_TO_DATE('22/08/2013', '%d/%m/%Y'), 32.10, 'camille.bernard@wanadoo.fr'),
(5, 'Dubois', 'Léon', STR_TO_DATE('30/12/2016', '%d/%m/%Y'), 25.30, 'leon.dubois@gmail.com'),
(6, 'Thomas', 'Léa', STR_TO_DATE('03/11/2011', '%d/%m/%Y'), 40.50, 'lea.thomas@yahoo.com'),
(7, 'Robert', 'Anna', STR_TO_DATE('11/05/2014', '%d/%m/%Y'), 29.80, 'anna.robert@laposte.fr'),
(8, 'Richard', 'Maxime', STR_TO_DATE('19/07/2012', '%d/%m/%Y'), 34.60, 'maxime.richard@wanadoo.fr'),
(9, 'Simon', 'Louise', STR_TO_DATE('27/10/2015', '%d/%m/%Y'), 27.90, 'louise.simon@gmail.com'),
(10, 'Michel', 'Oscar', STR_TO_DATE('14/02/2013', '%d/%m/%Y'), 31.70, 'oscar.michel@yahoo.com'),
(11, 'Lemoine', 'Alice', STR_TO_DATE('04/11/2014', '%d/%m/%Y'), 30.50, 'alice.lemoine@gmail.com'),
(12, 'Morel', 'Lucas', STR_TO_DATE('15/06/2012', '%d/%m/%Y'), 35.20, 'lucas.morel@yahoo.com'),
(13, 'Garcia', 'Emma', STR_TO_DATE('08/05/2015', '%d/%m/%Y'), 28.40, 'emma.garcia@laposte.fr'),
(14, 'Roux', 'Hugo', STR_TO_DATE('22/07/2013', '%d/%m/%Y'), 32.10, 'hugo.roux@wanadoo.fr'),
(15, 'Fournier', 'Chloe', STR_TO_DATE('30/09/2016', '%d/%m/%Y'), 25.30, 'chloe.fournier@gmail.com'),
(16, 'Girard', 'Louis', STR_TO_DATE('03/01/2011', '%d/%m/%Y'), 40.50, 'louis.girard@yahoo.com'),
(17, 'Bonnet', 'Léa', STR_TO_DATE('11/08/2014', '%d/%m/%Y'), 29.80, 'lea.bonnet@laposte.fr'),
(18, 'Dupuis', 'Tom', STR_TO_DATE('19/11/2012', '%d/%m/%Y'), 34.60, 'tom.dupuis@wanadoo.fr'),
(19, 'Michel', 'Jade', STR_TO_DATE('27/02/2015', '%d/%m/%Y'), 27.90, 'jade.michel@gmail.com'),
(20, 'Lemoine', 'Arthur', STR_TO_DATE('14/04/2013', '%d/%m/%Y'), 31.70, 'arthur.lemoine@yahoo.com'),
(21, 'Blanc', 'Nina', STR_TO_DATE('10/03/2014', '%d/%m/%Y'), 30.00, 'nina.blanc@gmail.com'),
(22, 'Renard', 'Leo', STR_TO_DATE('06/12/2012', '%d/%m/%Y'), 36.00, 'leo.renard@yahoo.com'),
(23, 'Marchand', 'Lina', STR_TO_DATE('22/02/2015', '%d/%m/%Y'), 28.00, 'lina.marchand@laposte.fr'),
(24, 'Gauthier', 'Ethan', STR_TO_DATE('05/11/2013', '%d/%m/%Y'), 33.00, 'ethan.gauthier@wanadoo.fr'),
(25, 'Perrin', 'Mia', STR_TO_DATE('30/01/2016', '%d/%m/%Y'), 26.00, 'mia.perrin@gmail.com'),
(26, 'Renaud', 'Noah', STR_TO_DATE('11/05/2011', '%d/%m/%Y'), 41.00, 'noah.renaud@yahoo.com'),
(27, 'Barbier', 'Léonie', STR_TO_DATE('17/06/2014', '%d/%m/%Y'), 30.50, 'leonie.barbier@laposte.fr'),
(28, 'Lemoine', 'Tom', STR_TO_DATE('09/03/2012', '%d/%m/%Y'), 35.50, 'tom.lemoine@wanadoo.fr'),
(29, 'Lefevre', 'Lola', STR_TO_DATE('29/05/2015', '%d/%m/%Y'), 27.50, 'lola.lefevre@gmail.com'),
(30, 'Dupont', 'Arthur', STR_TO_DATE('18/02/2013', '%d/%m/%Y'), 32.50, 'arthur.dupont@yahoo.com'),
(31, 'Moreau', 'Emma', STR_TO_DATE('23/10/2014', '%d/%m/%Y'), 29.00, 'emma.moreau@gmail.com'),
(32, 'Simon', 'Lucas', STR_TO_DATE('03/09/2012', '%d/%m/%Y'), 34.00, 'lucas.simon@yahoo.com'),
(33, 'Michel', 'Chloe', STR_TO_DATE('11/11/2015', '%d/%m/%Y'), 28.50, 'chloe.michel@laposte.fr'),
(34, 'Garcia', 'Hugo', STR_TO_DATE('21/06/2013', '%d/%m/%Y'), 33.50, 'hugo.garcia@wanadoo.fr'),
(35, 'Roux', 'Léa', STR_TO_DATE('17/04/2016', '%d/%m/%Y'), 25.50, 'lea.roux@gmail.com'),
(36, 'Fournier', 'Louis', STR_TO_DATE('13/11/2011', '%d/%m/%Y'), 40.00, 'louis.fournier@yahoo.com'),
(37, 'Girard', 'Alice', STR_TO_DATE('05/05/2014', '%d/%m/%Y'), 30.20, 'alice.girard@laposte.fr'),
(38, 'Bonnet', 'Tom', STR_TO_DATE('24/08/2012', '%d/%m/%Y'), 35.80, 'tom.bonnet@wanadoo.fr'),
(39, 'Dupuis', 'Lina', STR_TO_DATE('17/03/2015', '%d/%m/%Y'), 27.80, 'lina.dupuis@gmail.com'),
(40, 'Michel', 'Ethan', STR_TO_DATE('12/04/2013', '%d/%m/%Y'), 32.80, 'ethan.michel@yahoo.com'),
(41, 'Lemoine', 'Mia', STR_TO_DATE('02/02/2014', '%d/%m/%Y'), 29.80, 'mia.lemoine@gmail.com'),
(42, 'Morel', 'Noah', STR_TO_DATE('20/07/2012', '%d/%m/%Y'), 36.20, 'noah.morel@yahoo.com'),
(43, 'Garcia', 'Léonie', STR_TO_DATE('27/11/2015', '%d/%m/%Y'), 28.20, 'leonie.garcia@laposte.fr'),
(44, 'Roux', 'Tom', STR_TO_DATE('30/09/2013', '%d/%m/%Y'), 33.20, 'tom.roux@wanadoo.fr'),
(45, 'Fournier', 'Lola', STR_TO_DATE('19/06/2016', '%d/%m/%Y'), 26.20, 'lola.fournier@gmail.com'),
(46, 'Girard', 'Arthur', STR_TO_DATE('09/01/2011', '%d/%m/%Y'), 41.20, 'arthur.girard@yahoo.com'),
(47, 'Bonnet', 'Emma', STR_TO_DATE('23/12/2014', '%d/%m/%Y'), 30.40, 'emma.bonnet@laposte.fr'),
(48, 'Dupuis', 'Lucas', STR_TO_DATE('14/04/2012', '%d/%m/%Y'), 35.40, 'lucas.dupuis@wanadoo.fr'),
(49, 'Michel', 'Chloe', STR_TO_DATE('21/10/2015', '%d/%m/%Y'), 27.40, 'chloe.michel@gmail.com'),
(50, 'Lemoine', 'Hugo', STR_TO_DATE('26/07/2013', '%d/%m/%Y'), 32.40, 'hugo.lemoine@yahoo.com'),
(51, 'Blanc', 'Léa', STR_TO_DATE('13/12/2014', '%d/%m/%Y'), 30.60, 'lea.blanc@gmail.com'),
(52, 'Renard', 'Louis', STR_TO_DATE('08/06/2012', '%d/%m/%Y'), 36.60, 'louis.renard@yahoo.com'),
(53, 'Marchand', 'Alice', STR_TO_DATE('20/01/2015', '%d/%m/%Y'), 28.60, 'alice.marchand@laposte.fr'),
(54, 'Gauthier', 'Tom', STR_TO_DATE('14/05/2013', '%d/%m/%Y'), 33.60, 'tom.gauthier@wanadoo.fr'),
(55, 'Perrin', 'Lina', STR_TO_DATE('29/08/2016', '%d/%m/%Y'), 26.60, 'lina.gauthier@orange.fr'),
(56, 'Renaud', 'Ethan', STR_TO_DATE('17/02/2011', '%d/%m/%Y'), 41.60, 'ethan.renaud@yahoo.com'),
(57, 'Barbier', 'Mia', STR_TO_DATE('10/11/2014', '%d/%m/%Y'), 30.80, 'mia.barbier@laposte.fr'),
(58, 'Lemoine', 'Noah', STR_TO_DATE('02/03/2012', '%d/%m/%Y'), 36.80, 'noah.lemoine@wanadoo.fr'),
(59, 'Lefevre', 'Léonie', STR_TO_DATE('27/07/2015', '%d/%m/%Y'), 28.80, 'leonie.lefevre@gmail.com'),
(60, 'Dupont', 'Tom', STR_TO_DATE('17/09/2013', '%d/%m/%Y'), 33.80, 'tom.dupont@yahoo.com'),
(61, 'Moreau', 'Lola', STR_TO_DATE('25/05/2014', '%d/%m/%Y'), 29.20, 'lola.moreau@gmail.com'),
(62, 'Simon', 'Arthur', STR_TO_DATE('14/07/2012', '%d/%m/%Y'), 34.20, 'arthur.simon@yahoo.com'),
(63, 'Michel', 'Emma', STR_TO_DATE('30/08/2015', '%d/%m/%Y'), 28.20, 'emma.michel@laposte.fr'),
(64, 'Garcia', 'Lucas', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 33.20, 'lucas.garcia@wanadoo.fr'),
(65, 'Roux', 'Chloe', STR_TO_DATE('09/03/2016', '%d/%m/%Y'), 25.20, 'chloe.roux@gmail.com'),
(66, 'Fournier', 'Louis', STR_TO_DATE('11/01/2011', '%d/%m/%Y'), 40.20, 'louis.fournier@yahoo.com'),
(67, 'Girard', 'Alice', STR_TO_DATE('05/11/2014', '%d/%m/%Y'), 30.30, 'alice.girard@laposte.fr'),
(68, 'Bonnet', 'Tom', STR_TO_DATE('29/04/2012', '%d/%m/%Y'), 35.30, 'tom.bonnet@wanadoo.fr'),
(69, 'Dupuis', 'Lina', STR_TO_DATE('26/12/2015', '%d/%m/%Y'), 27.30, 'lina.dupuis@gmail.com'),
(70, 'Michel', 'Ethan', STR_TO_DATE('18/09/2013', '%d/%m/%Y'), 32.30, 'ethan.michel@yahoo.com'),
(71, 'Lemoine', 'Mia', STR_TO_DATE('07/04/2014', '%d/%m/%Y'), 29.30, 'mia.lemoine@gmail.com'),
(72, 'Morel', 'Noah', STR_TO_DATE('14/06/2012', '%d/%m/%Y'), 36.30, 'noah.morel@yahoo.com'),
(73, 'Garcia', 'Léonie', STR_TO_DATE('23/07/2015', '%d/%m/%Y'), 28.30, 'leonie.garcia@laposte.fr'),
(74, 'Roux', 'Tom', STR_TO_DATE('21/10/2013', '%d/%m/%Y'), 33.30, 'tom.roux@wanadoo.fr'),
(75, 'Fournier', 'Lola', STR_TO_DATE('31/12/2016', '%d/%m/%Y'), 26.30, 'lola.fournier@gmail.com'),
(76, 'Girard', 'Arthur', STR_TO_DATE('13/03/2011', '%d/%m/%Y'), 41.30, 'arthur.girard@yahoo.com'),
(77, 'Bonnet', 'Emma', STR_TO_DATE('08/05/2014', '%d/%m/%Y'), 30.40, 'emma.bonnet@laposte.fr'),
(78, 'Dupuis', 'Lucas', STR_TO_DATE('01/06/2012', '%d/%m/%Y'), 35.40, 'lucas.dupuis@wanadoo.fr'),
(79, 'Michel', 'Chloe', STR_TO_DATE('22/11/2015', '%d/%m/%Y'), 27.40, 'chloe.michel@gmail.com'),
(80, 'Lemoine', 'Hugo', STR_TO_DATE('19/08/2013', '%d/%m/%Y'), 32.40, 'hugo.lemoine@yahoo.com'),
(81, 'Blanc', 'Léa', STR_TO_DATE('02/09/2014', '%d/%m/%Y'), 30.60, 'lea.blanc@gmail.com'),
(82, 'Renard', 'Louis', STR_TO_DATE('12/04/2012', '%d/%m/%Y'), 36.60, 'louis.renard@yahoo.com'),
(83, 'Marchand', 'Alice', STR_TO_DATE('05/02/2015', '%d/%m/%Y'), 28.60, 'alice.marchand@laposte.fr'),
(84, 'Gauthier', 'Tom', STR_TO_DATE('15/03/2013', '%d/%m/%Y'), 33.60, 'tom.gauthier@wanadoo.fr'),
(85, 'Perrin', 'Lina', STR_TO_DATE('29/10/2016', '%d/%m/%Y'), 26.60, 'lina.perrin@gmail.com'),
(86, 'Renaud', 'Ethan', STR_TO_DATE('14/01/2011', '%d/%m/%Y'), 41.60, 'ethan.renaud@yahoo.com'),
(87, 'Barbier', 'Mia', STR_TO_DATE('11/08/2014', '%d/%m/%Y'), 30.80, 'mia.barbier@laposte.fr'),
(88, 'Lemoine', 'Noah', STR_TO_DATE('22/12/2012', '%d/%m/%Y'), 36.80, 'noah.lemoine@wanadoo.fr'),
(89, 'Lefevre', 'Léonie', STR_TO_DATE('03/09/2015', '%d/%m/%Y'), 28.80, 'leonie.lefevre@gmail.com'),
(90, 'Dupont', 'Tom', STR_TO_DATE('10/10/2013', '%d/%m/%Y'), 33.80, 'tom.dupont@yahoo.com'),
(91, 'Moreau', 'Lola', STR_TO_DATE('07/05/2014', '%d/%m/%Y'), 29.20, 'lola.moreau@gmail.com'),
(92, 'Simon', 'Arthur', STR_TO_DATE('14/07/2012', '%d/%m/%Y'), 34.20, 'arthur.simon@yahoo.com'),
(93, 'Michel', 'Emma', STR_TO_DATE('30/08/2015', '%d/%m/%Y'), 28.20, 'emma.michel@laposte.fr'),
(94, 'Garcia', 'Lucas', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 33.20, 'lucas.garcia@wanadoo.fr'),
(95, 'Roux', 'Chloe', STR_TO_DATE('09/03/2016', '%d/%m/%Y'), 25.20, 'chloe.roux@gmail.com'),
(96, 'Fournier', 'Louis', STR_TO_DATE('11/01/2011', '%d/%m/%Y'), 40.20, 'louis.fournier@yahoo.com'),
(97, 'Girard', 'Alice', STR_TO_DATE('05/11/2014', '%d/%m/%Y'), 30.30, 'alice.girard@laposte.fr'),
(98, 'Bonnet', 'Tom', STR_TO_DATE('29/04/2012', '%d/%m/%Y'), 35.30, 'tom.bonnet@wanadoo.fr'),
(99, 'Dupuis', 'Lina', STR_TO_DATE('14/08/2015', '%d/%m/%Y'), 27.30, 'lina.dupuis@gmail.com'),
(100, 'Michel', 'Ethan', STR_TO_DATE('24/02/2013', '%d/%m/%Y'), 32.30, 'ethan.michel@yahoo.com');