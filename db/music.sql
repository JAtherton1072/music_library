DROP TABLE IF EXISTS albums;

DROP TABLE IF EXISTS artists;




CREATE TABLE artists(
  artists_id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)

);


CREATE TABLE albums(
  album_id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artists_id SERIAL4 REFERENCES artists(artists_id) ON DELETE CASCADE

);
