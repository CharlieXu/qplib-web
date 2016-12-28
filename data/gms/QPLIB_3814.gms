$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*         42       40        0        2        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*         49       47        2        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        181       71      110        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,b8,b9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49;

Positive Variables  x2,x3,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22
          ,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39
          ,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49;

Binary Variables  b8,b9;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36
          ,e37,e38,e39,e40,e41,e42;


e1.. 0.0093514*x2*x4 - 0.0139904*x2 + 0.0077308*x2*x5 - 0.0005719*x2*x16 + 
     0.0042656*x2*x17 + 0.0338147*x3*x6 - 0.0661588*x3 + 0.0373349*x3*x7 + 
     0.0016371*x3*x18 + 0.0288996*x3*x19 - objvar + 0.23947*b8 + 0.75835*b9
      =E= 0;

e2..    x20 + x21 + x22 + x23 =E= 300;

e3..    x24 - x25 - x26 =E= 0;

e4..    x27 - x28 - x29 - x30 =E= 0;

e5..    x31 - x32 - x33 - x34 =E= 0;

e6..    x35 - x36 - x37 =E= 0;

e7..    x38 + x39 =E= 1;

e8..    x40 + x41 + x42 =E= 1;

e9..    x43 + x44 + x45 =E= 1;

e10..    x46 + x47 =E= 1;

e11..    x16 + x17 + x48 =E= 1;

e12..    x18 + x19 + x49 =E= 1;

e13..    x2 - 300*b8 =L= 0;

e14..    x3 - 300*b9 =L= 0;

e15.. -x43*x32 + x10 - 0.3333333333*x20 =E= 0;

e16.. -x44*x32 + x11 - 0.3333333333*x20 =E= 0;

e17.. -x45*x32 + x12 - 0.3333333333*x20 =E= 0;

e18.. -x40*x28 + x13 - 0.3333333333*x21 =E= 0;

e19.. -x41*x28 + x14 - 0.3333333333*x21 =E= 0;

e20.. -x42*x28 + x15 - 0.3333333333*x21 =E= 0;

e21.. (-x38*x24) - x40*x27 + x10 =E= 0;

e22.. (-x39*x24) - x41*x27 + x11 =E= 0;

e23.. -x42*x27 + x12 =E= 0;

e24.. -x43*x31 + x13 =E= 0;

e25.. (-x44*x31) - x46*x35 + x14 =E= 0;

e26.. (-x45*x31) - x47*x35 + x15 =E= 0;

e27.. x38*x25 + x40*x29 + x43*x33 + 0.3333333333*x22 =E= 80;

e28.. x39*x25 + x41*x29 + x44*x33 + x46*x36 + 0.3333333333*x22 =E= 30;

e29.. x42*x29 + x45*x33 + x47*x36 + 0.3333333333*x22 =E= 20;

e30.. x38*x26 + x40*x30 + x43*x34 + 0.3333333333*x23 =E= 20;

e31.. x39*x26 + x41*x30 + x44*x34 + x46*x37 + 0.3333333333*x23 =E= 70;

e32.. x42*x30 + x45*x34 + x47*x37 + 0.3333333333*x23 =E= 80;

e33.. x16*x2 - x10 =E= 0;

e34.. x17*x2 - x11 =E= 0;

e35.. x48*x2 - x12 =E= 0;

e36.. x18*x3 - x13 =E= 0;

e37.. x19*x3 - x14 =E= 0;

e38.. x49*x3 - x15 =E= 0;

e39.. x10*x4 - x38*x24 =E= 0;

e40.. x11*x5 - x41*x27 =E= 0;

e41.. x14*x6 - x44*x31 =E= 0;

e42.. x15*x7 - x47*x35 =E= 0;

* set non-default bounds
x2.up = 300;
x3.up = 300;
x4.lo = 0.85; x4.up = 1;
x5.lo = 0.85; x5.up = 1;
x6.lo = 0.85; x6.up = 1;
x7.lo = 0.85; x7.up = 1;
x10.up = 100;
x11.up = 100;
x12.up = 100;
x13.up = 100;
x14.up = 100;
x15.up = 100;
x16.up = 1;
x17.up = 1;
x18.up = 1;
x19.up = 1;
x20.up = 300;
x21.up = 300;
x24.up = 300;
x25.up = 300;
x26.up = 300;
x27.up = 300;
x28.up = 300;
x29.up = 300;
x30.up = 300;
x31.up = 300;
x32.up = 300;
x33.up = 300;
x34.up = 300;
x35.up = 300;
x36.up = 300;
x37.up = 300;
x38.up = 1;
x39.up = 1;
x40.up = 1;
x41.up = 1;
x42.up = 1;
x43.up = 1;
x44.up = 1;
x45.up = 1;
x46.up = 1;
x47.up = 1;
x48.up = 1;
x49.up = 1;

* set non-default levels
x4.l = 0.85;
x5.l = 0.85;
x6.l = 0.85;
x7.l = 0.85;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
