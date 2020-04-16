#! /bin/bash
declare playerPosition=0
declare DESTINATION=100
declare playerPath1
declare playerPath2

rolldice(){
playerPosition=$1
dice=$((RANDOM%6 +1))
option=$((RANDOM%3 -1))
playerPosition=$(( playerPosition + (dice * option)))
    if [[ $playerPosition -lt '0' ]]; then
        playerPosition=0
    fi
    if [[ $playerPosition -gt '100' ]]; then
        playerPosition=$(( playerPosition - dice))
        echo hey
    fi
   
}

playdicegame(){
    while [[ '1' -eq '1'  ]]; do 
        prevPlayer1count=$((player1Count -1 ))
        prevPlayer2count=$((player2Count -1 ))
        rolldice ${playerPath1[$prevPlayer1count]}
        playerPath1[((player1Count++))]=$playerPosition 
        if [[ $playerPosition -ge '100' ]]; then
            report="Player1 has won" 
            break
        fi
        rolldice ${playerPath2[$prevPlayer2count]}
        playerPath2[((player2Count++))]=$playerPosition
        if [[ $playerPosition -ge '100' ]]; then
            report="Player2 has won" 
            break
        fi
    done
#play count is stored here
playcount=${#playerPath1[@]}
}
playdicegame 

echo player 1
echo ${playerPath1[@]} 
echo player 2
echo ${playerPath2[@]}
echo $report won 