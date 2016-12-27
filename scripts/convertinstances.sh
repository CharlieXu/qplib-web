#!/bin/sh

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR ; pwd`

DATADIR="$SCRIPTDIR/../data"
BINDIR="$SCRIPTDIR/../bin"
GMSDIR="$DATADIR/gms"
MODDIR="$DATADIR/mod"
NLDIR="$DATADIR/nl"
OSILDIR="$DATADIR/osil"
LPDIR="$DATADIR/lp"
METADIR="$DATADIR/meta"
PYOMODIR="$DATADIR/pyomo"

AMPL=$SCRIPTDIR/../ampl

mkdir -p $MODDIR
mkdir -p $NLDIR
mkdir -p $OSILDIR
mkdir -p $LPDIR
#mkdir -p $PYOMODIR

for i in $GMSDIR/*.gms ; do

iname=`basename $i .gms`

modfile="${MODDIR}/${iname}.mod"

if test ! -e $modfile ; then

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

# for instances with large expressions, AMPL needs a bigger stacksize
ulimit -s 100000
if [ -x $AMPL -a -e $modfile -a ! -e $nlfile ] ; then
  echo "Converting $iname to AMPL .nl"
 
  echo "model $modfile; option auxfiles rowcol; write; quit;" | $AMPL -P -ob${nlfile/.nl/}
fi

osilfile="${OSILDIR}/${iname}.osil"

if test ! -e $osilfile ; then

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

#pyfile="${PYOMODIR}/${iname}.py"
#
#if test ! -e $pyfile ; then
#  echo "Converting $iname to PYOMO .py"
#
#  echo "pyomo $pyfile" > convert.o42
#  $SCRIPTDIR/../gams/gams $i optfile=42 output=convert.lst lo=2 logfile=convert.log pf4=0 limcol=0 limrow=0 pc=2 LP=CONVERT RMIP=CONVERT QCP=CONVERT RMIQCP=CONVERT NLP=CONVERT DNLP=CONVERT RMINLP=CONVERT CNS=CONVERT MIP=CONVERT MIQCP=CONVERT MINLP=CONVERT MCP=CONVERT MPEC=CONVERT RMPEC=CONVERT
#fi

lpfile="${LPDIR}/${iname}.lp"

if test ! -e $lpfile ; then

    echo "Converting $iname to .lp"

    # convert to .lp file
    $BINDIR/convert $i $lpfile
fi

done

rm -f convert.o42 convert.log convert.lst os.273 osil.log 

# fct uses mod() with non-integer divisor, which isn't supported by AMPL
rm -f ${MODDIR}/fct.mod
