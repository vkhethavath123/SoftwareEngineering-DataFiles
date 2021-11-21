-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-19 19:00:13.927

-- tables
-- Table: Attack_type
CREATE TABLE Attack_type (
    Attack_tyepeid int NOT NULL,
    Attack_type varchar(100) NOT NULL,
    CONSTRAINT Attack_type_pk PRIMARY KEY (Attack_tyepeid)
);

-- Table: Country
CREATE TABLE Country (
    Country_ID int NOT NULL,
    Country_Name varchar(100) NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (Country_ID)
);

-- Table: Event_detail
CREATE TABLE Event_detail (
    Event_ID int NOT NULL,
    Day int NOT NULL,
    Month int NOT NULL,
    Year int NOT NULL,
    Longitude float(5,2) NOT NULL,
    Latitude float(5,2) NOT NULL,
    Motive varchar(100) NOT NULL,
    number_of_victims int NOT NULL,
    number_of_terrorists  int NOT NULL,
    Attack_tyepeid int NOT NULL,
    CONSTRAINT Event_detail_pk PRIMARY KEY (Event_ID)
);

-- Table: Event_weapon_detail
CREATE TABLE Event_weapon_detail (
    Event_ID  int NOT NULL,
    Weapon_type_ID int NOT NULL,
    CONSTRAINT Event_weapon_detail_pk PRIMARY KEY (Event_ID ,Weapon_type_ID)
);

-- Table: Region
CREATE TABLE Region (
    Region_ID int NOT NULL,
    Region_Name varchar(100) NOT NULL,
    Country_ID int NOT NULL,
    CONSTRAINT Region_pk PRIMARY KEY (Region_ID)
);

-- Table: Target_subtype
CREATE TABLE Target_subtype (
    Target_subtype_id int NOT NULL,
    target_subtype varchar(100) NOT NULL,
    Target_type_id int NOT NULL,
    CONSTRAINT Target_subtype_pk PRIMARY KEY (Target_subtype_id)
);

-- Table: Target_type
CREATE TABLE Target_type (
    Target_type_id int NOT NULL,
    target_type varchar(100) NOT NULL,
    CONSTRAINT Target_type_pk PRIMARY KEY (Target_type_id)
);

-- Table: Weapon_Type
CREATE TABLE Weapon_Type (
    Weapon_type_ID int NOT NULL,
    Weapon_type varchar(100) NOT NULL,
    Weapon_detail varchar(200) NOT NULL,
    CONSTRAINT Weapon_Type_pk PRIMARY KEY (Weapon_type_ID)
);

-- Table: Weapon_subtype
CREATE TABLE Weapon_subtype (
    Weapon_subtype_id int NOT NULL,
    weapon_subtype varchar(100) NOT NULL,
    Weapon_type_ID int NOT NULL,
    CONSTRAINT Weapon_subtype_pk PRIMARY KEY (Weapon_subtype_id)
);

-- foreign keys
-- Reference: Event_detail_Attack_type (table: Event_detail)
ALTER TABLE Event_detail ADD CONSTRAINT Event_detail_Attack_type FOREIGN KEY Event_detail_Attack_type (Attack_tyepeid)
    REFERENCES Attack_type (Attack_tyepeid);

-- Reference: Event_weapon_detail_Event_detail (table: Event_weapon_detail)
ALTER TABLE Event_weapon_detail ADD CONSTRAINT Event_weapon_detail_Event_detail FOREIGN KEY Event_weapon_detail_Event_detail (Event_ID )
    REFERENCES Event_detail (Event_ID);

-- Reference: Event_weapon_detail_Weapon_Type (table: Event_weapon_detail)
ALTER TABLE Event_weapon_detail ADD CONSTRAINT Event_weapon_detail_Weapon_Type FOREIGN KEY Event_weapon_detail_Weapon_Type (Weapon_type_ID)
    REFERENCES Weapon_Type (Weapon_type_ID);

-- Reference: Region_Country (table: Region)
ALTER TABLE Region ADD CONSTRAINT Region_Country FOREIGN KEY Region_Country (Country_ID)
    REFERENCES Country (Country_ID);

-- Reference: Target_subtype_Target_type (table: Target_subtype)
ALTER TABLE Target_subtype ADD CONSTRAINT Target_subtype_Target_type FOREIGN KEY Target_subtype_Target_type (Target_type_id)
    REFERENCES Target_type (Target_type_id);

-- Reference: Weapon_Type_ID (table: Weapon_subtype)
ALTER TABLE Weapon_subtype ADD CONSTRAINT Weapon_Type_ID FOREIGN KEY Weapon_Type_ID (Weapon_type_ID)
    REFERENCES Weapon_Type (Weapon_type_ID);

-- End of file.

