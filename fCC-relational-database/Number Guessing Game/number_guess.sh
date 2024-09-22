#!/bin/bash

# Database connection variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for player username
echo "Enter your username:"
read PLAYER_USERNAME

# Check if user exists and display welcome messages
PLAYER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$PLAYER_USERNAME'")

if [[ -z $PLAYER_ID ]]; then
    echo -e "\nWelcome, $PLAYER_USERNAME! It looks like this is your first time here.\n"
    INSERT_PLAYER_USERNAME=$($PSQL "INSERT INTO players(username) VALUES('$PLAYER_USERNAME')")
    PLAYER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$PLAYER_USERNAME'") 
else
    GAMES_PLAYED_COUNT=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$PLAYER_ID")
    BEST_GAME_GUESSES=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$PLAYER_ID")
    echo "Welcome back, $PLAYER_USERNAME! You have played $GAMES_PLAYED_COUNT games, and your best game took $BEST_GAME_GUESSES guesses."
fi

# Generate random number and initialize guess count
SECRET_NUMBER=$((RANDOM % 1000 + 1))
GUESS_COUNT=0

# Prompt first guess
echo "Guess the secret number between 1 and 1000:"
read PLAYER_GUESS

# Validate guesses using while loop
while [[ $PLAYER_GUESS != $SECRET_NUMBER ]]; do 
    if [[ ! $PLAYER_GUESS =~ ^[0-9]+$ ]]; then
        echo -e "\nThat is not an integer, guess again:"
    else
        if (( PLAYER_GUESS < SECRET_NUMBER )); then
            echo "It's higher than that, guess again:"
        else
            echo "It's lower than that, guess again:"
        fi
    fi
    read PLAYER_GUESS
    (( GUESS_COUNT++ ))
done

# Increment guess count for the correct guess
((GUESS_COUNT++))

# Log the game result to the database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES($PLAYER_ID, $SECRET_NUMBER, $GUESS_COUNT)")

# Winning message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"