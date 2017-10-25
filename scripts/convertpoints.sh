#!/bin/sh

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR ; pwd`

DATADIR="$SCRIPTDIR/../data"
GDXDIR="$DATADIR/gdx"
SOLDIR="$DATADIR/sol"

mkdir -p $SOLDIR

for i in $GDXDIR/*.gdx ; do

pointname=`basename $i .gdx`
echo $pointname

solfile=$SOLDIR/${pointname}.sol

if test ! -e $solfile ; then

  # convert to .sol file
  $SCRIPTDIR/../gams/gdxdump $i Format=gamsbas \
    | awk '
      /.L  = / { 
         gsub(".L", "", $1);
         printf("%-10s %40.15f\n", $1, $3);
      }
      /.L \(.[0-9]+.\) = / {
         gsub(".L", "", $1);
         match($2, "([0-9]+)", a);
         varname = sprintf("%s(%s)", $1, a[1]);
         printf("%-10s %40.15f\n", varname, $4);
      }
      { next; }' \
    > $solfile
fi

done
