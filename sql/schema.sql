CREATE DATABASE Catalog

-- genres table
CREATE TABLE genres (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- music_albums table
CREATE TABLE music_albums (
  id BIGSERIAL PRIMARY KEY,
  publish_year DATE,
  on_spotify BOOLEAN,
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);

-- authors table
CREATE TABLE authors(
  id INT GENERATED ALWAYS AS INDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);

-- game table
CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  game_id INT
  PRIMARY KEY(id)
  CONSTRAINT reference_author FOREIGN KEY(games_id) REFERENCES authors(id)
);

-- indexes
CREATE INDEX index_author ON games(author_id)
