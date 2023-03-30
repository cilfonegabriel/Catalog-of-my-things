CREATE DATABASE Catalog

-- labels table
CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(35),
  color VARCHAR(15),
  PRIMARY KEY(id)
)

-- book table
CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(35)
  cover_state VARCHAR(35)
  publish_date DATE,
  id_label INT,
  PRIMARY KEY(id),
  CONSTRAINT reference_labels FOREIGN KEY(label_id) REFERENCES labels(id)
)

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


CREATE INDEX index_albums_genres ON music_albums(genre_id);

-- authors table
CREATE TABLE authors(
  id INT GENERATED ALWAYS AS IDENTITY,
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
