CREATE TABLE Games (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT,
    platform TEXT,
    release_year INT
);

CREATE TABLE Reviews (
    id SERIAL PRIMARY KEY,
    game_id INT REFERENCES Games(id) ON DELETE CASCADE,
    rating INT CHECK (rating >= 1 AND rating <= 10),
    comment TEXT,
    reviewer_name TEXT
);
create table public.games (
  id serial not null,
  title text not null,
  genre text null,
  platform text null,
  release_year integer null,
  constraint games_pkey primary key (id)
) TABLESPACE pg_default;

create table public.reviews (
  id serial not null,
  game_id integer null,
  rating integer null,
  comment text null,
  reviewer_name text null,
  constraint reviews_pkey primary key (id),
  constraint reviews_game_id_fkey foreign KEY (game_id) references games (id) on delete CASCADE,
  constraint reviews_rating_check check (
    (
      (rating >= 1)
      and (rating <= 10)
    )

    create table public.game_genres (
  game_id integer not null,
  genre_id integer not null,
  constraint game_genres_pkey primary key (game_id, genre_id),
  constraint game_genres_game_id_fkey foreign KEY (game_id) references games (id) on delete CASCADE,
  constraint game_genres_genre_id_fkey foreign KEY (genre_id) references genres (id) on delete CASCADE
) TABLESPACE pg_default;
  )
) TABLESPACE pg_default;

create table public.game_tags (
  game_id integer not null,
  tag_id integer not null,
  constraint game_tags_pkey primary key (game_id, tag_id),
  constraint game_tags_game_id_fkey foreign KEY (game_id) references games (id) on delete CASCADE,
  constraint game_tags_tag_id_fkey foreign KEY (tag_id) references tags (id) on delete CASCADE
) TABLESPACE pg_default;

create table public.platforms (
  id serial not null,
  name text not null,
  description text null,
  constraint platforms_pkey primary key (id)
) TABLESPACE pg_default;

create table public.genres (
  id serial not null,
  name text not null,
  description text null,
  constraint genres_pkey primary key (id)
) TABLESPACE pg_default;

create table public.game_platforms (
  game_id integer not null,
  platform_id integer not null,
  constraint game_platforms_pkey primary key (game_id, platform_id),
  constraint game_platforms_game_id_fkey foreign KEY (game_id) references games (id) on delete CASCADE,
  constraint game_platforms_platform_id_fkey foreign KEY (platform_id) references platforms (id) on delete CASCADE
) TABLESPACE pg_default;

create table public.tags (
  id serial not null,
  name text not null,
  constraint tags_pkey primary key (id)
) TABLESPACE pg_default;





-- Ivorlangus contrib

CREATE TABLE platforms (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE game_tags (
  game_id INT REFERENCES games(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (game_id, tag_id)
);

CREATE TABLE game_genres (
  game_id INT REFERENCES games(id) ON DELETE CASCADE,
  genre_id INT REFERENCES genres(id) ON DELETE CASCADE,
  PRIMARY KEY (game_id, genre_id)
);

CREATE TABLE game_platforms (
  game_id INT REFERENCES games(id) ON DELETE CASCADE,
  platform_id INT REFERENCES platforms(id) ON DELETE CASCADE,
  PRIMARY KEY (game_id, platform_id)
);

-- Sample data
INSERT INTO game_genres (game_id, genre_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 5), (5, 4);

INSERT INTO game_platforms (game_id, platform_id) VALUES
(1, 1), (1, 2), (2, 1), (2, 2), (3, 1),
(3, 2), (4, 1), (5, 1), (5, 2);

INSERT INTO platforms (name, description) VALUES
('PC', 'Personal Computer gaming via Steam, Epic Games etc.'),
('PS5', 'Sony PlayStation 5 console'),
('Xbox Series X', 'Microsoft Xbox Series X console'),
('Nintendo Switch', 'Nintendo handheld/home console');

INSERT INTO genres (name, description) VALUES
('Action', 'Fast-paced games focused on combat and reflexes'),
('Adventure', 'Exploration and story-driven games'),
('Sports', 'Simulation of real-world sports'),
('Horror', 'Scary, survival-focused games'),
('Tactical Shooter', 'Team-based strategic shooting games');

INSERT INTO tags (name) VALUES
('Multiplayer'),
('Open World'),
('Story Rich'),
('Difficult'),
('Family Friendly'),
('Online Only');

INSERT INTO game_tags (game_id, tag_id) VALUES
(1, 1), (1, 2),
(2, 2), (2, 4),
(3, 1), (3, 5),
(4, 1), (4, 6),
(5, 3), (5, 4);
