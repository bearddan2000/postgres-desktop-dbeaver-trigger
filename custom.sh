#!/usr/bin/env bash

TIMER=5

function print-cmd(){
  local cmd=$2

  $cmd
  echo
  echo "===========> command $1" 
  echo
  sleep $TIMER
}

function print-cat-cmd(){
  cat $1
  echo
  echo "===========> command cat $1" 
  echo
  sleep $TIMER
}

function pausa(){

  local line=""

  while true; do
    read -p "Continue project? [y/N]" line
    if [ "$line" = "y" ]; then
      print-cmd "sudo docker compose down" 'sudo docker compose down'
      print-cmd "sudo xhost - local:docker" 'sudo xhost - local:docker'
      break
    fi
  done
}

print-cmd "tree ." 'tree .'

print-cmd "cat docker-compose.yml" 'cat docker-compose.yml'

for a in `find . -type f -name "Dockerfile"`; do
    print-cat-cmd $a
done

for a in `find db -type f -name "*.sql" | sort -n`; do
    print-cat-cmd $a
done

for a in `find . -type d -name "bin"`; do
  for b in `find $a -type f`; do
      print-cat-cmd $b
  done
done

print-cmd "sudo xhost + local:docker" 'sudo xhost + local:docker'
print-cmd "sudo docker compose up -d --build" 'sudo docker compose up -d --build'

pausa