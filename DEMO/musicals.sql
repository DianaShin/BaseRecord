CREATE TABLE theme_songs (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  musical_id INTEGER,

  FOREIGN KEY(musical_id) REFERENCES musical(id)
);

CREATE TABLE musicals (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  composer_id INTEGER,

  FOREIGN KEY(composer_id) REFERENCES composer(id)
);

CREATE TABLE composers (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
);

INSERT INTO
  theme_songs (id, title, musical_id)
VALUES
  (1, "Defying Gravity", 6),
  (2, "Memory", 3),
  (3, "She Used to Be Mine", 1),
  (4, "Music of the Night", 7),
  (5, "Guns and Ships", 1),
  (6, "I Still Believe", 2),
  (7, "I Dreamed a Dream", 3)

INSERT INTO
  composers (id, fname, lname)
VALUES
  (1, "Lin-Manuel", "Miranda"),
  (2, "Stephen", "Schwartz"),
  (3, "Andrew Lloyd", "Webber"),
  (4, "Claude-Michel", "Schonberg"),
  (5, "Sara", "Bareilles");

INSERT INTO
  musicals (id, title, composer_id)
VALUES
  (1, "Waitress", 5),
  (2, "Miss Saigon", 4)
  (3, "Les Miserables", 4)
  (4, "Hamilton", 1)
  (5, "Cats", 3)
  (6, "Wicked", 2)
  (7, "Phantom of the Opera", 3)
