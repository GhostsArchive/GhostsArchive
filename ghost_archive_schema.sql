-- Create People table to store individual information
CREATE TABLE People (
    person_id INT PRIMARY KEY,
    person_gender VARCHAR(255),
    person_birth_date DATE,
    person_death_date DATE,
    person_social_media_ids VARCHAR(255),
    person_email_ids VARCHAR(255),
    person_phone_number_ids VARCHAR(255),
    person_article_ids VARCHAR(255),
    person_photo_ids VARCHAR(255),
    person_case_ids VARCHAR(255),
    person_bio_summary TEXT,
    person_bio TEXT,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

-- Create a table to store individual names
CREATE TABLE PeopleNames (
    name_id INT PRIMARY KEY,
    person_id INT,
    name_type VARCHAR(255), -- e.g., first_name, nickname, surname, also_known_as
    name_value VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES People(person_id)
);

-- Create Families table to represent nuclear families
CREATE TABLE Families (
    family_id INT PRIMARY KEY,
    family_surname VARCHAR(255),
    family_history TEXT
);

-- Create a table to store family relationships
CREATE TABLE FamilyMembers (
    family_member_id INT PRIMARY KEY,
    family_id INT,
    person_id INT,
    relationship_type VARCHAR(255), -- e.g., 'parent', 'child', 'spouse'
    relationship_comment TEXT,
    FOREIGN KEY (family_id) REFERENCES Families(family_id),
    FOREIGN KEY (person_id) REFERENCES People(person_id)
);

-- Create Articles table
CREATE TABLE Articles (
    article_id INT PRIMARY KEY,
    article_title VARCHAR(255),
    article_summary TEXT,
    article_content TEXT,
    article_author_id INT,
    FOREIGN KEY (article_author_id) REFERENCES People(person_id),
    article_date DATE,
    article_accessed DATE,
    article_url VARCHAR(255)
);

-- Create a table to store names of people, places, or organizations mentioned in articles
CREATE TABLE ArticleNames (
    article_name_id INT PRIMARY KEY,
    article_id INT,
    name_type VARCHAR(255), -- e.g., person_name, place_name, organization
    name_value VARCHAR(255),
    person_id INT,
    org_id INT,
    loc_id INT,
    FOREIGN KEY (article_id) REFERENCES Articles(article_id),
    FOREIGN KEY (person_id) REFERENCES People(person_id),
    FOREIGN KEY (org_id) REFERENCES Orgs(org_id),
    FOREIGN KEY (loc_id) REFERENCES Locs(loc_id)
);

-- Create a table to store information about organizations
CREATE TABLE Orgs (
    org_id INT PRIMARY KEY,
    org_name VARCHAR(255),
    org_bio TEXT,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

-- Create a table to store Locations 
CREATE TABLE Locs (
    loc_id INT PRIMARY KEY,
    loc_name VARCHAR(255),
    loc_info TEXT,
    loc_url VARCHAR(255),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

-- Create a table to store Case File information
CREATE TABLE Casefile (
    casefile_id INT PRIMARY KEY,
    casefile_name VARCHAR(255),
    casefile_summary TEXT,
    casefile_timeline TEXT, -- I assume this will store a timeline description
    casefile_status VARCHAR(255), -- e.g., 'open', 'closed', etc.
    casefile_created_date DATE,
    casefile_closed_date DATE,
    casefile_assigned_to INT, -- Reference to the investigator (People.person_id)
    FOREIGN KEY (casefile_assigned_to) REFERENCES People(person_id)
);

-- Create a table to link Case Files to People
CREATE TABLE CasefilePeople (
    casefile_id INT,
    person_id INT,
    PRIMARY KEY (casefile_id, person_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (person_id) REFERENCES People(person_id)
);

-- Create a table to link Case Files to Organizations
CREATE TABLE CasefileOrgs (
    casefile_id INT,
    org_id INT,
    PRIMARY KEY (casefile_id, org_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (org_id) REFERENCES Orgs(org_id)
);

-- Create a table to link Case Files to Families
CREATE TABLE CasefileFamilies (
    casefile_id INT,
    family_id INT,
    PRIMARY KEY (casefile_id, family_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (family_id) REFERENCES Families(family_id)
);

-- Create a table to link Case Files to Locations
CREATE TABLE CasefileLocs (
    casefile_id INT,
    loc_id INT,
    PRIMARY KEY (casefile_id, loc_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (loc_id) REFERENCES Locs(loc_id)
);

-- Create a table to link Case Files to Addresses
CREATE TABLE CasefileAddresses (
    casefile_id INT,
    address_id INT,
    PRIMARY KEY (casefile_id, address_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

-- Create a table to link Case Files to People Names
CREATE TABLE CasefilePeopleNames (
    casefile_id INT,
    name_id INT,
    PRIMARY KEY (casefile_id, name_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (name_id) REFERENCES PeopleNames(name_id)
);

-- Create a table to link Case Files to Articles
CREATE TABLE CasefileArticles (
    casefile_id INT,
    article_id INT,
    PRIMARY KEY (casefile_id, article_id),
    FOREIGN KEY (casefile_id) REFERENCES Casefile(casefile_id),
    FOREIGN KEY (article_id) REFERENCES Articles(article_id)
);
