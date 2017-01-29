#!/usr/bin/env bash

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR ; pwd`

DOMOD=0
DONL=0
DOOSIL=0
DOLP=1
DOPYOMO=0
DOQPLIB=1

DATADIR="$SCRIPTDIR/../data"
BINDIR="$SCRIPTDIR/../bin"
GMSDIR="$DATADIR/gms"
METADIR="$DATADIR/meta"
MODDIR="$DATADIR/mod"
NLDIR="$DATADIR/nl"
OSILDIR="$DATADIR/osil"
LPDIR="$DATADIR/lp"
PYOMODIR="$DATADIR/pyomo"
QPLIBDIR="$DATADIR/qplib"

AMPL=$SCRIPTDIR/../ampl

[ $DOMOD == 1 ] && mkdir -p $MODDIR
[ $DONL == 1 ] && mkdir -p $NLDIR
[ $DOOSIL == 1 ] && mkdir -p $OSILDIR
[ $DOLP == 1 ] && mkdir -p $LPDIR
[ $DOPYOMO == 1 ] && mkdir -p $PYOMODIR
[ $DOQPLIB == 1 ] && mkdir -p $QPLIBDIR

for i in $GMSDIR/*.gms ; do

iname=`basename $i .gms`

modfile="${MODDIR}/${iname}.mod"

if [ $DOMOD == 1 -a ! -e $modfile ]; then

  echo "Converting $iname to AMPL .mod"

  echo "ampl $modfile" > convert.o42

  # convert to .mod file
  $SCRIPTDIR/../gams/gams $i optfile=42 output=convert.lst lo=2 logfile=convert.log pf4=0 limcol=0 limrow=0 pc=2 LP=CONVERT RMIP=CONVERT QCP=CONVERT RMIQCP=CONVERT NLP=CONVERT DNLP=CONVERT RMINLP=CONVERT CNS=CONVERT MIP=CONVERT MIQCP=CONVERT MINLP=CONVERT MCP=CONVERT MPEC=CONVERT RMPEC=CONVERT

  # check for unsupported operands
  if grep -q -E "(errorf)|(SignPower)|(Gamma)|(Centropy)" $modfile ; then
    echo "  AMPL: Unsupported function"
    rm $modfile
  fi
fi

nlfile="${NLDIR}/${iname}.nl"

if [ $DONL == 1 -a -x $AMPL -a -e $modfile -a ! -e $nlfile ] ; then
  echo "Converting $iname to AMPL .nl"
 
  # for instances with large expressions, AMPL needs a bigger stacksize
  ulimit -s 100000
  echo "model $modfile; option auxfiles rowcol; write; quit;" | $AMPL -P -ob${nlfile/.nl/}
fi

osilfile="${OSILDIR}/${iname}.osil"

if [ $DOOSIL == 1 -a ! -e $osilfile ]; then

  echo "Converting $iname to OSiL"

  echo "osil $osilfile" > convert.o42

  # convert to .osil file
#  $SCRIPTDIR/../gams/gams $i optfile=42 output=convert.lst lo=2 logfile=convert.log pf4=0 limcol=0 limrow=0 pc=2 LP=CONVERT RMIP=CONVERT QCP=CONVERT RMIQCP=CONVERT NLP=CONVERT DNLP=CONVERT RMINLP=CONVERT CNS=CONVERT MIP=CONVERT MIQCP=CONVERT MINLP=CONVERT MCP=CONVERT MPEC=CONVERT RMPEC=CONVERT

  if test x`grep -m 1 "SOLVER STATUS" convert.lst | awk '{print $4}'` != x1 ; then
    echo "  OSiL: Capability problem"
    rm -f $osilfile
  fi
  
  if test -e $osilfile && ! test -s $osilfile; then
    echo "  Created file has length 0. OS crashed?"
    rm $osilfile
  fi
  
  # pretty print XML file
  #if test -e $osilfile && which xml_pp > /dev/null ; then
  #   xml_pp -i $osilfile
  #fi
fi

pyfile="${PYOMODIR}/${iname}.py"

if [ $DOPYOMO == 1 -a ! -e $pyfile ]; then
  echo "Converting $iname to PYOMO .py"

  echo "pyomo $pyfile" > convert.o42
  $SCRIPTDIR/../gams/gams $i optfile=42 output=convert.lst lo=2 logfile=convert.log pf4=0 limcol=0 limrow=0 pc=2 LP=CONVERT RMIP=CONVERT QCP=CONVERT RMIQCP=CONVERT NLP=CONVERT DNLP=CONVERT RMINLP=CONVERT CNS=CONVERT MIP=CONVERT MIQCP=CONVERT MINLP=CONVERT MCP=CONVERT MPEC=CONVERT RMPEC=CONVERT
fi

lpfile="${LPDIR}/${iname}.lp"

if [ $DOLP == 1 -a ! -e $lpfile ]; then

    echo "Converting $iname to .lp"

    # convert to .lp file
    $BINDIR/convert $i $lpfile
fi

qplibfile="${QPLIBDIR}/${iname}.qplib"

if [ $DOQPLIB == 1 -a ! -e $qplibfile ]; then

    echo "Converting $iname to .qplib"

    # convert to .qplib file
    $BINDIR/convert $i $qplibfile
fi

done

rm -f convert.o42 convert.log convert.lst os.273 osil.log 
