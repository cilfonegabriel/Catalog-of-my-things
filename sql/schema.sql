CREATE DATABASE Catalog

-- genres table
CREATE TABLE genres (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- music_albums table
CREATE TABLE music_albums (
  id BIGSERIAL PRIMARY KEY,
  publish_date DATE,
  on_spotify BOOLEAN,
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);