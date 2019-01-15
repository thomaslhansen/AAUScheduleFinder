#####################################
# Auther: Thomas Lundsgaard Hansen  #
# Date: 19-01-2019                  #
# Version: 1.0                      #
# License: GPL V2, June 1991        #
#####################################

#!/bin/bash

# Print a welcome
printf "Velkommen til AAUScheduleFinder!\nA simple tool to find your future schedule at AAU\n"


# Prompt for the name of the calendar
printf "Indtast navnet på dit semester: "
read search

# Prompt for the last known calendar id to speedup the search 
printf "Indtast dit id fra sidste semester for at gøre søgningen hurtigere: "
read index

# Alert the user that the search has started
printf "\nSøgningen er nu igang, vi giver besked hvis vi finder noget!\n"

# For any id from the one specified by the user to max id 9999 do a wget on the calendar url and
# grep for the calendar name. If found the user will be alerted.
for i in `seq $index 9999`;
do
if wget -qO- https://www.moodle.aau.dk/calmoodle/public/\?sid\=$i | grep -q "$search"; then
    echo "Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=$i der passer dine søgekriterier."
    echo "Vi forsætter søgningen i tilfælde at der er flere kalendre der passer"
    notify-send AAUSchedulFinder "Vi fandt en kalender"
fi
done

# Final message to the user
echo "Søgning slut. Hvis vi fandt noget vil det stå ovenfor."
