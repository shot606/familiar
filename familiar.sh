#! /bin/bash


# function
## hotspot
function hotspot() {
    echo "hoge";
}


# parameter
## required
FAMILIAR_NAME=`basename $0`;                         # familiar name
LOG_FILE="/tmp/${FAMILIAR_NAME}.log.`date +%Y%m%d`"; # log file path
SUICIDE_FILE="/tmp/${FAMILIAR_NAME}.stop";           # suicide file path
INTERVAL=1;                                          # interval

## optional
HOTSPOT_FILE=`dirname $0`/exec.sh;


# main
## init
### running check
if [ `pgrep -c ${FAMILIAR_NAME}` -ne 1 ]; then
    echo "$0 is already running.";
    exit 1;
fi

## main loop
while true
do

    ### suicide
    if [ -e ${SUICIDE_FILE} ];then
	echo "$0 is suicided.";
	exit 0;
    fi

    ### hotspot
    if [ -e ${HOTSPOT_FILE} ];then
	${HOTSPOT_FILE} &>> ${LOG_FILE};
    else
	hotspot &>> ${LOG_FILE};
    fi

    ### interval
    sleep ${INTERVAL};

done


# exit
exit 0;
