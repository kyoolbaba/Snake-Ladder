#! /bin/bash
declare playerPosition=0
declare DESTINATION=100

game(){
dice=$((RANDOM%6 +1))
option=$((RANDOM%3 -1))
playerPosition=$(( playerPosition + (dice * option)))
    if [[ $playerPosition -lt '0' ]]; then
        playerPosition=0
    fi
}

play(){
while [[ '1' -eq '1'  ]]; do 
game  # CALLING METHOD TO CALCULATE THE DICE VALUE AND UPDATE THE POSITION
playerPath1[((count++))]=$playerPosition #ALL POSITIONS OF PLAYER1 STORED HERE
    if [[ $playerPosition -gt '100' ]]; then
        report=Player1
        break
    fi
game # CALLING METHOD TO CALCULATE THE DICE VALUE AND UPDATE THE POSITION
playerPath2[((count++))]=$playerPosition #ALL POSITIONS OF PLAYER2 STORED HERE
    if [[ $playerPosition -gt '100' ]]; then
         report=Player2
         break
    fi
done
#play count is stored here
playcount=${#playerPath1}
}
play 
#UNCOMMENT THE BELOW LINES TO CHECK THE OUTPUTS
#echo player 1
#echo ${playerPath1[@]} 
#echo player 2
#echo ${playerPath2[@]}
#echo $report won