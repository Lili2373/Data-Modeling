-- from the terminal run:
-- psql < music.sql

-- Drop and create the music database
DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

-- Create tables
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL,
  -- Use foreign keys to reference artists and producers
  artist_ids INTEGER[] NOT NULL,
  producer_ids INTEGER[] NOT NULL
);

-- Insert data into artists and producers tables
INSERT INTO artists (name) VALUES
('Hanson'), ('Queen'), ('Mariah Carey'), ('Boyz II Men'),
('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'),
('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'),
('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO producers (name) VALUES
('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'),
('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'),
('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'),
('The Matrix'), ('Darkchild');

-- Insert data into the songs table
INSERT INTO songs
  (title, duration_in_seconds, release_date, album, artist_ids, producer_ids)
VALUES
  ('MMMBop', 238, '1997-04-15', 'Middle of Nowhere', '{1}', '{1, 2}'),
  ('Bohemian Rhapsody', 355, '1975-10-31', 'A Night at the Opera', '{2}', '{3}'),
  ('One Sweet Day', 282, '1995-11-14', 'Daydream', '{3, 4}', '{4}'),
  ('Shallow', 216, '2018-09-27', 'A Star Is Born', '{5, 6}', '{5}'),
  ('How You Remind Me', 223, '2001-08-21', 'Silver Side Up', '{7}', '{6}'),
  ('New York State of Mind', 276, '2009-10-20', 'The Blueprint 3', '{8, 9}', '{7}'),
  ('Dark Horse', 215, '2013-12-17', 'Prism', '{10, 11}', '{8, 9}'),
  ('Moves Like Jagger', 201, '2011-06-21', 'Hands All Over', '{12, 13}', '{10, 11}'),
  ('Complicated', 244, '2002-05-14', 'Let Go', '{14}', '{12}'),
  ('Say My Name', 240, '1999-11-07', 'The Writing''s on the Wall', '{15}', '{13}');
