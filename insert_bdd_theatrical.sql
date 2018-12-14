-----------------------------------------------------------
--        Script - Advanced Database
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
INSERT INTO Networkss (network_id) VALUES (19);
INSERT INTO Networkss (network_id) VALUES (21);
INSERT INTO Networkss (network_id) VALUES (12);
INSERT INTO Networkss (network_id) VALUES (62);

-------------------------------------------------------------
-- Insertion de d'une company qui appartient à un network avec la salle, la production et le budjet
-------------------------------------------------------------
INSERT INTO Company (company_id, network_id, productions, budget, room) VALUES (1,19,'Century', 31100,'Amphitheater A');
INSERT INTO Company (company_id, network_id, productions, budget, room) VALUES (2,19,'Century', 30100,'Amphitheater B');
INSERT INTO Company (company_id, network_id, productions, budget, room) VALUES (3,21,'Paramoun', 12100,'Amphitheater C');
INSERT INTO Company (company_id, network_id, productions, budget, room) VALUES (4,21,'Paramoun', 11200, 'Amphitheater D');
-------------------------------------------------------------
-- Insertion de numéros de show, on aurait également pu identifier nos shows à partir des noms de spectacles
-- Pour gagner du temps nous utilisons des chiffres
-------------------------------------------------------------

INSERT INTO Shows (show_id) VALUES (21);
INSERT INTO Shows (show_id) VALUES (23);
INSERT INTO Shows (show_id) VALUES (29);
INSERT INTO Shows (show_id) VALUES (19);
-------------------------------------------------------------
-- Nous ajoutons nos production Cost
-------------------------------------------------------------

INSERT INTO Produces_cost (company_id, show_id, production_cost) VALUES (1,21,300);
INSERT INTO Produces_cost (company_id, show_id, production_cost) VALUES (2,23,188);
INSERT INTO Produces_cost (company_id, show_id, production_cost) VALUES (3,21,122);
INSERT INTO Produces_cost (company_id, show_id, production_cost) VALUES (4,23,122);

-------------------------------------------------------------
-- Ajouts de dates dans notre base données, nous aurions pu mettre également des vraies dates
-------------------------------------------------------------
INSERT INTO Dates_dates(dates) VALUES (1);
INSERT INTO Dates_dates(dates) VALUES (2);
INSERT INTO Dates_dates(dates) VALUES (3);
INSERT INTO Dates_dates(dates) VALUES (4);

-------------------------------------------------------------
-- Ajouts de donnnées dans notre théatre, ces caractéristiques et quelle company va l'utiliser
-- Pour faire simple nous utilisons des numéros allant de 1 à 4 pour nos theatres ID
-------------------------------------------------------------
INSERT INTO Theater (theater_id,company_id,performence_hall,fixed_capacity,balance) VALUES (1,19,'Alpha Hall',1000,100);
INSERT INTO Theater (theater_id,company_id,performence_hall,fixed_capacity,balance) VALUES (2,21,'Beta Hall',1500,100);
INSERT INTO Theater (theater_id,company_id,performence_hall,fixed_capacity,balance) VALUES (3,19,'Gamma Hall',590,100);
INSERT INTO Theater (theater_id,company_id,performence_hall,fixed_capacity,balance) VALUES (4,21,'Delta Hall',1200,100);

-------------------------------------------------------------
-- Ajouts de nos hosts par rapport à nos theatre, show prix et dates
-------------------------------------------------------------
INSERT INTO Hosts (host_id, theater_id, show_id, global_price, dates) VALUES (1,1,21,150,1);
INSERT INTO Hosts (host_id, theater_id, show_id, global_price, dates) VALUES (2,2,23,155,2);
INSERT INTO Hosts (host_id, theater_id, show_id, global_price, dates) VALUES (3,3,21,100,3);
INSERT INTO Hosts (host_id, theater_id, show_id, global_price, dates) VALUES (4,3,23,180,4);

--------------------------------------------------------------
-- Par la suite nous allons aborder la table des customers(clients)
--------------------------------------------------------------

INSERT INTO Customers (customers_id, customers_name, customers_age, customers_phone, customers_status) VALUES (1,'Jean',21,000101010,'student');
INSERT INTO Customers (customers_id, customers_name, customers_age, customers_phone, customers_status) VALUES (2,'James',22,000101010,'student');
INSERT INTO Customers (customers_id, customers_name, customers_age, customers_phone, customers_status) VALUES (3,'Camille',20,000101010,'student');
INSERT INTO Customers (customers_id, customers_name, customers_age, customers_phone, customers_status) VALUES (4,'Nicole',12,000101010,'student');

--------------------------------------------------------------
---- Nous allons créer un ticket en fonction du theatre, le show, le type de référence (avantage ... ) et le prix final.
--------------------------------------------------------------

INSERT INTO Ticket (ticket_id, theater_id, customers_id, show_id, reduced_reference_rate, price) VALUES (1,1,1,21,'student',110);
INSERT INTO Ticket (ticket_id, theater_id, customers_id, show_id, reduced_reference_rate, price) VALUES (2,2,2,23,'student',100);
INSERT INTO Ticket (ticket_id, theater_id, customers_id, show_id, reduced_reference_rate, price) VALUES (3,3,3,21,'student',90);

--------------------------------------------------------------
--- Grant management
--- An important part of the budget comes from grants accorded to theaters. The subsidies are granted by agencies
-- Nous avons des dons de différentes entreprises, Municipality, private donors
-- Pour la duration nous allons mettre 50 qui correspondrait à 50 représentations
--------------------------------------------------------------

INSERT INTO Grants (grant_id, theater_id, agency, amount, durations) VALUES (1,19,'Municipality',100000,20);
INSERT INTO Grants (grant_id, theater_id, agency, amount, durations) VALUES (2,21,'Ministry of Culture',200000,20);
INSERT INTO Grants (grant_id, theater_id, agency, amount, durations) VALUES (3,19,'private donors',15000,20);
INSERT INTO Grants (grant_id, theater_id, agency, amount, durations) VALUES (4,21,'Entreprises',23000,20);

--------------------------------------------------------------
-- Par la suite nous allons aborder la table des représentations
--------------------------------------------------------------

INSERT INTO Representation (representation_id, theater_id, ticket_id, show_id, representation_cost, travel_cost, dates) VALUES (1,1,1,21,150,100, 1);
INSERT INTO Representation (representation_id, theater_id, ticket_id, show_id, representation_cost, travel_cost, dates) VALUES (2,2,2,23,150,100, 2);
INSERT INTO Representation (representation_id, theater_id, ticket_id, show_id, representation_cost, travel_cost, dates) VALUES (3,3,3,23,150,100, 3);

--------------------------------------------------------------
-- Tables des sieges en fonction des tickets.
--------------------------------------------------------------
INSERT INTO Performance_seat (performance_seat_id, theater_id, row_numbers, seat_number, dates, ticket_id) VALUES (1,1,12,1,1,1);
INSERT INTO Performance_seat (performance_seat_id, theater_id, row_numbers, seat_number, dates, ticket_id) VALUES (2,2,13,2,1,1);
INSERT INTO Performance_seat (performance_seat_id, theater_id, row_numbers, seat_number, dates, ticket_id) VALUES (3,3,12,3,1,1);
-------------------------------------------------------------
--  Après avoir remplie nos tables, nous allons ajouter les contraintes grâce aux triggers
-------------------------------------------------------------
