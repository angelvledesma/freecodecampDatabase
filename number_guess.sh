#!/bin/bash

# Connect to database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if user exists
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]; then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME',0,NULL)"
  GAMES_PLAYED=0
  BEST_GAME=0
else
  # Existing user
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Initialize guess count
GUESS_COUNT=0

# Prompt first guess
echo "Guess the secret number between 1 and 1000:"
while true; do
  read GUESS

  # Check if input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESS_COUNT=$((GUESS_COUNT+1))

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    # Correct guess
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update database
    NEW_BEST=$BEST_GAME
    if [[ $BEST_GAME -eq 0 ]] || (( GUESS_COUNT < BEST_GAME )); then
      NEW_BEST=$GUESS_COUNT
    fi

    $PSQL "UPDATE users SET games_played = games_played + 1, best_game = $NEW_BEST WHERE username = '$USERNAME'"

    break
  fi
done