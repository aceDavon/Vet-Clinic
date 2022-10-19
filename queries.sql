/*Queries that provide answers TO the questions FROM all projects.*/

BEGIN;

UPDATE animals SET species_id = '2' WHERE name ilike '%mon';
UPDATE animals SET species_id = '1' WHERE name not ilike '%mon';
COMMIT;

BEGIN;
savepoint aceUltra;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
ROLLBACK TO aceUltra;

savepoint luffy;

UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO luffy;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT count (*) AS animalCount FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts < 1;
SELECT CAST(avg (weight_kg) AS DECIMAL(5,2)) AS averageWeight FROM animals;
SELECT name, max(escape_attempts) FROM animals WHERE neutered = true OR neutered = false GROUP BY name ORDER BY max(escape_attempts) DESC;
SELECT max(weight_kg) AS maxWeight, min(weight_kg) AS minWeight FROM animals;
SELECT CAST(avg(escape_attempts) AS DECIMAL(5,2)) AS averageEscapeAttempts FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000;

--  Day 3 Queries
BEGIN;
UPDATE animals
  SET owners_id = '1' WHERE id = '1';
COMMIT;

BEGIN;
UPDATE animals
  SET owners_id = '2' WHERE id IN ('2', '3');
COMMIT;

BEGIN;
UPDATE animals
  SET owners_id = '3' WHERE id IN ('4', '6');
COMMIT;

BEGIN;
UPDATE animals
  SET owners_id = '4' WHERE id IN ('5', '7', '10');
COMMIT;

BEGIN;
UPDATE animals
  SET owners_id = '5' WHERE id IN ('8', '9');
COMMIT;

SELECT animals.name AS Ponds_animals, date_of_birth, weight_kg FROM animals
  JOIN owners ON animals.owners_id = owners.id where owners.id = 4 ORDER BY date_of_birth;

SELECT animals.name, species.name AS animal_type FROM animals
  JOIN species on animals.species_id = species.id where species.name ilike 'pokemon' ORDER BY animals.name;

SELECT full_name AS Owner_name, animals.name AS Animal_name FROM owners
  LEFT  JOIN animals using(id);

SELECT * FROM animals
 LEFT  JOIN owners using(id);

SELECT species.name AS animal_type, COUNT (species_id) FROM animals
  JOIN species ON species.id = animals.species_id GROUP BY species.name ORDER BY COUNT (species.id);

-- SELECT species.name,  C AS OUNT(species.name) FROM animals 
--   INNER JOIN species ON species.id = animals.species_id 
--   GROUP BY species.name;

SELECT name, full_name, species_id FROM animals 
  JOIN owners USING(id) 
  WHERE owners_id = 2 AND species_id = 2;

SELECT animals.name, escape_attempts, owners_id FROM owners
  JOIN animals USING(id)
  WHERE owners_id = 5 AND escape_attempts < 1; 

SELECT full_name, COUNT (full_name) FROM animals 
  JOIN owners ON owners.id = animals.owners_id 
  GROUP BY full_name ORDER BY COUNT DESC 
  LIMIT 1;