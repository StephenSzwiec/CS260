#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
#By Stephen Szwiec [Stephen@Szwiec.xyz] 

#This program is a script to check if the current user has any processes
#that have run for longer than one hour (etime) and kills them
#This script should not kill it's parent process directly

#!/bin/bash
CURRENT_PID=$(echo $$)
PS=$(ps -eo uid,pid,etimes,cmd)
PID=$(awk 'NR>1 {print $2}' <<< $PS)
ETIMES=$(awk 'NR>1 {print $3}' <<< $PS)
CMD=$(awk 'NR>1 {print $4}' <<< $PS)
PUID=$(awk 'NR>1 {print $1}' <<< $PS)
CURRUID=$(id -u)
COUNT=0
for PROCESS in $PID
do
	(( COUNT++ ))
	PROCESS_TIME=$(awk -v nr=$COUNT 'NR==nr {print $1}' <<< $ETIMES)
		if [ $PROCESS_TIME -gt 3600 ]
		then
			if [ $CURRENT_PID -ne $PROCESS ]
			then
				PROCESS_UID=$(awk -v nr=$COUNT 'NR==nr {print $1}' <<< $PUID)
				if [ $PROCESS_UID -eq $CURRUID ]
				then
					PROCESS_NAME=$(awk -v nr=$COUNT 'NR==nr {print $1}' <<< $CMD)
					echo killing $PROCESS_NAME because it has lived $PROCESS_TIME seconds!
					#kill -9 $PROCESS
				fi
			fi

		fi
done
