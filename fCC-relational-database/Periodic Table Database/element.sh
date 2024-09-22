#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

BASE_QUERY="SELECT elements.atomic_number, elements.symbol, elements.name, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type 
             FROM elements 
             INNER JOIN properties ON elements.atomic_number = properties.atomic_number 
             INNER JOIN types ON types.type_id = properties.type_id 
             WHERE "

# Read the input argument
USER_INPUT=$1

# Check if the argument is provided
if [ -z "$USER_INPUT" ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Execute query based on the type of input
if [[ "$USER_INPUT" =~ ^[0-9]+$ ]]; then
  # Query by atomic number
  QUERY="${BASE_QUERY} elements.atomic_number = $USER_INPUT;"
else
  # Query by symbol
  QUERY="${BASE_QUERY} elements.symbol = '$USER_INPUT';"
  
  # Execute the query
  ELEMENT=$($PSQL "$QUERY")
  
  # If no results found by symbol, query by name
  if [ -z "$ELEMENT" ]; then
    QUERY="${BASE_QUERY} elements.name ILIKE '%$USER_INPUT%';"
  fi
fi

# Execute the final query and get the result
ELEMENT=$($PSQL "$QUERY")

# Check if the query returned any results
if [ -z "$ELEMENT" ]; then
  echo "I could not find that element in the database."
else
  # Clean up the result by removing unnecessary spaces
  ELEMENT=$(echo "$ELEMENT" | sed 's/ //g')
  
  # Read the result into variables
  IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE <<< "$ELEMENT"
  
  # Print the element information
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
fi