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
)ENGINE=InnoDB;

-------------------------------------------------------------
-- Table: Shows
-------------------------------------------------------------
CREATE TABLE Shows (
    show_id number(10) primary key
)ENGINE=InnoDB;

-------------------------------------------------------------
-- Table: Produces_cost
-------------------------------------------------------------

CREATE TABLE Produces_cost(
        company_id      number (10),
        show_id         number (10),
        production_cost number (10)
        foreign key(company_id) REFERENCES Company(company_id),
        foreign key(show_id) references Shows(show_id)
)ENGINE=InnoDB;

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
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ticket
#------------------------------------------------------------

CREATE TABLE Ticket(
        ticket_id              Int Auto_increment  NOT NULL primary key,
        theater_id             Int(10) NOT NULL ,
        show_id                Int(10) NOT NULL ,
        reduced_reference_rate Varchar (50) NOT NULL ,
        price                  Int NOT NULL
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Representation
#------------------------------------------------------------

CREATE TABLE Representation(
        theater_id          Int(10) NOT NULL ,
        ticket_id           Int(10) NOT NULL ,
        show_id             Int(10) NOT NULL ,
        representation_cost Int(10) NOT NULL ,
        travel__cost        Int(10) NOT NULL ,
        dates               DATE NOT NULL
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Grants
#------------------------------------------------------------

CREATE TABLE Grants(
        grant_id   Int  Auto_increment  NOT NULL primary key ,
        theater_id Int(10) NOT NULL ,
        agency     Int(10) NOT NULL ,
        duration   Int(10) NOT NULL ,
        amount     Int(10) NOT NULL
)ENGINE=InnoDB;


-------------------------------------------------------------
-- Table: Host
-------------------------------------------------------------

CREATE TABLE Host(
        theater_id   number (10),
        show_id      number (10),
        global_price number (10),
        dates        Date,
        foreign key (theater_id) references Theater(theater_id),
        foreign key (show_id) references Shows(show_id)
)ENGINE=InnoDB;
-------------------------------------------------------------
-- Table: Dates of show
-------------------------------------------------------------

create table Dates
(
    dates number(7) primary key
)ENGINE=InnoDB;
