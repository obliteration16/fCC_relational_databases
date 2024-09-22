#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~ MY SALON ~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
    if [[ $1 ]]
    then
      echo -e "\n$1"
    fi

    SERVICES_LIST=$($PSQL "SELECT * FROM services")
    echo "$SERVICES_LIST" | while IFS='|' read SERVICE_ID SERVICE
    do
      ID=$(echo $SERVICE_ID | sed 's/ //g')
      NAME=$(echo $SERVICE | sed 's/ //g')
      echo "$ID) $NAME"
    done
    read SERVICE_ID_SELECTED

    case $SERVICE_ID_SELECTED in
      [1-5]) SERVICE_MENU ;;
          *) MAIN_MENU "I could not find that service. What would you like today?" ;;
    esac
}

 SERVICE_MENU() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME_QUERY=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME_QUERY| sed 's/ //g')
  
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "I don't have a record for that phone number, what's your name??"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE_NAME_QUERY=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_NAME=$(echo $SERVICE_NAME_QUERY| sed 's/ //g')
 
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
  then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." 
  fi
}
  

MAIN_MENU