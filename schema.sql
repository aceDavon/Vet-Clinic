/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
    id BIGSERIAL,
    name varchar(100) NOT NULL,
    species VARCHAR(100) NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY (id)
);