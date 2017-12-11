#!/bin/bash

if [ -z $1 ]
then
    echo "need device as parameter"
    exit 1;
fi
if [ -e $HOME/myscripts/swapkeys.sh ]
then
    $HOME/myscripts/swapkeys.sh $1
fi

gulp --no-lint --no-karma;

gulp deploy --device=$1;

gulp --no-lint --no-karma watch --device=$1;

