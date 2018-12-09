-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
--- Dans ce script sql nous allons créer des queries
-------------------------------------------------------------
-- Network table
select * from Network;

-- Company table
select * from Company;

-- Produces_cost table
select * from Produces_cost;

-- Shows table
select * from Shows;

-- Theater table
select * from Theater;

-- Ticket table
select * from Ticket;

--- Representation table
select * from Representation;

--- Grants table
select * from Grants;

--- Host table
select * from Host;

--- Customers table
select * from Customers;

-- Attributes of company table --
asc Network;


-- Global price of the show with the id=3 hosted by the theater with the id=3 --
-- The payment is made to the company which produced the show the day of the first presentation in the corresponding theater. --
select *
from hosts h
where h.show_id=3 and h.theater_id=3;
