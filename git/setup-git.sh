#!/bin/bash

set -eo pipefail

#Variables
script_name="SETUP-GIT.SH"
color='\033[0;33m' #yellow
nocolor='\033[0m' # No Color
name=""
email=""
result=-2

info() {
    echo -e "$color$1!$nocolor"
}

set_name_email(){
  info "What is your git username?"
  read name

  while [ -z "$name" ]; do
    info "Name cannot be empty.."
    info "What is your git username?"
    read name
  done

  info "What is your git email?"
  read email

  while [ -z "$email" ]; do
    info "Email cannot be empty.."
    info "What is your git email?"
    read email
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

set_name_email
while true; do
  confirm_name_email

  if [[ $result == 1 ]]; then
    info "Working..."

    git config --global user.name $name
    git config --global user.email $email

    info "Done"
    break
  elif [[ $result == 2 ]]; then
    set_name_email
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
