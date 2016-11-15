#!/usr/bin/sh

NB_CARS=$1
tr -cd '[:alnum:]' < /dev/urandom | fold -w$NB_CARS | head -n1