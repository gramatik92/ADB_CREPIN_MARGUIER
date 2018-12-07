-----------------------------------------------------------
--        Script MySQL - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Insertion de valeurs dans nos tables
-- Créations de données
-------------------------------------------------------------

-------------------------------------------------------------
-- Ajout d'un network
-------------------------------------------------------------
INSERT INTO Network (Network_id) values (19);

-------------------------------------------------------------
-- Insertion de d'une company qui appartient à un network avec la salle, la production et le budjet
-------------------------------------------------------------
INSERT INTO Company (company_id,network_id,room,productions,budget) values (1,19,'Amphitheater A', 'Century', 301100);
INSERT INTO Company (company_id,network_id,room,productions,budget) values (2,19,'Amphitheater B', 'Century', 301100);
INSERT INTO Company (company_id,network_id,room,productions,budget) values (3,19,'Amphitheater C', 'Century', 301100);

-------------------------------------------------------------
-- Insertion de d'une company qui appartient à un network avec la salle, la production et le budjet
-------------------------------------------------------------

insert into Shows (show_id) values (21);
insert into Shows (show_id) values (23);
insert into Shows (show_id) values (29);
-------------------------------------------------------------
-- Insertion de d'une company qui appartient à un network avec la salle, la production et le budjet
-------------------------------------------------------------

INSERT INTO Produces_cost (company_id, show_id, production_cost) values (1,21,300);
INSERT INTO Produces_cost (company_id, show_id, production_cost) values (2,23,188);
INSERT INTO Produces_cost (company_id, show_id, production_cost) values (3,39,122);
