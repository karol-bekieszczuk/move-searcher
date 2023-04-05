CREATE DATABASE movies;

\c movies;

CREATE SEQUENCE movie_id_seq START 1;
CREATE TABLE movie (
    id INTEGER DEFAULT nextval('movie_id_seq') PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    release_date DATE NOT NULL
);

CREATE USER movies_user WITH ENCRYPTED PASSWORD 'postgres';

GRANT SELECT, INSERT, UPDATE, DELETE ON movie TO movies_user;

INSERT INTO movie (title, director, genre, description, release_date) VALUES
('The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'action fantasy adventure', 'The Lord of the Rings: The Fellowship of the Ring is a fantasy adventure film released in 2001 and directed by Peter Jackson. The movie is based on the first volume of J.R.R. Tolkien''s epic novel The Lord of the Rings. The story follows hobbit Frodo Baggins, who inherits a powerful ring from his uncle Bilbo, and his journey to destroy it in order to prevent the dark lord Sauron from using it to conquer Middle-earth. Along with a group of companions, including the wizard Gandalf and the humans Aragorn and Boromir, Frodo sets out on a perilous journey to Mount Doom, where the ring was forged and can be destroyed. The film was a critical and commercial success, receiving numerous awards and nominations, and is widely regarded as one of the greatest fantasy films of all time.', '2002-02-15'),
('The Lord of the Rings: The Two Towers', 'Peter Jackson', 'action fantasy adventure', 'Frodo and Sam continue their journey to Mordor to destroy the One Ring, while Aragorn, Legolas, and Gimli search for allies to help them in the upcoming battle against Sauron''s army. Meanwhile, Saruman''s army of Uruk-hai has attacked Rohan, and Merry and Pippin are taken captive by the orcs. The fate of Middle-earth hangs in the balance as the members of the Fellowship are scattered across the land, fighting for their lives and for the future of their world.', '2003-01-31'),
('The Lord of the Rings: The Return of the King', 'Peter Jackson', 'action fantasy adventure', 'In the final chapter of the epic trilogy, the fate of Middle-earth is at stake as the armies of Sauron mass for a final attack. Meanwhile, Frodo and Sam approach Mount Doom to destroy the One Ring.', '2004-01-01'),
('Pulp Fiction', 'Quentin Tarantino', 'action thriller mafia comedy dark_comedy crime', 'Pulp Fiction is a 1994 American crime film directed by Quentin Tarantino. The film is known for its nonlinear narrative structure and is praised for its sharp dialogue and eclectic cast of characters. The plot follows several interrelated storylines, including the misadventures of two hitmen, a boxer who refuses to throw a fight, and a mob boss''s wife who overdoses on heroin.', '1995-05-19'),
('Django Unchained', 'Quentin Tarantino', 'spaghetti_western adventure drama exploitation', 'Django Unchained is a 2012 American revisionist Western film written and directed by Quentin Tarantino, starring Jamie Foxx, Christoph Waltz, and Leonardo DiCaprio. The story follows Django, a slave who becomes a bounty hunter, and his journey to rescue his wife from a brutal plantation owner. With its stunning visuals, gripping performances, and unforgettable soundtrack, Django Unchained is a thrilling and thought-provoking film that explores themes of slavery, vengeance, and justice in the antebellum United States.', '1995-05-19'),
('Titanic', 'James Cameron', 'drama melodrama romance disaster', 'Titanic is a romantic drama film released in 1997, starring Leonardo DiCaprio and Kate Winslet. It tells the story of a young woman named Rose DeWitt Bukater who falls in love with a poor artist named Jack Dawson on board the RMS Titanic, which sinks on its maiden voyage. The film was a commercial and critical success, winning 11 Academy Awards, including Best Picture.', '1998-02-13');