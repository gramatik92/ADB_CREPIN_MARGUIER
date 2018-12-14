-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
--- Dans ce script sql nous allons créer des queries
-------------------------------------------------------------
-- Network table
SELECT * from Networkss;

-- Company table
SELECT * from Company;

-- Produces_cost table
SELECT * from Produces_cost;

-- Shows table
SELECT * from Shows;

-- Theater table
SELECT * from Theater;

-- Ticket table
SELECT * from Ticket;

--- Representation table
SELECT * from Representation;

--- Grants table
SELECT * from Grants;

--- Host table
SELECT * from Hosts;

--- Customers table
SELECT * from Customers;

-- Attributes of company table --
DESC Network;

-- Select les donnateurs qui donne 100000 aux theatres.
SELECT *
FROM Grants g
WHERE g.amount>=100000;

-- Selectionner tous les hall qui ont comme nom : delta hall;
SELECT performance_hall
FROM Theater
WHERE performance_hall = 'Delta Hall';

-- Toutes nos requêtes fonctionnes.
