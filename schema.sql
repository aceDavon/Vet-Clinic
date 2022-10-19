/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

CREATE TABLE owners (
    id BIGSERIAL,
    full_name VARCHAR(100) NOT NULL,
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id BIGSERIAL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE animals (
    id BIGSERIAL,
    name varchar(100) NOT NULL,
    species_id INT REFERENCES species(id),
    owners_id INT REFERENCES owners(id),
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY (id)
);