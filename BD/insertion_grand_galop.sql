-- Insertions des poneys. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO PONEY (id_po, nom_po, charge_max) VALUES
(1, 'Bella', 35.45),
(2, 'Charlie', 34.89),
(3, 'Daisy', 35.67),
(4, 'Max', 32.34),
(5, 'Luna', 41.23),
(6, 'Rocky', 43.21),
(7, 'Molly', 38.76),
(8, 'Buddy', 34.56),
(9, 'Lucy', 45.67),
(10, 'Jack', 35.12),
(11, 'Sadie', 36.78),
(12, 'Toby', 39.45),
(13, 'Coco', 38.34),
(14, 'Bailey', 42.56),
(15, 'Milo', 31.78),
(16, 'Ruby', 46.89),
(17, 'Oscar', 35.67),
(18, 'Rosie', 44.23),
(19, 'Teddy', 32.45),
(20, 'Lola', 37.89),
(21, 'Leo', 43.56),
(22, 'Zoe', 40.12),
(23, 'Nala', 34.78),
(24, 'Finn', 43.21),
(25, 'Ellie', 37.34),
(26, 'Rex', 46.78),
(27, 'Penny', 40.45),
(28, 'Archie', 35.12),
(29, 'Maggie', 48.89),
(30, 'Duke', 41.67);

-- Insertion de 10 moniteurs générés par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO MONITEUR (id_m, nom_m, prenom_m, date_de_naissance, poids, email, mdp) VALUES
(1, 'Dupont', 'Jean', STR_TO_DATE('21/05/1991', '%d/%m/%Y'), 75.50, 'jean.dupont@gmail.com', "aaaa"),
(2, 'Martin', 'Sophie', STR_TO_DATE('02/03/1995', '%d/%m/%Y'), 62.30, 'sophie.martin@wanadoo.com', "aabb"),
(3, 'Bernard', 'Luc', STR_TO_DATE('30/11/1972', '%d/%m/%Y'), 80.20, 'luc.bernard@yahoo.com', "1234"),
(4, 'Robert', 'Marie', STR_TO_DATE('27/07/1994', '%d/%m/%Y'), 68.40, 'marie.robert@yahoo.com', "azaz12"),
(5, 'Petit', 'Pierre', STR_TO_DATE('13/01/1983', '%d/%m/%Y'), 77.10, 'pierre.petit@gmail.com', "PetitPierre1234"),
(6, 'Durand', 'Claire', STR_TO_DATE('05/09/1996', '%d/%m/%Y'), 59.80, 'claire.durand@wanadoo.com', "ffjop"),
(7, 'Leroy', 'Julien', STR_TO_DATE('06/10/1979', '%d/%m/%Y'), 85.60, 'julien.leroy@gmail.com', "fjdfjjfdjfidhuhgklvm"),
(8, 'Moreau', 'Isabelle', STR_TO_DATE('04/04/1991', '%d/%m/%Y'), 64.50, 'isabelle.moreau@gmail.com', "21gfg42g1h4h2f"),
(9, 'Simon', 'Thomas', STR_TO_DATE('17/01/1985', '%d/%m/%Y'), 78.90, 'thomas.simon@laposte.fr', "12"),
(10, 'Laurent', 'Emilie', STR_TO_DATE('24/03/1994', '%d/%m/%Y'), 61.70, 'emilie.laurent@orange.fr', "gjh45d4g5f?dg78ty2dfg15f!75t4");

-- Insertion de 100 adhérents générés par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO ADHERENT (id_a, nom_a, prenom_a, date_de_naissance, poids, email, mdp) VALUES
(1, 'Durand', 'Paul', STR_TO_DATE('10/03/2014', '%d/%m/%Y'), 30.50, 'paul.durand@gmail.com', 'moonlightMystery'),
(2, 'Petit', 'Marie', STR_TO_DATE('15/06/2012', '%d/%m/%Y'), 35.20, 'marie.petit@yahoo.com', 'cosmicVoyager'),
(3, 'Martin', 'Julien', STR_TO_DATE('18/01/2015', '%d/%m/%Y'), 28.40, 'julien.martin@laposte.fr', 'starlightWhisper'),
(4, 'Bernard', 'Camille', STR_TO_DATE('22/08/2013', '%d/%m/%Y'), 32.10, 'camille.bernard@wanadoo.fr', 'jungleExplorer'),
(5, 'Dubois', 'Léon', STR_TO_DATE('30/12/2016', '%d/%m/%Y'), 25.30, 'leon.dubois@gmail.com', 'velvetStorm'),
(6, 'Thomas', 'Léa', STR_TO_DATE('03/11/2011', '%d/%m/%Y'), 40.50, 'lea.thomas@yahoo.com', 'crimsonHawk'),
(7, 'Robert', 'Anna', STR_TO_DATE('11/05/2014', '%d/%m/%Y'), 29.80, 'anna.robert@laposte.fr', 'oceanBreeze123'),
(8, 'Richard', 'Maxime', STR_TO_DATE('19/07/2012', '%d/%m/%Y'), 34.60, 'maxime.richard@wanadoo.fr', 'rainbowNinja'),
(9, 'Simon', 'Louise', STR_TO_DATE('27/10/2015', '%d/%m/%Y'), 27.90, 'louise.simon@gmail.com', 'galacticWarrior'),
(10, 'Michel', 'Oscar', STR_TO_DATE('14/02/2013', '%d/%m/%Y'), 31.70, 'oscar.michel@yahoo.com', 'phoenixRise'),
(11, 'Lemoine', 'Alice', STR_TO_DATE('04/11/2014', '%d/%m/%Y'), 30.50, 'alice.lemoine@gmail.com', 'whaleSong22'),
(12, 'Morel', 'Lucas', STR_TO_DATE('15/06/2012', '%d/%m/%Y'), 35.20, 'lucas.morel@yahoo.com', 'dragonFlame'),
(13, 'Garcia', 'Emma', STR_TO_DATE('08/05/2015', '%d/%m/%Y'), 28.40, 'emma.garcia@laposte.fr', 'stellarPilot'),
(14, 'Roux', 'Hugo', STR_TO_DATE('22/07/2013', '%d/%m/%Y'), 32.10, 'hugo.roux@wanadoo.fr', 'forestGuardian'),
(15, 'Fournier', 'Chloe', STR_TO_DATE('30/09/2016', '%d/%m/%Y'), 25.30, 'chloe.fournier@gmail.com', 'nebulaDream'),
(16, 'Girard', 'Louis', STR_TO_DATE('03/01/2011', '%d/%m/%Y'), 40.50, 'louis.girard@yahoo.com', 'unicornSparkles2023'),
(17, 'Bonnet', 'Léa', STR_TO_DATE('11/08/2014', '%d/%m/%Y'), 29.80, 'lea.bonnet@laposte.fr', 'moonShadow'),
(18, 'Dupuis', 'Tom', STR_TO_DATE('19/11/2012', '%d/%m/%Y'), 34.60, 'tom.dupuis@wanadoo.fr', 'tigerLily'),
(19, 'Michel', 'Jade', STR_TO_DATE('27/02/2015', '%d/%m/%Y'), 27.90, 'jade.michel@gmail.com', 'shiningStar'),
(20, 'Lemoine', 'Arthur', STR_TO_DATE('14/04/2013', '%d/%m/%Y'), 31.70, 'arthur.lemoine@yahoo.com', 'quantumLeap'),
(21, 'Blanc', 'Nina', STR_TO_DATE('10/03/2014', '%d/%m/%Y'), 30.00, 'nina.blanc@gmail.com', 'crystalBloom'),
(22, 'Renard', 'Leo', STR_TO_DATE('06/12/2012', '%d/%m/%Y'), 36.00, 'leo.renard@yahoo.com', 'silverArrow'),
(23, 'Marchand', 'Lina', STR_TO_DATE('22/02/2015', '%d/%m/%Y'), 28.00, 'lina.marchand@laposte.fr', 'blazingInferno'),
(24, 'Gauthier', 'Ethan', STR_TO_DATE('05/11/2013', '%d/%m/%Y'), 33.00, 'ethan.gauthier@wanadoo.fr', 'wizardMoon'),
(25, 'Perrin', 'Mia', STR_TO_DATE('30/01/2016', '%d/%m/%Y'), 26.00, 'mia.perrin@gmail.com', 'phoenixFlight'),
(26, 'Renaud', 'Noah', STR_TO_DATE('11/05/2011', '%d/%m/%Y'), 41.00, 'noah.renaud@yahoo.com', 'cosmicSurfer'),
(27, 'Barbier', 'Léonie', STR_TO_DATE('17/06/2014', '%d/%m/%Y'), 30.50, 'leonie.barbier@laposte.fr', 'midnightBlaze'),
(28, 'Lemoine', 'Tom', STR_TO_DATE('09/03/2012', '%d/%m/%Y'), 35.50, 'tom.lemoine@wanadoo.fr', 'galaxyHunter'),
(29, 'Lefevre', 'Lola', STR_TO_DATE('29/05/2015', '%d/%m/%Y'), 27.50, 'lola.lefevre@gmail.com', 'mysticVoyager'),
(30, 'Dupont', 'Arthur', STR_TO_DATE('18/02/2013', '%d/%m/%Y'), 32.50, 'arthur.dupont@yahoo.com', 'thunderWolf'),
(31, 'Moreau', 'Emma', STR_TO_DATE('23/10/2014', '%d/%m/%Y'), 29.00, 'emma.moreau@gmail.com', 'sunsetSorcerer'),
(32, 'Simon', 'Lucas', STR_TO_DATE('03/09/2012', '%d/%m/%Y'), 34.00, 'lucas.simon@yahoo.com', 'frostFury'),
(33, 'Michel', 'Chloe', STR_TO_DATE('11/11/2015', '%d/%m/%Y'), 28.50, 'chloe.michel@laposte.fr', 'tigerFlame'),
(34, 'Garcia', 'Hugo', STR_TO_DATE('21/06/2013', '%d/%m/%Y'), 33.50, 'hugo.garcia@wanadoo.fr', 'oceanVoyage'),
(35, 'Roux', 'Léa', STR_TO_DATE('17/04/2016', '%d/%m/%Y'), 25.50, 'lea.roux@gmail.com', 'mountainPeak'),
(36, 'Fournier', 'Louis', STR_TO_DATE('13/11/2011', '%d/%m/%Y'), 40.00, 'louis.fournier@yahoo.com', 'crystalWave'),
(37, 'Girard', 'Alice', STR_TO_DATE('05/05/2014', '%d/%m/%Y'), 30.20, 'alice.girard@laposte.fr', 'whisperingWind'),
(38, 'Bonnet', 'Tom', STR_TO_DATE('24/08/2012', '%d/%m/%Y'), 35.80, 'tom.bonnet@wanadoo.fr', 'coralReef'),
(39, 'Dupuis', 'Lina', STR_TO_DATE('17/03/2015', '%d/%m/%Y'), 27.80, 'lina.dupuis@gmail.com', 'mysticHorizon'),
(40, 'Michel', 'Ethan', STR_TO_DATE('12/04/2013', '%d/%m/%Y'), 32.80, 'ethan.michel@yahoo.com', 'phantomStar'),
(41, 'Lemoine', 'Mia', STR_TO_DATE('02/02/2014', '%d/%m/%Y'), 29.80, 'mia.lemoine@gmail.com', 'galacticPulse'),
(42, 'Morel', 'Noah', STR_TO_DATE('20/07/2012', '%d/%m/%Y'), 36.20, 'noah.morel@yahoo.com', 'password'),
(43, 'Garcia', 'Léonie', STR_TO_DATE('27/11/2015', '%d/%m/%Y'), 28.20, 'leonie.garcia@laposte.fr', 'unicornSparkles2023'),
(44, 'Roux', 'Tom', STR_TO_DATE('30/09/2013', '%d/%m/%Y'), 33.20, 'tom.roux@wanadoo.fr', 'cosmicVoyager'),
(45, 'Fournier', 'Lola', STR_TO_DATE('19/06/2016', '%d/%m/%Y'), 26.20, 'lola.fournier@gmail.com', 'rainbowNinja'),
(46, 'Girard', 'Arthur', STR_TO_DATE('09/01/2011', '%d/%m/%Y'), 41.20, 'arthur.girard@yahoo.com', 'galacticWarrior'),
(47, 'Bonnet', 'Emma', STR_TO_DATE('23/12/2014', '%d/%m/%Y'), 30.40, 'emma.bonnet@laposte.fr', 'whaleSong22'),
(48, 'Dupuis', 'Lucas', STR_TO_DATE('14/04/2012', '%d/%m/%Y'), 35.40, 'lucas.dupuis@wanadoo.fr', 'jungleExplorer'),
(49, 'Michel', 'Chloe', STR_TO_DATE('21/10/2015', '%d/%m/%Y'), 27.40, 'chloe.michel@gmail.com', 'phoenixRise'),
(50, 'Lemoine', 'Hugo', STR_TO_DATE('26/07/2013', '%d/%m/%Y'), 32.40, 'hugo.lemoine@yahoo.com', 'quantumLeap'),
(51, 'Blanc', 'Léa', STR_TO_DATE('13/12/2014', '%d/%m/%Y'), 30.60, 'lea.blanc@gmail.com', 'oceanBreeze123'),
(52, 'Renard', 'Louis', STR_TO_DATE('08/06/2012', '%d/%m/%Y'), 36.60, 'louis.renard@yahoo.com', 'dragonFlame'),
(53, 'Marchand', 'Alice', STR_TO_DATE('20/01/2015', '%d/%m/%Y'), 28.60, 'alice.marchand@laposte.fr', 'stellarPilot'),
(54, 'Gauthier', 'Tom', STR_TO_DATE('14/05/2013', '%d/%m/%Y'), 33.60, 'tom.gauthier@wanadoo.fr', 'forestGuardian'),
(55, 'Perrin', 'Lina', STR_TO_DATE('29/08/2016', '%d/%m/%Y'), 26.60, 'lina.gauthier@orange.fr', 'skyHighDream'),
(56, 'Renaud', 'Ethan', STR_TO_DATE('17/02/2011', '%d/%m/%Y'), 41.60, 'ethan.renaud@yahoo.com', 'mountainEcho'),
(57, 'Barbier', 'Mia', STR_TO_DATE('10/11/2014', '%d/%m/%Y'), 30.80, 'mia.barbier@laposte.fr', 'wizardMoon'),
(58, 'Lemoine', 'Noah', STR_TO_DATE('02/03/2012', '%d/%m/%Y'), 36.80, 'noah.lemoine@wanadoo.fr', 'nightStalker'),
(59, 'Lefevre', 'Léonie', STR_TO_DATE('27/07/2015', '%d/%m/%Y'), 28.80, 'leonie.lefevre@gmail.com', 'shiningStar'),
(60, 'Dupont', 'Tom', STR_TO_DATE('17/09/2013', '%d/%m/%Y'), 33.80, 'tom.dupont@yahoo.com', 'crimsonTide'),
(61, 'Moreau', 'Lola', STR_TO_DATE('25/05/2014', '%d/%m/%Y'), 29.20, 'lola.moreau@gmail.com', 'midnightMystery'),
(62, 'Simon', 'Arthur', STR_TO_DATE('14/07/2012', '%d/%m/%Y'), 34.20, 'arthur.simon@yahoo.com', 'silverArrow'),
(63, 'Michel', 'Emma', STR_TO_DATE('30/08/2015', '%d/%m/%Y'), 28.20, 'emma.michel@laposte.fr', 'goldenLion'),
(64, 'Garcia', 'Lucas', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 33.20, 'lucas.garcia@wanadoo.fr', 'frostFury'),
(65, 'Roux', 'Chloe', STR_TO_DATE('09/03/2016', '%d/%m/%Y'), 25.20, 'chloe.roux@gmail.com', 'desertStorm'),
(66, 'Fournier', 'Louis', STR_TO_DATE('11/01/2011', '%d/%m/%Y'), 40.20, 'louis.fournier@yahoo.com', 'thunderStrike'),
(67, 'Girard', 'Alice', STR_TO_DATE('05/11/2014', '%d/%m/%Y'), 30.30, 'alice.girard@laposte.fr', 'auroraBorealis'),
(68, 'Bonnet', 'Tom', STR_TO_DATE('29/04/2012', '%d/%m/%Y'), 35.30, 'tom.bonnet@wanadoo.fr', 'sandDune'),
(69, 'Dupuis', 'Lina', STR_TO_DATE('26/12/2015', '%d/%m/%Y'), 27.30, 'lina.dupuis@gmail.com', 'cycloneSpin'),
(70, 'Michel', 'Ethan', STR_TO_DATE('18/09/2013', '%d/%m/%Y'), 32.30, 'ethan.michel@yahoo.com', 'pearlHorizon'),
(71, 'Lemoine', 'Mia', STR_TO_DATE('07/04/2014', '%d/%m/%Y'), 29.30, 'mia.lemoine@gmail.com', 'meadowLark'),
(72, 'Morel', 'Noah', STR_TO_DATE('14/06/2012', '%d/%m/%Y'), 36.30, 'noah.morel@yahoo.com', 'coralReef'),
(73, 'Garcia', 'Léonie', STR_TO_DATE('23/07/2015', '%d/%m/%Y'), 28.30, 'leonie.garcia@laposte.fr', 'moonlitDance'),
(74, 'Roux', 'Tom', STR_TO_DATE('21/10/2013', '%d/%m/%Y'), 33.30, 'tom.roux@wanadoo.fr', 'sunsetBlaze'),
(75, 'Fournier', 'Lola', STR_TO_DATE('31/12/2016', '%d/%m/%Y'), 26.30, 'lola.fournier@gmail.com', 'ebonyFeather'),
(76, 'Girard', 'Arthur', STR_TO_DATE('13/03/2011', '%d/%m/%Y'), 41.30, 'arthur.girard@yahoo.com', 'cometTrail'),
(77, 'Bonnet', 'Emma', STR_TO_DATE('08/05/2014', '%d/%m/%Y'), 30.40, 'emma.bonnet@laposte.fr', 'crystalWave'),
(78, 'Dupuis', 'Lucas', STR_TO_DATE('01/06/2012', '%d/%m/%Y'), 35.40, 'lucas.dupuis@wanadoo.fr', 'phantomShade'),
(79, 'Michel', 'Chloe', STR_TO_DATE('22/11/2015', '%d/%m/%Y'), 27.40, 'chloe.michel@gmail.com', 'blazingInferno'),
(80, 'Lemoine', 'Hugo', STR_TO_DATE('19/08/2013', '%d/%m/%Y'), 32.40, 'hugo.lemoine@yahoo.com', 'serpentWhisper'),
(81, 'Blanc', 'Léa', STR_TO_DATE('02/09/2014', '%d/%m/%Y'), 30.60, 'lea.blanc@gmail.com', 'eagleWing'),
(82, 'Renard', 'Louis', STR_TO_DATE('12/04/2012', '%d/%m/%Y'), 36.60, 'louis.renard@yahoo.com', 'jaguarPaw'),
(83, 'Marchand', 'Alice', STR_TO_DATE('05/02/2015', '%d/%m/%Y'), 28.60, 'alice.marchand@laposte.fr', 'orchidDream'),
(84, 'Gauthier', 'Tom', STR_TO_DATE('15/03/2013', '%d/%m/%Y'), 33.60, 'tom.gauthier@wanadoo.fr', 'tidalTwist'),
(85, 'Perrin', 'Lina', STR_TO_DATE('29/10/2016', '%d/%m/%Y'), 26.60, 'lina.perrin@gmail.com', 'emeraldGlow'),
(86, 'Renaud', 'Ethan', STR_TO_DATE('14/01/2011', '%d/%m/%Y'), 41.60, 'ethan.renaud@yahoo.com', 'cycloneRush'),
(87, 'Barbier', 'Mia', STR_TO_DATE('11/08/2014', '%d/%m/%Y'), 30.80, 'mia.barbier@laposte.fr', 'moonShadow'),
(88, 'Lemoine', 'Noah', STR_TO_DATE('22/12/2012', '%d/%m/%Y'), 36.80, 'noah.lemoine@wanadoo.fr', 'phantomFury'),
(89, 'Lefevre', 'Léonie', STR_TO_DATE('03/09/2015', '%d/%m/%Y'), 28.80, 'leonie.lefevre@gmail.com', 'dragonWhisper'),
(90, 'Dupont', 'Tom', STR_TO_DATE('10/10/2013', '%d/%m/%Y'), 33.80, 'tom.dupont@yahoo.com', 'crystalBloom'),
(91, 'Moreau', 'Lola', STR_TO_DATE('07/05/2014', '%d/%m/%Y'), 29.20, 'lola.moreau@gmail.com', 'nebulaDream'),
(92, 'Simon', 'Arthur', STR_TO_DATE('14/07/2012', '%d/%m/%Y'), 34.20, 'arthur.simon@yahoo.com', 'goldenAspen'),
(93, 'Michel', 'Emma', STR_TO_DATE('30/08/2015', '%d/%m/%Y'), 28.20, 'emma.michel@laposte.fr', 'rubyMirage'),
(94, 'Garcia', 'Lucas', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 33.20, 'lucas.garcia@wanadoo.fr', 'stellarPhoenix'),
(95, 'Roux', 'Chloe', STR_TO_DATE('09/03/2016', '%d/%m/%Y'), 25.20, 'chloe.roux@gmail.com', 'tigerLily'),
(96, 'Fournier', 'Louis', STR_TO_DATE('11/01/2011', '%d/%m/%Y'), 40.20, 'louis.fournier@yahoo.com', 'velvetVortex'),
(97, 'Girard', 'Alice', STR_TO_DATE('05/11/2014', '%d/%m/%Y'), 30.30, 'alice.girard@laposte.fr', 'whisperingWind'),
(98, 'Bonnet', 'Tom', STR_TO_DATE('29/04/2012', '%d/%m/%Y'), 35.30, 'tom.bonnet@wanadoo.fr', 'crimsonEcho'),
(99, 'Dupuis', 'Lina', STR_TO_DATE('14/08/2015', '%d/%m/%Y'), 27.30, 'lina.dupuis@gmail.com', 'lunarGlow'),
(100, 'Michel', 'Ethan', STR_TO_DATE('24/02/2013', '%d/%m/%Y'), 32.30, 'ethan.michel@yahoo.com', 'Vroom1234');

-- Insertions des cours hebdomadaires. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO COURS (id_c, id_m, nb_pe, h_de_debut, duree, date_c, prix) VALUES

-- Cours hebdomadaires du lundi
(1, 1, 10, 18, 1, '2025-01-08', 25.00), -- Lundi
(2, 1, 10, 18, 1, '2025-01-15', 25.00), -- Lundi
(3, 1, 10, 18, 1, '2025-01-22', 25.00), -- Lundi
(4, 1, 10, 18, 1, '2025-01-29', 25.00), -- Lundi
(5, 1, 10, 18, 1, '2025-02-05', 25.00), -- Lundi
(6, 1, 10, 18, 1, '2025-02-12', 25.00), -- Lundi
(7, 1, 10, 18, 1, '2025-02-19', 25.00), -- Lundi
(8, 1, 10, 18, 1, '2025-02-26', 25.00), -- Lundi
(9, 1, 10, 18, 1, '2025-03-04', 25.00), -- Lundi
(10, 1, 10, 18, 1, '2025-03-11', 25.00), -- Lundi
(11, 1, 10, 18, 1, '2025-03-18', 25.00), -- Lundi
(12, 1, 10, 18, 1, '2025-03-25', 25.00), -- Lundi
(13, 1, 10, 18, 1, '2025-04-01', 25.00), -- Lundi
(14, 1, 10, 18, 1, '2025-04-08', 25.00), -- Lundi
(15, 1, 10, 18, 1, '2025-04-15', 25.00), -- Lundi
(16, 1, 10, 18, 1, '2025-04-22', 25.00), -- Lundi
(17, 1, 10, 18, 1, '2025-04-29', 25.00), -- Lundi
(18, 1, 10, 18, 1, '2025-05-06', 25.00), -- Lundi
(19, 1, 10, 18, 1, '2025-05-13', 25.00), -- Lundi
(20, 1, 10, 18, 1, '2025-05-20', 25.00), -- Lundi
(21, 1, 10, 18, 1, '2025-05-27', 25.00), -- Lundi
(22, 1, 10, 18, 1, '2025-06-03', 25.00), -- Lundi
(23, 1, 10, 18, 1, '2025-06-10', 25.00), -- Lundi
(24, 1, 10, 18, 1, '2025-06-17', 25.00), -- Lundi

-- Cours hebdomadaires du mardi
(25, 1, 10, 18, 1, '2025-01-09', 25.00), -- Mardi
(26, 1, 10, 18, 1, '2025-01-16', 25.00), -- Mardi
(27, 1, 10, 18, 1, '2025-01-23', 25.00), -- Mardi
(28, 1, 10, 18, 1, '2025-01-30', 25.00), -- Mardi
(29, 1, 10, 18, 1, '2025-02-06', 25.00), -- Mardi
(30, 1, 10, 18, 1, '2025-02-13', 25.00), -- Mardi
(31, 1, 10, 18, 1, '2025-02-20', 25.00), -- Mardi
(32, 1, 10, 18, 1, '2025-02-27', 25.00), -- Mardi
(33, 1, 10, 18, 1, '2025-03-05', 25.00), -- Mardi
(34, 1, 10, 18, 1, '2025-03-12', 25.00), -- Mardi
(35, 1, 10, 18, 1, '2025-03-19', 25.00), -- Mardi
(36, 1, 10, 18, 1, '2025-03-26', 25.00), -- Mardi
(37, 1, 10, 18, 1, '2025-04-02', 25.00), -- Mardi
(38, 1, 10, 18, 1, '2025-04-09', 25.00), -- Mardi
(39, 1, 10, 18, 1, '2025-04-16', 25.00), -- Mardi
(40, 1, 10, 18, 1, '2025-04-23', 25.00), -- Mardi
(41, 1, 10, 18, 1, '2025-04-30', 25.00), -- Mardi
(42, 1, 10, 18, 1, '2025-05-07', 25.00), -- Mardi
(43, 1, 10, 18, 1, '2025-05-14', 25.00), -- Mardi
(44, 1, 10, 18, 1, '2025-05-21', 25.00), -- Mardi
(45, 1, 10, 18, 1, '2025-05-28', 25.00), -- Mardi
(46, 1, 10, 18, 1, '2025-06-04', 25.00), -- Mardi
(47, 1, 10, 18, 1, '2025-06-11', 25.00), -- Mardi
(48, 1, 10, 18, 1, '2025-06-18', 25.00), -- Mardi

-- Cours hebdomadaires du mercredi
(49, 2, 8, 14, 1, '2025-01-10', 28.00), -- Mercredi
(50, 2, 8, 16, 1, '2025-01-10', 28.00), -- Mercredi
(51, 2, 8, 17, 1, '2025-01-10', 28.00), -- Mercredi
(52, 2, 8, 14, 1, '2025-01-17', 28.00), -- Mercredi
(53, 2, 8, 16, 1, '2025-01-17', 28.00), -- Mercredi
(54, 2, 8, 17, 1, '2025-01-17', 28.00), -- Mercredi
(55, 2, 8, 14, 1, '2025-01-24', 28.00), -- Mercredi
(56, 2, 8, 16, 1, '2025-01-24', 28.00), -- Mercredi
(57, 2, 8, 17, 1, '2025-01-24', 28.00), -- Mercredi
(58, 2, 8, 14, 1, '2025-01-31', 28.00), -- Mercredi
(59, 2, 8, 16, 1, '2025-01-31', 28.00), -- Mercredi
(60, 2, 8, 17, 1, '2025-01-31', 28.00), -- Mercredi
(61, 2, 8, 14, 1, '2025-02-07', 28.00), -- Mercredi
(62, 2, 8, 16, 1, '2025-02-07', 28.00), -- Mercredi
(63, 2, 8, 17, 1, '2025-02-07', 28.00), -- Mercredi
(64, 2, 8, 14, 1, '2025-02-14', 28.00), -- Mercredi
(65, 2, 8, 16, 1, '2025-02-14', 28.00), -- Mercredi
(66, 2, 8, 17, 1, '2025-02-14', 28.00), -- Mercredi
(67, 2, 8, 14, 1, '2025-02-21', 28.00), -- Mercredi
(68, 2, 8, 16, 1, '2025-02-21', 28.00), -- Mercredi
(69, 2, 8, 17, 1, '2025-02-21', 28.00), -- Mercredi
(70, 2, 8, 14, 1, '2025-02-28', 28.00), -- Mercredi
(71, 2, 8, 16, 1, '2025-02-28', 28.00), -- Mercredi
(72, 2, 8, 17, 1, '2025-02-28', 28.00), -- Mercredi
(73, 2, 8, 14, 1, '2025-03-06', 28.00), -- Mercredi
(74, 2, 8, 16, 1, '2025-03-06', 28.00), -- Mercredi
(75, 2, 8, 17, 1, '2025-03-06', 28.00), -- Mercredi
(76, 2, 8, 14, 1, '2025-03-13', 28.00), -- Mercredi
(77, 2, 8, 16, 1, '2025-03-13', 28.00), -- Mercredi
(78, 2, 8, 17, 1, '2025-03-13', 28.00), -- Mercredi
(79, 2, 8, 14, 1, '2025-03-20', 28.00), -- Mercredi
(80, 2, 8, 16, 1, '2025-03-20', 28.00), -- Mercredi
(81, 2, 8, 17, 1, '2025-03-20', 28.00), -- Mercredi
(82, 2, 8, 14, 1, '2025-03-27', 28.00), -- Mercredi
(83, 2, 8, 16, 1, '2025-03-27', 28.00), -- Mercredi
(84, 2, 8, 17, 1, '2025-03-27', 28.00), -- Mercredi
(85, 2, 8, 14, 1, '2025-04-03', 28.00), -- Mercredi
(86, 2, 8, 16, 1, '2025-04-03', 28.00), -- Mercredi
(87, 2, 8, 17, 1, '2025-04-03', 28.00), -- Mercredi
(88, 2, 8, 14, 1, '2025-04-10', 28.00), -- Mercredi
(89, 2, 8, 16, 1, '2025-04-10', 28.00), -- Mercredi
(90, 2, 8, 17, 1, '2025-04-10', 28.00), -- Mercredi
(91, 2, 8, 14, 1, '2025-04-17', 28.00), -- Mercredi
(92, 2, 8, 16, 1, '2025-04-17', 28.00), -- Mercredi
(93, 2, 8, 17, 1, '2025-04-17', 28.00), -- Mercredi
(94, 2, 8, 14, 1, '2025-04-24', 28.00), -- Mercredi
(95, 2, 8, 16, 1, '2025-04-24', 28.00), -- Mercredi
(96, 2, 8, 17, 1, '2025-04-24', 28.00), -- Mercredi
(97, 2, 8, 14, 1, '2025-05-01', 28.00), -- Mercredi
(98, 2, 8, 16, 1, '2025-05-01', 28.00), -- Mercredi
(99, 2, 8, 17, 1, '2025-05-01', 28.00), -- Mercredi
(100, 2, 8, 14, 1, '2025-05-08', 28.00), -- Mercredi
(101, 2, 8, 16, 1, '2025-05-08', 28.00), -- Mercredi
(102, 2, 8, 17, 1, '2025-05-08', 28.00), -- Mercredi
(103, 2, 8, 14, 1, '2025-05-15', 28.00), -- Mercredi
(104, 2, 8, 16, 1, '2025-05-15', 28.00), -- Mercredi
(105, 2, 8, 17, 1, '2025-05-15', 28.00), -- Mercredi
(106, 2, 8, 14, 1, '2025-05-22', 28.00), -- Mercredi
(107, 2, 8, 16, 1, '2025-05-22', 28.00), -- Mercredi
(108, 2, 8, 17, 1, '2025-05-22', 28.00), -- Mercredi
(109, 2, 8, 14, 1, '2025-05-29', 28.00), -- Mercredi
(110, 2, 8, 16, 1, '2025-05-29', 28.00), -- Mercredi
(111, 2, 8, 17, 1, '2025-05-29', 28.00), -- Mercredi
(112, 2, 8, 17, 1, '2025-05-29', 28.00), -- Mercredi
(113, 2, 8, 14, 1, '2025-06-05', 28.00), -- Mercredi
(114, 2, 8, 16, 1, '2025-06-05', 28.00), -- Mercredi
(115, 2, 8, 17, 1, '2025-06-05', 28.00), -- Mercredi
(116, 2, 8, 14, 1, '2025-06-12', 28.00), -- Mercredi
(117, 2, 8, 16, 1, '2025-06-12', 28.00), -- Mercredi
(118, 2, 8, 17, 1, '2025-06-12', 28.00), -- Mercredi
(119, 2, 8, 14, 1, '2025-06-19', 28.00), -- Mercredi
(120, 2, 8, 16, 1, '2025-06-19', 28.00), -- Mercredi
(121, 2, 8, 17, 1, '2025-06-19', 28.00), -- Mercredi
(122, 2, 8, 14, 1, '2025-06-26', 28.00), -- Mercredi
(123, 2, 8, 16, 1, '2025-06-26', 28.00), -- Mercredi
(124, 2, 8, 17, 1, '2025-06-26', 28.00), -- Mercredi

-- Cours hebdomadaires du jeudi
(125, 2, 8, 17, 1, '2025-01-11', 28.00), -- Jeudi
(126, 2, 8, 17, 1, '2025-01-18', 28.00), -- Jeudi
(127, 2, 8, 17, 1, '2025-01-25', 28.00), -- Jeudi
(128, 2, 8, 17, 1, '2025-02-01', 28.00), -- Jeudi
(129, 2, 8, 17, 1, '2025-02-08', 28.00), -- Jeudi
(130, 2, 8, 17, 1, '2025-02-15', 28.00), -- Jeudi
(131, 2, 8, 17, 1, '2025-02-22', 28.00), -- Jeudi

(133, 2, 8, 17, 1, '2025-03-07', 28.00), -- Jeudi
(134, 2, 8, 17, 1, '2025-03-14', 28.00), -- Jeudi
(135, 2, 8, 17, 1, '2025-03-21', 28.00), -- Jeudi
(136, 2, 8, 17, 1, '2025-03-28', 28.00), -- Jeudi
(137, 2, 8, 17, 1, '2025-04-04', 28.00), -- Jeudi
(138, 2, 8, 17, 1, '2025-04-11', 28.00), -- Jeudi
(139, 2, 8, 17, 1, '2025-04-18', 28.00), -- Jeudi
(140, 2, 8, 17, 1, '2025-04-25', 28.00), -- Jeudi
(141, 2, 8, 17, 1, '2025-05-02', 28.00), -- Jeudi
(142, 2, 8, 17, 1, '2025-05-09', 28.00), -- Jeudi
(143, 2, 8, 17, 1, '2025-05-16', 28.00), -- Jeudi
(144, 2, 8, 17, 1, '2025-05-23', 28.00), -- Jeudi
(145, 2, 8, 17, 1, '2025-05-30', 28.00), -- Jeudi
(146, 2, 8, 17, 1, '2025-06-06', 28.00), -- Jeudi
(147, 2, 8, 17, 1, '2025-06-13', 28.00), -- Jeudi
(148, 2, 8, 17, 1, '2025-06-20', 28.00), -- Jeudi

-- Cours hebdomadaires du vendredi
(149, 3, 6, 19, 2, '2025-01-12', 30.00), -- Vendredi
(150, 3, 6, 19, 2, '2025-01-19', 30.00), -- Vendredi
(151, 3, 6, 19, 2, '2025-01-26', 30.00), -- Vendredi
(152, 3, 6, 19, 2, '2025-02-02', 30.00), -- Vendredi
(153, 3, 6, 19, 2, '2025-02-09', 30.00), -- Vendredi
(154, 3, 6, 19, 2, '2025-02-16', 30.00), -- Vendredi
(155, 3, 6, 19, 2, '2025-02-23', 30.00), -- Vendredi
(156, 3, 6, 19, 2, '2025-03-01', 30.00), -- Vendredi
(157, 3, 6, 19, 2, '2025-03-08', 30.00), -- Vendredi
(158, 3, 6, 19, 2, '2025-03-15', 30.00), -- Vendredi
(159, 3, 6, 19, 2, '2025-03-22', 30.00), -- Vendredi
(160, 3, 6, 19, 2, '2025-03-29', 30.00), -- Vendredi
(161, 3, 6, 19, 2, '2025-04-05', 30.00), -- Vendredi
(162, 3, 6, 19, 2, '2025-04-12', 30.00), -- Vendredi
(163, 3, 6, 19, 2, '2025-04-19', 30.00), -- Vendredi
(164, 3, 6, 19, 2, '2025-04-26', 30.00), -- Vendredi
(165, 3, 6, 19, 2, '2025-05-03', 30.00), -- Vendredi
(166, 3, 6, 19, 2, '2025-05-10', 30.00), -- Vendredi
(167, 3, 6, 19, 2, '2025-05-17', 30.00), -- Vendredi
(168, 3, 6, 19, 2, '2025-05-24', 30.00), -- Vendredi
(169, 3, 6, 19, 2, '2025-05-31', 30.00), -- Vendredi
(170, 3, 6, 19, 2, '2025-06-07', 30.00), -- Vendredi
(171, 3, 6, 19, 2, '2025-06-14', 30.00), -- Vendredi
(172, 3, 6, 19, 2, '2025-06-21', 30.00), -- Vendredi


-- Cours hebdomadaires du samedi
(173, 2, 8, 9, 1, '2025-01-06', 28.00),  -- Samedi matin
(174, 2, 8, 11, 1, '2025-01-06', 28.00), -- Samedi fin de matinée
(175, 2, 8, 14, 1, '2025-01-06', 28.00), -- Samedi après-midi
(176, 2, 8, 16, 1, '2025-01-06', 28.00), -- Samedi après-midi
(177, 2, 8, 9, 1, '2025-01-13', 28.00),  -- Samedi matin
(178, 2, 8, 11, 1, '2025-01-13', 28.00), -- Samedi fin de matinée
(179, 2, 8, 14, 1, '2025-01-13', 28.00), -- Samedi après-midi
(180, 2, 8, 16, 1, '2025-01-13', 28.00), -- Samedi après-midi
(181, 2, 8, 9, 1, '2025-01-20', 28.00),  -- Samedi matin
(182, 2, 8, 11, 1, '2025-01-20', 28.00), -- Samedi fin de matinée
(183, 2, 8, 14, 1, '2025-01-20', 28.00), -- Samedi après-midi
(184, 2, 8, 16, 1, '2025-01-20', 28.00), -- Samedi après-midi
(185, 2, 8, 9, 1, '2025-01-27', 28.00),  -- Samedi matin
(186, 2, 8, 11, 1, '2025-01-27', 28.00), -- Samedi fin de matinée
(187, 2, 8, 14, 1, '2025-01-27', 28.00), -- Samedi après-midi
(188, 2, 8, 16, 1, '2025-01-27', 28.00), -- Samedi après-midi
(189, 2, 8, 9, 1, '2025-02-03', 28.00),  -- Samedi matin
(190, 2, 8, 11, 1, '2025-02-03', 28.00), -- Samedi fin de matinée
(191, 2, 8, 14, 1, '2025-02-03', 28.00), -- Samedi après-midi
(192, 2, 8, 16, 1, '2025-02-03', 28.00), -- Samedi après-midi
(193, 2, 8, 9, 1, '2025-02-10', 28.00),  -- Samedi matin
(194, 2, 8, 11, 1, '2025-02-10', 28.00), -- Samedi fin de matinée
(195, 2, 8, 14, 1, '2025-02-10', 28.00), -- Samedi après-midi
(196, 2, 8, 16, 1, '2025-02-10', 28.00), -- Samedi après-midi
(197, 2, 8, 9, 1, '2025-02-17', 28.00),  -- Samedi matin
(198, 2, 8, 11, 1, '2025-02-17', 28.00), -- Samedi fin de matinée
(199, 2, 8, 14, 1, '2025-02-17', 28.00), -- Samedi après-midi
(200, 2, 8, 16, 1, '2025-02-17', 28.00), -- Samedi après-midi
(201, 2, 8, 9, 1, '2025-02-24', 28.00),  -- Samedi matin
(202, 2, 8, 11, 1, '2025-02-24', 28.00), -- Samedi fin de matinée
(203, 2, 8, 14, 1, '2025-02-24', 28.00), -- Samedi après-midi
(204, 2, 8, 16, 1, '2025-02-24', 28.00), -- Samedi après-midi
(205, 2, 8, 9, 1, '2025-03-02', 28.00),  -- Samedi matin
(206, 2, 8, 11, 1, '2025-03-02', 28.00), -- Samedi fin de matinée
(207, 2, 8, 14, 1, '2025-03-02', 28.00), -- Samedi après-midi
(208, 2, 8, 16, 1, '2025-03-02', 28.00), -- Samedi après-midi
(209, 2, 8, 9, 1, '2025-03-09', 28.00),  -- Samedi matin
(210, 2, 8, 11, 1, '2025-03-09', 28.00), -- Samedi fin de matinée
(211, 2, 8, 14, 1, '2025-03-09', 28.00), -- Samedi après-midi
(212, 2, 8, 16, 1, '2025-03-09', 28.00), -- Samedi après-midi
(213, 2, 8, 9, 1, '2025-03-16', 28.00),  -- Samedi matin
(214, 2, 8, 11, 1, '2025-03-16', 28.00), -- Samedi fin de matinée
(215, 2, 8, 14, 1, '2025-03-16', 28.00), -- Samedi après-midi
(216, 2, 8, 16, 1, '2025-03-16', 28.00), -- Samedi après-midi
(217, 2, 8, 9, 1, '2025-03-23', 28.00),  -- Samedi matin
(218, 2, 8, 11, 1, '2025-03-23', 28.00), -- Samedi fin de matinée
(219, 2, 8, 14, 1, '2025-03-23', 28.00), -- Samedi après-midi
(220, 2, 8, 16, 1, '2025-03-23', 28.00), -- Samedi après-midi
(221, 2, 8, 9, 1, '2025-03-30', 28.00),  -- Samedi matin
(222, 2, 8, 11, 1, '2025-03-30', 28.00), -- Samedi fin de matinée
(223, 2, 8, 14, 1, '2025-03-30', 28.00), -- Samedi après-midi
(224, 2, 8, 16, 1, '2025-03-30', 28.00), -- Samedi après-midi
(225, 2, 8, 9, 1, '2025-04-06', 28.00),  -- Samedi matin
(226, 2, 8, 11, 1, '2025-04-06', 28.00), -- Samedi fin de matinée
(227, 2, 8, 14, 1, '2025-04-06', 28.00), -- Samedi après-midi
(228, 2, 8, 16, 1, '2025-04-06', 28.00), -- Samedi après-midi
(229, 2, 8, 9, 1, '2025-04-13', 28.00),  -- Samedi matin
(230, 2, 8, 11, 1, '2025-04-13', 28.00), -- Samedi fin de matinée
(231, 2, 8, 14, 1, '2025-04-13', 28.00), -- Samedi après-midi
(232, 2, 8, 16, 1, '2025-04-13', 28.00), -- Samedi après-midi
(233, 2, 8, 9, 1, '2025-04-20', 28.00),  -- Samedi matin
(234, 2, 8, 11, 1, '2025-04-20', 28.00), -- Samedi fin de matinée
(235, 2, 8, 14, 1, '2025-04-20', 28.00), -- Samedi après-midi
(236, 2, 8, 16, 1, '2025-04-20', 28.00), -- Samedi après-midi
(237, 2, 8, 9, 1, '2025-04-27', 28.00),  -- Samedi matin
(238, 2, 8, 11, 1, '2025-04-27', 28.00), -- Samedi fin de matinée
(239, 2, 8, 14, 1, '2025-04-27', 28.00), -- Samedi après-midi
(240, 2, 8, 16, 1, '2025-04-27', 28.00), -- Samedi après-midi
(241, 2, 8, 9, 1, '2025-05-04', 28.00),  -- Samedi matin
(242, 2, 8, 11, 1, '2025-05-04', 28.00), -- Samedi fin de matinée
(243, 2, 8, 14, 1, '2025-05-04', 28.00), -- Samedi après-midi
(244, 2, 8, 16, 1, '2025-05-04', 28.00), -- Samedi après-midi
(245, 2, 8, 9, 1, '2025-05-11', 28.00),  -- Samedi matin
(246, 2, 8, 11, 1, '2025-05-11', 28.00), -- Samedi fin de matinée
(247, 2, 8, 14, 1, '2025-05-11', 28.00), -- Samedi après-midi
(248, 2, 8, 16, 1, '2025-05-11', 28.00), -- Samedi après-midi
(249, 2, 8, 9, 1, '2025-05-18', 28.00),  -- Samedi matin
(250, 2, 8, 11, 1, '2025-05-18', 28.00), -- Samedi fin de matinée
(251, 2, 8, 14, 1, '2025-05-18', 28.00), -- Samedi après-midi
(252, 2, 8, 16, 1, '2025-05-18', 28.00), -- Samedi après-midi
(253, 2, 8, 9, 1, '2025-05-25', 28.00),  -- Samedi matin
(254, 2, 8, 11, 1, '2025-05-25', 28.00), -- Samedi fin de matinée
(255, 2, 8, 14, 1, '2025-05-25', 28.00), -- Samedi après-midi
(256, 2, 8, 16, 1, '2025-05-25', 28.00), -- Samedi après-midi
(257, 2, 8, 9, 1, '2025-06-01', 28.00),  -- Samedi matin
(258, 2, 8, 11, 1, '2025-06-01', 28.00), -- Samedi fin de matinée
(259, 2, 8, 14, 1, '2025-06-01', 28.00), -- Samedi après-midi
(260, 2, 8, 16, 1, '2025-06-01', 28.00), -- Samedi après-midi
(261, 2, 8, 9, 1, '2025-06-08', 28.00),  -- Samedi matin
(262, 2, 8, 11, 1, '2025-06-08', 28.00), -- Samedi fin de matinée
(263, 2, 8, 14, 1, '2025-06-08', 28.00), -- Samedi après-midi
(264, 2, 8, 16, 1, '2025-06-08', 28.00), -- Samedi après-midi
(265, 2, 8, 9, 1, '2025-06-15', 28.00),  -- Samedi matin
(266, 2, 8, 11, 1, '2025-06-15', 28.00), -- Samedi fin de matinée
(267, 2, 8, 14, 1, '2025-06-15', 28.00), -- Samedi après-midi
(268, 2, 8, 16, 1, '2025-06-15', 28.00), -- Samedi après-midi
(269, 2, 8, 9, 1, '2025-06-22', 28.00),  -- Samedi matin
(270, 2, 8, 11, 1, '2025-06-22', 28.00), -- Samedi fin de matinée
(271, 2, 8, 14, 1, '2025-06-22', 28.00), -- Samedi après-midi
(272, 2, 8, 16, 1, '2025-06-22', 28.00), -- Samedi après-midi
(273, 2, 8, 9, 1, '2025-06-29', 28.00),  -- Samedi matin
(274, 2, 8, 11, 1, '2025-06-29', 28.00), -- Samedi fin de matinée
(275, 2, 8, 14, 1, '2025-06-29', 28.00), -- Samedi après-midi
(276, 2, 8, 16, 1, '2025-06-29', 28.00); -- Samedi après-midi

-- Insertions des réservations. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO RESERVER (id_a, id_po, id_c) VALUES
(11, 1, 25),  -- Adhérent Alice monte Poney 1 le 9 janvier
(12, 2, 25),  -- Adhérent Lucas monte Poney 2 le 9 janvier
(13, 3, 25),  -- Adhérent Emma monte Poney 3 le 9 janvier
(14, 4, 25),  -- Adhérent Hugo monte Poney 4 le 9 janvier
(15, 5, 25),  -- Adhérent Chloe monte Poney 5 le 9 janvier
(16, 6, 25),  -- Adhérent Louis monte Poney 6 le 9 janvier
(17, 7, 25),  -- Adhérent Léa monte Poney 7 le 9 janvier
(20, 10, 25), -- Adhérent Arthur monte Poney 10 le 9 janvier

(11, 1, 26),  -- Adhérent Alice monte Poney 1 le 16 janvier
(12, 2, 26),  -- Adhérent Lucas monte Poney 2 le 16 janvier
(13, 3, 26),  -- Adhérent Emma monte Poney 3 le 16 janvier
(14, 4, 26),  -- Adhérent Hugo monte Poney 4 le 16 janvier
(15, 5, 26),  -- Adhérent Chloe monte Poney 5 le 16 janvier
(16, 6, 26),  -- Adhérent Louis monte Poney 6 le 16 janvier
(19, 9, 26),  -- Adhérent Jade monte Poney 9 le 16 janvier
(20, 10, 26), -- Adhérent Arthur monte Poney 10 le 16 janvier

-- Réservations pour les mardis
(11, 1, 27),  -- Adhérent Alice monte Poney 1 le 23 janvier
(12, 2, 27),  -- Adhérent Lucas monte Poney 2 le 23 janvier
(13, 3, 27),  -- Adhérent Emma monte Poney 3 le 23 janvier
(14, 4, 27),  -- Adhérent Hugo monte Poney 4 le 23 janvier
(15, 5, 27),  -- Adhérent Chloe monte Poney 5 le 23 janvier
(17, 7, 27),  -- Adhérent Léa monte Poney 7 le 23 janvier
(19, 9, 27),  -- Adhérent Jade monte Poney 9 le 23 janvier
(20, 10, 27), -- Adhérent Arthur monte Poney 10 le 23 janvier

-- Réservations pour les mercredis
(21, 11, 49),  -- Adhérent Nina monte Poney 11 le 10 janvier
(22, 12, 49),  -- Adhérent Leo monte Poney 12 le 10 janvier
(23, 13, 49),  -- Adhérent Lina monte Poney 13 le 10 janvier
(24, 14, 49),  -- Adhérent Ethan monte Poney 14 le 10 janvier
(26, 16, 49),  -- Adhérent Noah monte Poney 16 le 10 janvier
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
(38, 5, 125),  -- Adhérent Tom monte Poney 28 le 11 janvier

-- Réservations pour les vendredis
(41, 1, 149),  -- Adhérent Alice monte Poney 31 le 12 janvier
(43, 3, 149),  -- Adhérent Emma monte Poney 33 le 12 janvier
(45, 5, 149),  -- Adhérent Chloe monte Poney 35 le 12 janvier
(46, 6, 149),  -- Adhérent Louis monte Poney 36 le 12 janvier
(47, 7, 149),  -- Adhérent Léa monte Poney 37 le 12 janvier
(48, 8, 149);  -- Adhérent Tom monte Poney 38 le 12 janvier

INSERT INTO COTISATION (annee_debut, annee_fin) VALUES 
(2021, 2022),
(2022, 2023),
(2023, 2024),
(2024, 2025),
(2025, 2026);

-- Insertions de COTISER. Généré par IA (Copilot de Bing) car tâche répétitive.
INSERT INTO COTISER (id_a, annee_debut, annee_fin, paye) VALUES
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