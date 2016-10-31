#!/bin/bash
# __k.a.s.k.0.v__
# checking through tor

BANNER="       mm\n    /^(  )^\ \n    \,(..),/\n      V~~V ZNetChecker v.1\n"

AGENT="ZNET_CHECKING_GUY" # To know what it was me

torStat() {

STAT=`pidof tor | wc -l`

if [ "$STAT" -ne 1 ]
then
        echo -e " [\e[1;31m-\e[0;0m] TOR is down"
        service tor start
		#sleep 2
		for ((x = 0; x < 10; x++))
		do
			#printf %s " . "
			printf ' %s' .
			sleep 0.5
		done

		torStat
else
        echo -e "\n [\e[1;33m+\e[0;0m] OK! TOR with us"
fi

}


checkStat () {

CHECK=`proxychains curl -A "$AGENT" -s -o /dev/null -w "%{http_code}" 0xB98FAD57`

if [ "$CHECK" -eq 200 ]
then
	echo -e " [*] Site's status is: $CHECK. OK!\n"
else
	echo -e " [*] Site's status is: $CHECK.\n     Is there something wrong?\n"
fi

}

echo -e "$BANNER"

torStat
checkStat

# zakończyć szybciej !!!!!!!!!!

