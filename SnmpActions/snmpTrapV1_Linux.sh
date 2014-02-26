#!/bin/sh

community=$1
trapDestinationIP=$2
enterpriseOID=$3
trapSourceIP=$4
genericTrapID=$5
specificTrapID=$6
systemUpTime="'"$7"'"

snmptrap -v 1 -c ${community} ${trapDestinationIP} ${enterpriseOID} ${trapSourceIP} ${genericTrapID} ${specificTrapID} ${systemUpTime}