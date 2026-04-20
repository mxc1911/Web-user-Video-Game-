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
  )
) TABLESPACE pg_default;

