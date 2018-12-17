-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-- fichier : create_bdd_theatrical.sql
-------------------------------------------------------------

-------------------------------------------------------------
-- Table: SUPPRESSION des tables déjà existante!
-- Nous allons créer 11 tables
-------------------------------------------------------------
DROP TABLE Networkss;
DROP TABLE Company;
DROP TABLE Produces_cost;
DROP TABLE Shows;
DROP TABLE Theater;
DROP TABLE Ticket;
DROP TABLE Representation;
DROP TABLE Grants;
DROP TABLE Hosts;
DROP TABLE Customers;
DROP TABLE Performance_seat;
DROP TABLE Dates_dates;

------------------------------------------------------------
--       Création des tables de la bdd theatrical
-- Dans un premier temps, nous avons utilisé du mysql et nous avons adapter notre code en PL/sql
------------------------------------------------------------
-- Table: Networkss
------------------------------------------------------------
CREATE TABLE Networkss
(
    network_id NUMBER(10) primary key
);

-----------------------------------------------------------
-- Table: Company
-------------------------------------------------------------

CREATE TABLE Company
(
  -- On identifie la company par un numéro, on aurait pu l'identifier par une lettre "varchar"
    company_id  NUMBER(10) primary key,
    network_id  NUMBER(10),
    productions VARCHAR(10),
    --- nom de la production
    budget      NUMBER(10),
    room        VARCHAR(20),
    foreign key(network_id) references Networkss(network_id)
);

-------------------------------------------------------------
-- Table: Shows
-- numéro du show
-------------------------------------------------------------
CREATE TABLE Shows
(
    show_id NUMBER(10) primary key
);

-------------------------------------------------------------
-- Table: Produces_cost
-------------------------------------------------------------

CREATE TABLE Produces_cost
(
    company_id      NUMBER (10),
    show_id         NUMBER (10),
    production_cost NUMBER (10),
    foreign key(company_id) REFERENCES Company(company_id),
    foreign key(show_id) references Shows(show_id)
);

------------------------------------------------------------
-- Table: Theater
-------------------------------------------------------------
  -- On aurait pu identifier nos théatres avec des lettres mais pour etre plus simple on utilise des chiffres
CREATE TABLE Theater
(
    theater_id       NUMBER (10) primary key,
    company_id       NUMBER (10),
    performence_hall VARCHAR (30),
    fixed_capacity   NUMBER (20),
    balance          NUMBER (20),
    foreign key (company_id) references Company(company_id)
);

-------------------------------------------------------------
-- Table: customers, Le customer possède un identifiant, un nom, un age, un numéro.
-------------------------------------------------------------
CREATE TABLE Customers
(
  customers_id    NUMBER(10) primary key,
  customers_name  VARCHAR2(20),
  customers_age   NUMBER(10),
  customers_phone NUMBER(20),
  customers_status VARCHAR2(20)
);

-------------------------------------------------------------
-- Table: Ticket
-------------------------------------------------------------
-- un ticket regroupe plusieurs informations
CREATE TABLE Ticket
(
    ticket_id              NUMBER(10) primary key,
    theater_id             NUMBER(10),
    customers_id            NUMBER(10),
    show_id                NUMBER(10),
    reduced_reference_rate VARCHAR(10),
    price                  NUMBER(10),
    foreign key (theater_id) references Theater(theater_id),
    foreign key (customers_id) references Customers(customers_id),
    foreign key (show_id) references Shows(show_id)
);

-------------------------------------------------------------
-- Table: Dates of show
-------------------------------------------------------------

CREATE TABLE Dates_dates
(
    dates NUMBER(10) primary key
);

-------------------------------------------------------------
-- Table: Representation possède un cout de déplacement
-- Ce serait égale total de la representation en fonction du théatre , des dates...
-------------------------------------------------------------

CREATE TABLE Representation
(
    representation_id   NUMBER(10) primary key,
    theater_id          NUMBER(10),
    ticket_id           NUMBER(10),
    show_id             NUMBER(10),
    representation_cost NUMBER(10),
    travel_cost        NUMBER(10),
    dates               NUMBER(10),
    --- les représentations sont liés à différents élements
    foreign key (ticket_id) references Ticket(ticket_id),
    foreign key (show_id) references Shows(show_id),
    foreign key (theater_id) references Theater(theater_id),
    foreign key (dates) references Dates_dates(dates)
);


-------------------------------------------------------------
-- Table: Grants
-------------------------------------------------------------

CREATE TABLE Grants
(
    grant_id   NUMBER(10) primary key,
    theater_id NUMBER(10),
    agency     VARCHAR(30),
    amount     NUMBER(10),
    durations   NUMBER(10),
    foreign key(theater_id) references Theater(theater_id)
);


-------------------------------------------------------------
-- Table: Host
-------------------------------------------------------------
CREATE TABLE Hosts
(
    host_id NUMBER(10) primary key,
    theater_id   NUMBER(10),
    show_id      NUMBER(10),
    global_price NUMBER(10),
        -- comme donnée dans l'énoncé on définis la date comme un "int"
    dates        NUMBER(10),
        -- on défini nos clés étrangères en relation avec nos théatres et nos shows
    foreign key (theater_id) references Theater(theater_id),
    foreign key (show_id) references Shows(show_id),
    foreign key (dates) references Dates_dates(dates)
);

-------------------------------------------------------------
-- Table: All performance seats, table supplémentaire
-------------------------------------------------------------
CREATE TABLE Performance_seat
(
  Performance_seat_id NUMBER(10) primary key,
  theater_id       NUMBER(10),
  row_numbers       NUMBER(10),
  seat_number      NUMBER(10),
  dates            NUMBER(10),
  ticket_id        NUMBER(10),
  foreign key (dates) references Dates_dates(dates),
  foreign key (ticket_id) references Ticket(ticket_id),
  foreign key (theater_id) references Theater(theater_id)
);

-------------------------------------------------------------
-- Création de nos tables finis, maintenant il faut crée des inserts afin de les exploiter.
-------------------------------------------------------------
