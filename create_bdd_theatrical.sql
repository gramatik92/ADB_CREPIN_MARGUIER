-----------------------------------------------------------
--        Script MySQL - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Table: SUPPRESSION des tables déjà existante!
-------------------------------------------------------------
DROP TABLE Network CASCADE CONSTRAINTS;
DROP TABLE Company CASCADE CONSTRAINTS;
DROP TABLE Produces_cost CASCADE CONSTRAINTS;
DROP TABLE Shows CASCADE CONSTRAINTS;
DROP TABLE Theater CASCADE CONSTRAINTS;
DROP TABLE Ticket CASCADE CONSTRAINTS;
DROP TABLE Representation CASCADE CONSTRAINTS;
DROP TABLE Grants CASCADE CONSTRAINTS;
DROP TABLE Host CASCADE CONSTRAINTS;

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

CREATE TABLE Company(
        company_id  number(10) primary key ,
        network_id  number(10),
        productions Varchar (50),
        room        Varchar (50),
        budget      number (10)
        foreign key(network_id) references Networks(network_id)
);

-------------------------------------------------------------
-- Table: Shows
-------------------------------------------------------------
CREATE TABLE Shows (
    show_id number(10) primary key
);

-------------------------------------------------------------
-- Table: Produces_cost
-------------------------------------------------------------

CREATE TABLE Produces_cost(
        company_id      number (10),
        show_id         number (10),
        production_cost number (10)
        foreign key(company_id) REFERENCES Company(company_id),
        foreign key(show_id) references Shows(show_id)
);

------------------------------------------------------------
-- Table: Theater
-------------------------------------------------------------

CREATE TABLE Theater(
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

CREATE TABLE Ticket(
        ticket_id              number(10) primary key,
        theater_id             number(10),
        show_id                number(10),
        reduced_reference_rate number(10),
        price                  number(10)
);


-------------------------------------------------------------
-- Table: Representation
-------------------------------------------------------------

CREATE TABLE Representation(
        theater_id          number(10),
        ticket_id           number(10),
        show_id             number(10),
        representation_cost number(10),
        travel__cost        number(10),
        dates               number(10)
);


-------------------------------------------------------------
-- Table: Grants
-------------------------------------------------------------

CREATE TABLE Grants(
        grant_id   number(10) primary key ,
        theater_id number(10),
        agency     number(10),
        duration   number(10),
        amount     number(10),
);


-------------------------------------------------------------
-- Table: Host
-------------------------------------------------------------

CREATE TABLE Host(
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

create table Dates
(
    dates number(10) primary key
);
