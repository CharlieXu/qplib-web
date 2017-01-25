#!/usr/bin/env bash

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR ; pwd`

cd $SCRIPTDIR/..

rm -f html/qplib.zip
ln -s . qplib

zip -r html/qplib.zip qplib/html
    
rm qplib
