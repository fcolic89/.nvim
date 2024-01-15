#!/bin/bash

set -eo pipefail

#Variables
script_name="SETUP-GIT.SH"
color='\033[0;33m' #yellow
nocolor='\033[0m' # No Color
result=-2

info() {
    echo -e "$color$1$nocolor"
}

set_name_email(){
  while true; do
    info "What is your git username?"
    read name
    if [ -z "$name" ]; then
      info "Name cannot be empty..."
    else
      break
    fi
  done

  while true; do
    info "What is your git email?"
    read email
    if [ -z "$email" ]; then
      info "Email cannot be empty..."
    else
      break
    fi
  done
}

confirm_name_email(){
  info "\nConfirm username and email:"
  echo "-- username: $name"
  echo "-- email: $email"
  info "\n--to confirm type y\n--to restart type r\n--to abort type a"
  read input

  if [[ "$input" == "y" ]]; then
    result=1
  elif [[ "$input" == "r" ]]; then
    result=2
  elif [[ "$input" == "a" ]]; then
    result=-1
  else
    result=0
  fi
}

while true; do
  set_name_email
  confirm_name_email

  if [[ $result == 1 ]]; then
    info "Working..."

    git config --global user.name $name
    git config --global user.email $email

    info "Done"
    break
  elif [[ $result == 2 ]]; then
    continue
  elif [[ $result == -1 ]]; then
    info "Aborting..."
    break
  else
    info "Error. Aborting..."
    break
  fi
done

echo "Press RETURN to exit..."
read
