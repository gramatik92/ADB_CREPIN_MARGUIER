-----------------------------------------------------------
--        Script MySQL - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Insertion de valeurs dans nos tables
-- Créations de données
-- Nous avons choisi volontairement d'ajouter 4 inserts afin d'avoir une plus grande base de donnée à exploiter
-------------------------------------------------------------

-------------------------------------------------------------
-- Création de networks
-------------------------------------------------------------
INSERT INTO Network (Network_id) values (19);
INSERT INTO Network (Network_id) values (21);
INSERT INTO Network (Network_id) values (12);
INSERT INTO Network (Network_id) values (62);

-------------------------------------------------------------
-- Insertion de d'une company qui appartient à un network avec la salle, la production et le budjet
-------------------------------------------------------------
INSERT INTO Company (company_id,network_id,room,productions,budget) values (1,19,'Amphitheater A', 'Century', 301100);
INSERT INTO Company (company_id,network_id,room,productions,budget) values (2,19,'Amphitheater B', 'Century', 301100);
INSERT INTO Company (company_id,network_id,room,productions,budget) values (3,21,'Amphitheater C', 'Century', 301100);
INSERT INTO Company (company_id,network_id,room,productions,budget) values (4,21,'Amphitheater D', 'Paramoun', 301200);

-------------------------------------------------------------
-- Insertion de numéros de show, on aurait également pu identifier nos shows à partir des noms de spectacles
-- Pour gagner du temps nous utilisons des chiffres
-------------------------------------------------------------

INSERT INTO Shows (show_id) values (21);
INSERT INTO Shows (show_id) values (23);
INSERT INTO Shows (show_id) values (29);
INSERT INTO Shows (show_id) values (19);
-------------------------------------------------------------
-- Nous ajoutons nos production Cost
-------------------------------------------------------------

INSERT INTO Produces_cost (company_id, show_id, production_cost) values (1,21,300);
INSERT INTO Produces_cost (company_id, show_id, production_cost) values (2,23,188);
INSERT INTO Produces_cost (company_id, show_id, production_cost) values (3,21,122);
INSERT INTO Produces_cost (company_id, show_id, production_cost) values (4,23,122);

-------------------------------------------------------------
-- Ajouts de dates dans notre base données, nous aurions pu mettre également des vraies dates
-------------------------------------------------------------
INSERT INTO Dates (dates) values (1);
INSERT INTO Dates (dates) values (2);
INSERT INTO Dates (dates) values (3);
INSERT INTO Dates (dates) values (4);

-------------------------------------------------------------
-- Ajouts de donnnées dans notre théatre, ces caractéristiques et quelle company va l'utiliser
-- Pour faire simple nous utilisons des numéros allant de 1 à 4 pour nos theatres ID
-------------------------------------------------------------
INSERT INTO Theater (theater_id,company_id,performance_hall,fixed_capacity,balance) values (1,19,'Alpha Hall',1000,100);
INSERT INTO Theater (theater_id,company_id,performance_hall,fixed_capacity,balance) values (2,21,'Beta Hall',1500,100);
INSERT INTO Theater (theater_id,company_id,performance_hall,fixed_capacity,balance) values (3,19,'Gamma Hall',590,100);
INSERT INTO Theater (theater_id,company_id,performance_hall,fixed_capacity,balance) values (4,21,'Delta Hall',1200,100);

-------------------------------------------------------------
-- Ajouts de nos hosts par rapport à nos theatre, show prix et dates
-------------------------------------------------------------
INSERT INTO Hosts (theater_id, show_id, global_price, dates) values (1,21,150,1);
INSERT INTO Hosts (theater_id, show_id, global_price, dates) values (2,23,155,2);
INSERT INTO Hosts (theater_id, show_id, global_price, dates) values (3,21,100,3);
INSERT INTO Hosts (theater_id, show_id, global_price, dates) values (3,23,180,4);

--------------------------------------------------------------
---- Nous allons créer un ticket en fonction du theatre, le show, le type de référence (avantage ... ) et le prix final.
--------------------------------------------------------------

INSERT INTO Ticket (ticket_id, theater_id, show_id, reference_rate, price) values (1,1,21,'firstref',110);
INSERT INTO Ticket (ticket_id, theater_id, show_id, reference_rate, price) values (2,2,23,'secondref',100);
INSERT INTO Ticket (ticket_id, theater_id, show_id, reference_rate, price) values (3,3,21,'thirdref',90);

  PROMPT
  pause Tapez sur Enter...
  PROMPT

  insert into Represented (theater_id, ticket_id, show_id, representation_costs, travel_costs, dates) values (1,1,1,100,100, 5);
  insert into Represented (theater_id, ticket_id, show_id, representation_costs, travel_costs, dates) values (2,2,2,100,100, 5);
  insert into Represented (theater_id, ticket_id, show_id, representation_costs, travel_costs, dates) values (3,3,3,100,100, 5);

  PROMPT
  pause Tapez sur Enter...
  PROMPT

  insert into Grants (grant_id, theater_id, durations, agency, amount) values (1,1,60,'toto',100);
  insert into Grants (grant_id, theater_id, durations, agency, amount) values (2,2,60,'tota',100);
  insert into Grants (grant_id, theater_id, durations, agency, amount) values (3,3,60,'totz',100);


-------------------------------------------------------------
--  Après avoir remplie nos tables, nous allons ajouter les contraintes grâce aux triggers
-------------------------------------------------------------
