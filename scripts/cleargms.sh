#!/bin/sh

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR ; pwd`
DATADIR="$SCRIPTDIR/../data"
GMSDIR="$DATADIR/gms"

for f in ${GMSDIR}/*.gms ; do

echo "Processing `basename $f`"
if ${SCRIPTDIR}/gms2gms.py $f ${f}_clean ; then
  mv ${f}_clean $f
else
  echo "FAILED"
  rm -f ${f}_clean
fi

done

