-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Table: SUPPRESSION des tables déjà existante!
-- Nous allons créer 10 tables
-------------------------------------------------------------
DROP TABLE Networks;
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

------------------------------------------------------------
--       Création des tables de la bd theatrical
-- Dans un premier temps, nous avons utilisé du mysql et nous avons adaté notre code en PLsql
------------------------------------------------------------
-- Table: Network
------------------------------------------------------------
CREATE TABLE Networks
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
    productions varchar2 (50),
    budget      number (10),
    room        varchar2 (50),
    foreign key(network_id) references Networks(network_id)
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
  -- On aurait pu identifier nos théatres avec des lettres mais pour etre plus simple on utilise des chiffres

CREATE TABLE Theater
(
    theater_id       number (10) primary key ,
    company_id       number (10),
    fixed_capacity   number (10),
    performence_hall varchar (10),
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
    customer_id            number(10),
    show_id                number(10),
    reduced_reference_rate number(10),
    price                  number(10),
    foreign key (theater_id) references Theater(theater_id),
    foreign key (customer_id) references Customers(customer_id),
    foreign key (show_id) references Shows(show_id)
);


-------------------------------------------------------------
-- Table: Representation possède un cout de déplacement
-- Ce serait égale total de la representation en fonction du théatre , des dates...
-------------------------------------------------------------

CREATE TABLE Representation
(
    theater_id          number(10),
    ticket_id           number(10),
    show_id             number(10),
    representation_cost number(10),
    dates               number(10),
    travel_cost        number(10),
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
    grant_id   number(10) primary key,
    theater_id number(10),
    agency     number(10),
    amount     number(10),
    duration   number(10),
    foreign key(theater_id) references Theater(theater_id)
);


-------------------------------------------------------------
-- Table: Host
-------------------------------------------------------------

CREATE TABLE Hosts
(
    theater_id   number (10),
    show_id      number (10),
    global_price number (10),
        -- comme donnée dans l'énoncé on définis la date comme un "int"
    dates        number(10),
        -- on défini nos clés étrangères en relation avec nos théatres et nos shows
    foreign key (theater_id) references Theater(theater_id),
    foreign key (show_id) references Shows(show_id),
    foreign key (dates) references Dates(dates)
);
-------------------------------------------------------------
-- Table: Dates of show
-------------------------------------------------------------

CREATE TABLE Dates
(
    dates number(10) primary key
);

-------------------------------------------------------------
-- Table: customers, Le customer possède un identifiant, un nom, un age, un numéro.
-------------------------------------------------------------

create table Customers
(
  customer_id    number(10) primary key,
  customer_name  varchar2(10),
  customer_age   number(10),
  customer_phone number(20),
  custome_status varchar2(10)
);

-------------------------------------------------------------
-- Table: All performance seats, table supplémentaire
-------------------------------------------------------------
create table Performance_seat
(
  Performance_seat number(10) primary key,
  theater_id       number(10),
  row_number       number(10),
  seat_number      number(10),
  dates            number(10),
  ticket_id        number(10),
  foreign key (dates) references Dates(dates),
  foreign key (ticket_id) references Ticket(ticket_id),
  foreign key (theater_id) references Theater(theater_id)
);

-------------------------------------------------------------
-- Création de nos tables finis, maintenant il faut crée des inserts afin de les exploiter.
-------------------------------------------------------------
