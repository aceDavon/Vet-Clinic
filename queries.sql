/*Queries that provide answers to the questions from all projects.*/

begin;
update animals set species='unspecified';
rollback;

begin;

update animals SET species = 'Degimon' where name ilike '%mon';
UPDATE animals SET species = 'Pokemon' where name not ilike '%mon';
commit;

begin;

DELETE FROM animals;
rollback;

begin;
savepoint aceUltra;
DELETE from animals where date_of_birth >= '2022-01-01';
rollback to aceUltra;

savepoint luffy;

UPDATE animals SET weight_kg = weight_kg * -1;
rollback to luffy;
UPDATE animals SET weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

SELECT count (*) AS animalCount from animals;
SELECT count(*) from animals where escape_attempts < 1;
SELECT cast(avg (weight_kg) as DECIMAL(5,2)) as averageWeight from animals;
SELECT name, max(escape_attempts) from animals where neutered = true or neutered = false group by name ORDER by max(escape_attempts) desc;
SELECT max(weight_kg) as maxWeight, min(weight_kg) as minWeight from animals;
SELECT cast(avg(escape_attempts) as DECIMAL(5,2)) as averageEscapeAttempts from animals WHERE EXTRACT(year from date_of_birth) between 1990 AND 2000;