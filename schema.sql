/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS specializations;
DROP TABLE IF EXISTS visits;

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

CREATE TABLE vets (
    id BIGSERIAL,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
    vets_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
    animals_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date_of_visit DATE
);
