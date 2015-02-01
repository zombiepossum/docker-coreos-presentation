#! /bin/bash

args=("$@")
ELEMENTS=${#args[@]}
CONFIG_FILE=$1
shift
FLEET_FUNCTION=$1
shift
echo "Pod: $CONFIG_FILE"
echo "Fleet Function: $FLEET_FUNCTION"
if [ "$FLEET_FUNCTION" = "submit" ];
  then
  while read line  # For as many lines as the input file has ...
  do
    echo "submitting file $line@.service"
    fleetctl submit $line@.service
  done < $CONFIG_FILE
elif [ "$CONFIG_FILE" = "help" -o  "$CONFIG_FILE" = "" ];
  then
  echo "launchPod <pod file> <fleet function> <range>"
  echo "examples"
  echo "launchPod foo.pod submit"
  echo "launchPod foo.pod destroy {1..3}"
  echo ""
  echo "Submit will submit the file, no range required"
  echo "destroy will destroy both the containers and the service file"
  echo "range required"
elif [ "$FLEET_FUNCTION" = "destroy" ];
  then
  while read line  # For as many lines as the input file has ...
  do
    fleetctl destroy $line@.service
  done < $CONFIG_FILE
  while (( "$#" )); do
    while read line  # For as many lines as the input file has ...
    do
      fleetctl $FLEET_FUNCTION $line@$1
    done < $CONFIG_FILE
    shift
  done
else
  while (( "$#" )); do
    while read line  # For as many lines as the input file has ...
    do
      fleetctl $FLEET_FUNCTION $line@$1
    done < $CONFIG_FILE
  shift
  done
fi
