#!/bin/bash

# Variable for querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# regex
regex="^[0-9]+$"

# Generate random number 1-1000
RANDOM_NUMBER=$[ $RANDOM % 1000 + 1 ]
echo -e "\nTHE RANDOM NUMBER IS $RANDOM_NUMBER" 

# Insert new values
INSERT_DATA() {
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$1'")

  if [[ -z $GAMES_PLAYED ]]
    # New User to be inserted
    then
      INSERTION_RESULT=$($PSQL "INSERT INTO users(name, games_played, best_game) VALUES('$1', 1, $2)")
      # echo $INSERTION_RESULT
    # Old User to be updated
    else
      ((GAMES_PLAYED++))
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$1'")
      
      if [[ $2 < $BEST_GAME ]]
        # if number of tries is better than best game
        then
          # echo "ENTERED HERE"
          UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$2 WHERE name='$1'")
        # if not
        else
          UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE name='$1'")
      fi
      
  fi
}

WELCOME_MESSAGE() {
  if [[ $2 == 1 ]]
    then
      echo -e "Welcome, $1! It looks like this is your first time here."
    else
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$1'")
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$1'")
      echo -e "Welcome back, $1! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

# Asks for username
echo -e "\nEnter your username:"
read USERNAME
DATABASE_NAME=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")

if [[ -z $DATABASE_NAME ]]
  then
    # New User
    WELCOME_MESSAGE $USERNAME 1
  else
    # Old User
    WELCOME_MESSAGE $USERNAME 0
fi

NUMBER_OF_TRIES=1

echo -e "\nGuess the secret number between 1 and 1000:"
while [[ $GUESS_NUMBER != $RANDOM_NUMBER ]]
do
  read GUESS_NUMBER
  
  if [[ $GUESS_NUMBER =~ $regex ]]
    #  if input is an integer
    then
      if [[ $GUESS_NUMBER > $RANDOM_NUMBER ]]
        then
          ((NUMBER_OF_TRIES++))
          echo "It's lower than that, guess again:"
      fi
      if [[ $GUESS_NUMBER < $RANDOM_NUMBER ]]
        then
          ((NUMBER_OF_TRIES++))
          echo "It's higher than that, guess again:"
      fi
      if [[ $GUESS_NUMBER == $RANDOM_NUMBER ]]
        then
          echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
          INSERT_DATA $USERNAME $NUMBER_OF_TRIES
      fi
    #  if input is not an integer
    else
      echo "That is not an integer, guess again:"
  fi

done







