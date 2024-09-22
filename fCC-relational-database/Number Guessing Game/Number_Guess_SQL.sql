CREATE DATABASE number_guess;
\c number_guess

CREATE TABLE players (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(22) UNIQUE NOT NULL
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES players(user_id),
    secret_number INT NOT NULL,
    number_of_guesses INT NOT NULL
);