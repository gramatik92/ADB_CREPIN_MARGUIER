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
DESC Networkss;

-- Selectionner les productions qui ont un budget supérieur à 10000€
Select Productions from COMPANY
Where budget > 10000;

-- Selectionner tous les hall qui ont comme nom : delta hall;
SELECT performence_hall
FROM Theater
WHERE performence_hall = 'Delta Hall';

-- Toutes nos requêtes fonctionnes.
