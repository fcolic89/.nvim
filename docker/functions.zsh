#stops a specified docker container
#or all running docker containers if the first argument is -a
function dstop(){
  if [[ $1 = "-a" ]]
  then
    docker container stop $(docker ps -q)
  elif [[ ! -z $1 ]]
  then
    docker container stop $1
  else
    echo "Missing an argument!"
  fi 
}

#remove a specified docker image
#or all images if the first argument is -a
function drmi(){
  if [[ $1 = "-a" ]]
  then
    docker rmi $(docker images -q)
  elif [[ ! -z $1 ]]
  then
    docker rmi $1
  else
    echo "Missing an argument!"
  fi
}

#removes a specified stopped docker container
#or all stopped containers if the first argument is -a
function drm(){
  if [[ $1 = "-a" ]]
  then
    docker rm $(docker ps -aq)
  elif [[ ! -z $1 ]]
  then
    docker rm $1
  else
    echo "Missing an argument!"
  fi
}

function dcu(){
  if [[ -z $1 ]]
  then
    docker compose up 
  elif [[ $1 = "-p" ]] && [[ ! -z $2 ]]
  then
   docker compose --profile $2 up $3
  elif [[ ! -z $1 ]] && [[ $1 != "-p" ]]
  then
   docker compose up $1 $2
  else
    echo "An error occured while trying to call docker compose up!"
  fi
}
