#!/usr/bin/env bash
# File: guessinggame.sh

function testvalue {
# return 0 if the correct # of files was guessed, -1 if to few, and +1 if 2 many
   local val=-2

   if [[ $response =~ ^[0-9]{1,6}$ ]]
   then
      if [[ $response -eq numoffiles ]]
      then
         let val=0
      elif [[ $response -lt numoffiles ]]
      then
         let val=-1
      else
         let val=1
      fi
   fi
   echo "$val"
}

numoffiles=$(ls -l | egrep -v ^"total" | wc -l)

result=999

while [[ $result -ne 0 ]]
do
   echo "How many files are in the current directory? "
   read response
   result=$(testvalue)
 
   if [[ $result -eq -1 ]]
   then
      echo "There are more than $response fiies, please try again"
   elif [[ $result -eq 1 ]]
   then
      echo "There are less than $response files, please try again"
   elif [[ $result -eq -2 ]]
   then
      echo "The input value ($response) was outside valid limits or not numeric, please try again"
   fi
   echo " "
   echo " "
done

echo "Congratulations, you guessed the correct number"
