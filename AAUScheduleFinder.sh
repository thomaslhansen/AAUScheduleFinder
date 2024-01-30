#!/usr/bin/env bash
# AAU Schedule Finder - Finds your schedule in AAU's CalMoodle database without knowing its ID
# Copyright (C) 2019-2020 Thomas Lundsgaard Hansen
# Copyright (C) 2024 github.com/soupglasses
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

clear

echo "Velkommen til AAUScheduleFinder!"
echo "Et simplet værktøj til at finde din nye semester kalender ved AAU."
read -p "Indtast navnet på dit semester: " search

echo "Bæmerk: Hvis du ikke ved dit fid, kan du tage udgangspunkt i at foråret 2024"
echo "starter cirka ved fid 3000, og der eksisterer cirka 450 kalendere mellem"
echo "hvert semester."
read -p "Indtast dit FID fra sidste semester for at gøre søgningen hurtigere: " index

printf "\nSøgningen er nu igang, vi giver besked hvis vi finder noget!\n"

# One semester is roughly 400-500 calendars wide. Set our search window to be roughly 2 semesters
# in size to be safe, so 1000 indexes.
let max_index=$index+1000
pstr="........................................................................."

for i in `seq $index $max_index`; do
    pd=$(( ($i - $index ) * 73 /( $max_index - $index ) ))
    printf "\r%3d.%1d%% %.${pd}s" $(( ($i - $index ) * 100 / ( $max_index - $index ) )) $(( (( $i - $index ) * 1000 / ( $max_index - $index )) % 10 )) $pstr
    if wget -qO- https://www.moodle.aau.dk/local/planning/calmoodle.php\?fid\=$i | grep -q "$search"; then
        printf "\nVi fandt en kalender på fid $i!\n"
        echo " - Bekræft venligst, at dette er den korrekte kalender på: https://www.moodle.aau.dk/local/planning/calmoodle.php?fid=$i"
        echo " - Derefter kan du tilføje den til din kalender med: https://www.moodle.aau.dk/local/planning/ical.php?fid=$i"
        echo "Vi forsætter søgningen i det tilfælde, at der er flere kalendre der passer til dine søgekriterier..."
        notify-send AAUSchedulFinder "Kalender fundet!"
    fi
done

printf "\nSøgning afsluttet ved fid $i. Hvis vi fandt noget vil det stå ovenfor.\n"
