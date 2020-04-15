#! /bin/bash
declare playerPosition=0
declare DESTINATION=100

play(){
  while [[ $playerPosition -le $DESTINATION  ]]; do 
  if [[ $playerPosition -lt '0' ]]; then
      playerPosition=0
  fi
  playerPath[((count++))]=$playerPosition
  dice=$((RANDOM%6 +1))
  option=$((RANDOM%3 -1))
  playerPosition=$(( playerPosition + (dice * option)))
   if [[ $playerPosition -ge '101' ]]; then
    ((count--))
    playerPosition=$((playerPosition - dice))
  fi 
  done
}

play 