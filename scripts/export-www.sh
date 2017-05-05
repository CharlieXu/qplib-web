#!/bin/bash

#
# This script copies the selected webpage to the webserver
#

WWWDIR=$USER@opts1.zib.de:/www/Abt-Optimization/qplib
TESTDIR=test74hgfmsoui9349u4mnsd # just a cryptic string

if [ "$1" == "test" ]
then
    WWWDIR=$WWWDIR/$TESTDIR
fi

echo "setting permissions..."
chmod -R g+w html
chmod -R a+rX html

# rsync copies user file permission, better than cp
COPYFLAGS="--checksum --compress --verbose --owner --recursive --perms --executability --blocking-io"

echo "syncing qplib..."
rsync $COPYFLAGS html/* $WWWDIR/

echo "Check the updated webpage:"
if [ "$1" == "test" ]
then
    echo "http://qplib.zib.de/$TESTDIR/"
else
    echo "http://qplib.zib.de/"
fi

exit
