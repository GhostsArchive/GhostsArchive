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
