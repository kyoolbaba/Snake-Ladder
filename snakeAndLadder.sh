#! /bin/bash
declare playerPosition=0
declare DESTINATION=100

rolldice(){
dice=$((RANDOM%6 +1))
option=$((RANDOM%3 -1))
playerPosition=$(( playerPosition + (dice * option)))
    if [[ $playerPosition -lt '0' ]]; then
        playerPosition=0
    fi
}

playdicegame(){
while [[ '1' -eq '1'  ]]; do 
rolldice
playerPath1[((count++))]=$playerPosition 
    if [[ $playerPosition -gt '100' ]]; then
        report="Player1 has won" 
        break
    fi
rolldice 
playerPath2[((count++))]=$playerPosition
    if [[ $playerPosition -gt '100' ]]; then
         report="Player2 has won" 
         break
    fi
done
#play count is stored here
playcount=${#playerPath1}
}
playdicegame 