#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


check_shasum(){
    FILE=$1
    FILE_BASE_NAME=$(basename $FILE)
    $SHASUM_EXEC $SHASUM_ARGS $FILE | grep $(grep $FILE_BASE_NAME $SHASUM_FILE | cut -d' ' -f1 ) 2>&1 > /dev/null
    if [ "$?" = "0" ];
    then
       echo -e "${GREEN}Valid file for${NC} $FILE"
       exit 0;
    else
        echo -e "${RED}Invalid file for${NC} $FILE"
        exit 1;
    fi
}



usage(){
    echo "$0 file sha256 file"
    exit 1
}

while getopts h o
do	case "$o" in
	    h) usage;
               exit 1;
               ;;
	    [?]) usage;
		 exit 1;
                 ;;
	esac
done
shift $((OPTIND-1))


FILE=$1
SHASUM_FILE=$2
SHASUM_EXEC=shasum
SHASUM_ARGS="-a 256"
# This is really only tested on OSX
# Change the EXEC and ARGS if you want it to work elsewhere


check_shasum $FILE $SHASUM_FILE
