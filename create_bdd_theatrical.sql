#------------------------------------------------------------
#        Script MySQL - Advanced Database
#   Made by Paul William CREPIN and Timothée Marguier
#------------------------------------------------------------

#------------------------------------------------------------
# Table: SUPPRESSION des tables déjà existante!
#------------------------------------------------------------
DROP TABLE Network CASCADE CONSTRAINTS;
DROP TABLE Company CASCADE CONSTRAINTS;
DROP TABLE Produces_cost CASCADE CONSTRAINTS;
DROP TABLE Shows CASCADE CONSTRAINTS;
DROP TABLE Theater CASCADE CONSTRAINTS;
DROP TABLE Ticket CASCADE CONSTRAINTS;
DROP TABLE Representation CASCADE CONSTRAINTS;
DROP TABLE Grants CASCADE CONSTRAINTS;
DROP TABLE Host CASCADE CONSTRAINTS;

#------------------------------------------------------------
#       Création des tables de la bd theatrical 
#------------------------------------------------------------
# Table: Network
#------------------------------------------------------------

CREATE TABLE Network(
        network_id Int  Auto_increment  NOT NULL primary key
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Company
#------------------------------------------------------------

CREATE TABLE Company(
        company_id  Int  Auto_increment  NOT NULL primary key ,
        network_id  Int  Auto_increment  NOT NULL ,
        room        Varchar (50) NOT NULL ,
        productions Varchar (50) NOT NULL ,
        budget      Int (10) NOT NULL
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Produces_cost
#------------------------------------------------------------

CREATE TABLE Produces_cost(
        company_id      Int (10) NOT NULL ,
        show_id         Int (10) NOT NULL ,
        production_cost Int (10) NOT NULL
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Shows
#------------------------------------------------------------

CREATE TABLE Shows (
    show_id Int(10) primary key
);

PROMPT
pause Tapez sur Enter...
PROMPT

#------------------------------------------------------------
# Table: Theater
#------------------------------------------------------------

CREATE TABLE Theater(
        Theater_id       Int (10) Auto_increment  NOT NULL primary key ,
        company_id       Int (10) NOT NULL ,
        performence_hall Varchar (10) NOT NULL ,
        fixed_capacity   Int (10),
        balance          Int (10),
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


#------------------------------------------------------------
# Table: Host
#------------------------------------------------------------

CREATE TABLE Host(
        theater_id   Int(10) NOT NULL ,
        show_id      Int(10) NOT NULL ,
        global_price Int(10) NOT NULL ,
        dates        Date NOT NULL
)ENGINE=InnoDB;
