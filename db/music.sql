
DROP TABLE artists;

DROP TABLE albums;

CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  artist_name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL4 PRIMARY KEY,
  album_name VARCHAR(255)
);
