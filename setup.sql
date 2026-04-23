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
