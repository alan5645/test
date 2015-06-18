#!/bin/bash
DIR=/var/tmp/mb/*
BDIR=/var/tmp/mbbak/
MINUTES=5
echo "Following files will be removed:"
find ${DIR} -cmin +${MINUTES}

sleep 5 

find ${DIR} -cmin +${MINUTES} -exec mv {} ${BDIR} \;

