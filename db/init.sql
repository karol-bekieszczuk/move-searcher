CREATE DATABASE movies;

\c movies;
CREATE SEQUENCE movie_id_seq START 1;

CREATE TABLE movie (
    id INTEGER DEFAULT nextval('movie_id_seq') PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL
);

CREATE USER movies_user WITH ENCRYPTED PASSWORD 'postgres';

GRANT SELECT, INSERT, UPDATE, DELETE ON movie TO movies_user;

INSERT INTO movie (title, director, genre, release_date) VALUES
('The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'action fantasy adventure', '2002-02-15'),
('The Lord of the Rings: The Two Towers', 'Peter Jackson', 'action fantasy adventure', '2003-01-31'),
('The Lord of the Rings: The Return of the King', 'Peter Jackson', 'action fantasy adventure', '2004-01-01'),
('Pulp Fiction', 'Quentin Tarantino', 'action thriller mafia comedy dark_comedy crime', '1995-05-19'),
('Django Unchained', 'Quentin Tarantino', 'spaghetti_western adventure drama exploitation', '1995-05-19'),
('Titanic', 'James Cameron', 'drama melodrama romance disaster', '1998-02-13');