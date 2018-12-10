-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Table: SUPPRESSION des tables déjà existante!
-- Nous allons créer 8 tables
-------------------------------------------------------------
DROP TABLE Network;
DROP TABLE Company;
DROP TABLE Produces_cost;
DROP TABLE Shows;
DROP TABLE Theater;
DROP TABLE Ticket;
DROP TABLE Representation;
DROP TABLE Grants;
DROP TABLE Host;
DROP TABLE Customers;

------------------------------------------------------------
--       Création des tables de la bd theatrical
-- Dans un premier temps, nous avons utilisé du mysql et nous avons adaté notre code en PLsql
------------------------------------------------------------
-- Table: Network
------------------------------------------------------------
CREATE TABLE Network
(
    network_id number (10) primary key
);

-----------------------------------------------------------
-- Table: Company
-------------------------------------------------------------

CREATE TABLE Company
(
  -- On identifie la company par un numéro, on aurait pu l'identifier par une lettre "varchar"
    company_id  number(10) primary key ,
    network_id  number(10),
    productions Varchar (50),
    budget      number (10),
    room        Varchar (50),
    foreign key(network_id) references Network(network_id)
);

-------------------------------------------------------------
-- Table: Shows
-------------------------------------------------------------
CREATE TABLE Shows
(
    show_id number(10) primary key
);

-------------------------------------------------------------
-- Table: Produces_cost
-------------------------------------------------------------

CREATE TABLE Produces_cost
(
    company_id      number (10),
    show_id         number (10),
    production_cost number (10),
    foreign key(company_id) REFERENCES Company(company_id),
    foreign key(show_id) references Shows(show_id)
);

------------------------------------------------------------
-- Table: Theater
-------------------------------------------------------------

CREATE TABLE Theater
(
  -- On aurait pu identifier nos théatres avec des lettres mais pour etre plus simple on utilise des chiffres
    Theater_id       number (10) primary key ,
    company_id       number (10),
    fixed_capacity   number (10),
    performence_hall Varchar (10),
    balance          number (10),
    foreign key (company_id) references Company(company_id)
);


-------------------------------------------------------------
-- Table: Ticket
-------------------------------------------------------------

CREATE TABLE Ticket
(
    ticket_id              number(10) primary key,
    theater_id             number(10),
    show_id                number(10),
    reduced_reference_rate number(10),
    price                  number(10),
    foreign key (customer_id) references Customers(customer_id)

);


-------------------------------------------------------------
-- Table: Representation possède un cout / donc
-- Ce serait égale à la facture total de la representation
-------------------------------------------------------------

CREATE TABLE Representation
(
    theater_id          number(10),
    ticket_id           number(10),
    show_id             number(10),
    representation_cost number(10),
    dates               number(10),
    travel__cost        number(10),
    dates               number(10),
    --- les représentations sont liés à différents élements
    foreign key (ticket_id) references Ticket(ticket_id),
    foreign key (show_id) references Shows(show_id),
    foreign key (theater_id) references Theater(theater_id),
    foreign key (dates) references Dates(dates)
);


-------------------------------------------------------------
-- Table: Grants
-------------------------------------------------------------

CREATE TABLE Grants
(
    grant_id   number(10) primary key ,
    theater_id number(10),
    agency     number(10),
    amount     number(10),
    duration   number(10),
    foreign key(theater_id) references Theater(theater_id)
);


-------------------------------------------------------------
-- Table: Host
-------------------------------------------------------------

CREATE TABLE Host
(
    theater_id   number (10),
    show_id      number (10),
    global_price number (10),
        -- comme donnée dans l'énoncé on définis la date comme un "int"
    dates        number(10),
        -- on défini nos clés étrangères en relation avec nos théatres et nos shows
    foreign key (theater_id) references Theater(theater_id),
    foreign key (show_id) references Shows(show_id)
);
-------------------------------------------------------------
-- Table: Dates of show
-------------------------------------------------------------

CREATE TABLE Dates
(
    dates number(10) primary key
);

-------------------------------------------------------------
-- Table: Dates of customers, Le customer possède un identifiant, un nom, un age, un numéro.
-------------------------------------------------------------

create table Customers
(
  customer_id    number(10) primary key,
  customer_name  varchar(100),
  customer_age   number(10),
  customer_phone number(20)
);

-------------------------------------------------------------
-- Création de nos tables finis, maintenant il faut crée des inserts afin de les exploiter.
-------------------------------------------------------------
