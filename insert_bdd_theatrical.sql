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
INSERT INTO networks (Network_id) values (19);
INSERT INTO Networks (Network_id) values (21);
INSERT INTO networks (Network_id) values (12);
INSERT INTO Networks (Network_id) values (62);

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
-- Par la suite nous allons aborder la table des customers(clients)
--------------------------------------------------------------

INSERT INTO Customers (customer_id, customer_name, customer_age, customer_phone, custome_status) values (1,"Jean",21,000101010,'student');
INSERT INTO Customers (customer_id, customer_name, customer_age, customer_phone, custome_status) values (2,"James",22,000101010,'student');
INSERT INTO Customers (customer_id, customer_name, customer_age, customer_phone, custome_status) values (3,"Camille",20,000101010,'student');
INSERT INTO Customers (customer_id, customer_name, customer_age, customer_phone, custome_status) values (4,"Nicole",12,000101010,'student');

--------------------------------------------------------------
---- Nous allons créer un ticket en fonction du theatre, le show, le type de référence (avantage ... ) et le prix final.
--------------------------------------------------------------

INSERT INTO Ticket (ticket_id, theater_id, show_id, reference_rate, price) values (1,1,21,'firstref',110);
INSERT INTO Ticket (ticket_id, theater_id, show_id, reference_rate, price) values (2,2,23,'secondref',100);
INSERT INTO Ticket (ticket_id, theater_id, show_id, reference_rate, price) values (3,3,21,'thirdref',90);

--------------------------------------------------------------
--- Grant management
--- An important part of the budget comes from grants accorded to theaters. The subsidies are granted by agencies
-- Nous avons des dons de différentes entreprises, Municipality, private donors
-- Pour la duration nous allons mettre 50 qui correspondrait à 50 représentations
--------------------------------------------------------------

INSERT INTO Grants (grant_id, theater_id, durations, agency, amount) values (1,19,50,'Municipality',100000);
INSERT INTO Grants (grant_id, theater_id, durations, agency, amount) values (2,21,50,'Ministry of Culture',200000);
INSERT INTO Grants (grant_id, theater_id, durations, agency, amount) values (3,19,50,'private donors',15000);
INSERT INTO Grants (grant_id, theater_id, durations, agency, amount) values (4,21,50,'Entreprises',23000);
--------------------------------------------------------------
-- Par la suite nous allons aborder la table des représentations
--------------------------------------------------------------

INSERT INTO  Representation (theater_id, ticket_id, show_id, representation_costs, travel_costs, dates) values (1,1,21,150,100, 1);
INSERT INTO  Representation (theater_id, ticket_id, show_id, representation_costs, travel_costs, dates) values (2,2,23,150,100, 2);
INSERT INTO  Representation (theater_id, ticket_id, show_id, representation_costs, travel_costs, dates) values (3,3,23,150,100, 3);

--------------------------------------------------------------
-- Tables des sieges en fonction des tickets.
--------------------------------------------------------------
INSERT INTO Performance_seat (theater_id, row_number, seat_number, dates, ticket_id) values (1,12,100,1,1);
INSERT INTO Performance_seat (theater_id, row_number, seat_number, dates, ticket_id) values (2,13,100,1,1);
INSERT INTO Performance_seat (theater_id, row_number, seat_number, dates, ticket_id) values (1,12,100,1,1);
-------------------------------------------------------------
--  Après avoir remplie nos tables, nous allons ajouter les contraintes grâce aux triggers
-------------------------------------------------------------
