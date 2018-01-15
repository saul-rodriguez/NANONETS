#!/bin/bash
COMMAND=$1
###########################
# AMS hk4.14 start script #
# Author: Saul Rodriguez  #
# Date: 2017-07-04        #
###########################

if [ "$COMMAND" = "new" ];
then 
   echo "********* Creating new working directory ********"
   ams_cds -t ac18a6 -add all &
elif [ "$COMMAND" = "update" ]   
then
   echo "********* Updating project to current hitkit **********"
   ams_cds -update &
elif [ "$COMMAND" = "newtech" ]
then
   echo "********* Updating project to AMS tech NOT IMPLEMENTED! **********"
else
   echo "********* starting virtuoso **********"
   ams_cds &
fi
