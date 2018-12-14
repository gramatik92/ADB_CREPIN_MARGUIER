-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Table: SUPPRESSION des tables déjà existante!
-- Nous allons créer 10 tables
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
--       Création des tables de la bd theatrical
-- Dans un premier temps, nous avons utilisé du mysql et nous avons adaté notre code en PLsql
------------------------------------------------------------
-- Table: Network
------------------------------------------------------------
CREATE TABLE Networkss
(
    network_id number(10) primary key
);

-----------------------------------------------------------
-- Table: Company
-------------------------------------------------------------

CREATE TABLE Company
(
  -- On identifie la company par un numéro, on aurait pu l'identifier par une lettre "varchar"
    company_id  number(10) primary key,
    network_id  number(10),
    productions varchar(10),
    budget      number(10),
    room        varchar(20),
    foreign key(network_id) references Networkss(network_id)
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
    performence_hall varchar (20),
    fixed_capacity   number (10),
    balance          number (10),
    foreign key (company_id) references Company(company_id)
);

-------------------------------------------------------------
-- Table: customers, Le customer possède un identifiant, un nom, un age, un numéro.
-------------------------------------------------------------
 CREATE TABLE Customers
(
  customers_id    number(10) primary key,
  customers_name  varchar(20),
  customers_age   number(10),
  customers_phone number(20),
  customers_status varchar(20)
);

-------------------------------------------------------------
-- Table: Ticket
-------------------------------------------------------------

CREATE TABLE Ticket
(
    ticket_id              number(10) primary key,
    theater_id             number(10),
    customers_id            number(10),
    show_id                number(10),
    reduced_reference_rate number(10),
    price                  number(10),
    foreign key (theater_id) references Theater(theater_id),
    foreign key (customers_id) references Customers(customers_id),
    foreign key (show_id) references Shows(show_id)
    foreign key (seat_number) references Performance_seat(seat_number-
);

-------------------------------------------------------------
-- Table: Dates of show
-------------------------------------------------------------

CREATE TABLE Dates_dates
(
    dates number(10) primary key
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
    travel_cost        number(10),
    dates               number(10),
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
    grant_id   number(10) primary key,
    theater_id number(10),
    agency     number(30),
    amount     number(10),
    duration   number(10),
    foreign key(theater_id) references Theater(theater_id)
);


-------------------------------------------------------------
-- Table: Host
-------------------------------------------------------------
CREATE TABLE Hosts
(
    host_id number(10),
    theater_id   number(10),
    show_id      number(10),
    global_price number(10),
        -- comme donnée dans l'énoncé on définis la date comme un "int"
    dates        number(10),
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
  Performance_seat_id number(10) primary key,
  theater_id       number(10),
  row_numbers       number(10),
  seat_number      number(10),
  dates            number(10),
  ticket_id        number(10),
  foreign key (dates) references Dates_dates(dates),
  foreign key (ticket_id) references Ticket(ticket_id),
  foreign key (theater_id) references Theater(theater_id)
);

-------------------------------------------------------------
-- Création de nos tables finis, maintenant il faut crée des inserts afin de les exploiter.
-------------------------------------------------------------
