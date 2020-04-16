#! /bin/bash
declare playerPosition=0
declare DESTINATION=100
declare -A playerPosition
echo Enter the number of players
read NO_OF_PLAYERS

rolldice(){
    dice=$((RANDOM%6 +1))
    option=$((RANDOM%3 -1))
    playerPlace=$(( playerPlace + (dice * option)))
    if [[ $playerPlace -lt '0' ]]; then
        playerPlace=0
    fi
    if [[ $playerPlace -gt '100' ]]; then
        playerPlace=$(( playerPlace - dice))
        echo hey
    fi
}

playdicegame(){
    while [[ '1' -eq '1'  ]]; do 
         ((count++))
             for (( i = 1 ; i < $((NO_OF_PLAYERS+1)) ; i++  )); do 
                 player=Player$i
                 echo from $player  $player $player $player 
                 playerPlace=${playerPosition[$player]}
                 rolldice 
                 playerPosition[Player$i]=$playerPlace 
                 if [[ $playerPlace -ge '100' ]]; then
                      report="Player$i has won" 
                     break
                 fi
            done     
        if [[ $playerPlace -ge '100' ]]; then
            break
        fi
    done
#play count is stored here
playcount=$count
}

playdicegame 
echo $count
echo $report