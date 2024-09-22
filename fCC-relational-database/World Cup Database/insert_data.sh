#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $WINNER != "winner" ]];
    then
    WINNING_TEAM=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
      if [[ -z $WINNING_TEAM ]];
        then
          INSERT_WINNING_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
            if [[ $INSERT_WINNING_TEAM == "INSERT 0 1" ]];
              then
                echo Inserted Team: $WINNER
            fi
      fi
  fi

  if [[ $OPPONENT != "opponent" ]];
    then
    OPPONENT_TEAM=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
      if [[ -z $OPPONENT_TEAM ]];
        then
          INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
            if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]];
              then
                echo Inserted Team: $OPPONENT
            fi
      fi
  fi

  if [[ $YEAR != "year" ]];
    then
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[ $INSERT_GAME == "INSERT 0 1" ]];
          then
            echo Inserted Game: $YEAR, $ROUND, $WINNER VS $OPPONENT, score $WINNER_GOALS : $OPPONENT_GOALS
        fi
    fi
    
done