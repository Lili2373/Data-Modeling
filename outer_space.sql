-- from the terminal run:
-- psql < outer_space.sql

-- Drop and create the outer_space database
DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

-- Create tables
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE celestial_objects
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies(id)
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  celestial_object_id INT REFERENCES celestial_objects(id),
  moons_ids INTEGER[] REFERENCES moons(id) DEFAULT '{}'
);

-- Insert data into galaxies table
INSERT INTO galaxies (name) VALUES
('Milky Way');

-- Insert data into celestial_objects table
INSERT INTO celestial_objects (name, type, galaxy_id) VALUES
('The Sun', 'Star', 1),
('Proxima Centauri', 'Star', 1),
('Gliese 876', 'Star', 1);

-- Insert data into moons table
INSERT INTO moons (name) VALUES
('The Moon'), ('Phobos'), ('Deimos'),
('Naiad'), ('Thalassa'), ('Despina'),
('Galatea'), ('Larissa'), ('S/2004 N 1'),
('Proteus'), ('Triton'), ('Nereid'),
('Halimede'), ('Sao'), ('Laomedeia'),
('Psamathe'), ('Neso');

-- Insert data into planets table
INSERT INTO planets
  (name, orbital_period_in_years, celestial_object_id, moons_ids)
VALUES
  ('Earth', 1.00, 2, '{1}'),
  ('Mars', 1.88, 2, '{2, 3}'),
  ('Venus', 0.62, 2, '{}'),
  ('Neptune', 164.8, 2, '{4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}'),
  ('Proxima Centauri b', 0.03, 3, '{}'),
  ('Gliese 876 b', 0.23, 3, '{}');
