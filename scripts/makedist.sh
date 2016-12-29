#!/usr/bin/env bash

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR ; pwd`

cd $SCRIPTDIR/..

rm -f qplib.zip
ln -s . qplib

zip -r qplib.zip qplib/data/{meta,gms,lp} \
   qplib/html \
   qplib/scripts/{query.py,metadata.py}
    
rm qplib
