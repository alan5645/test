#!/bin/bash
# Name: check_dirempty.sh
#
# This plugin checks if folder is empty. OK status"
# If directory contains 1 or 2 files, the check will exit with status code 1."
# If directory contains 3 or more files, the check will exit with status code 2."
#
# 0 = NO NOTIFICATION; 1 = WARNING; 2 = CRITICAL

# Set States
#set -x
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2

[[ "$#" -eq "" ]] && echo "Usage: empty_dir <DIR> <FILEAGE in minutes>" && exit

# NRF EET Failed transfer directory
DIR=$1
# File age in minutes
FILEAGE=$2

# MAIN
COUNTFILES=$(find ${DIR}/* -cmin -${FILEAGE} -size +5c|wc -l)

echo "Number of files in ${DIR} not older than ${FILEAGE} minutes: ${COUNTFILES}"

case ${COUNTFILES} in
  0)      echo "OK, local Directory named ${DIR} is empty."                     ; exit ${STATE_OK}       ;;
  [1-2])  echo "WARNING! Directory named ${DIR} contains ${COUNTFILES} file(s)" ; exit ${STATE_WARNING}  ;;
  [3-9])  echo "CRITICAL! Directory named ${DIR} contains ${COUNTFILES} files"  ; exit ${STATE_CRITICAL} ;;
esac
