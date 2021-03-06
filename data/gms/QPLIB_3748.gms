$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*         53       18        0       35        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*         96       21       75        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        306      261       45        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86
          ,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96;

Positive Variables  x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90
          ,x91,x92,x93,x94,x95,x96;

Binary Variables  b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36
          ,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e48,e49,e50,e51,e52,e53;


e1..  - objvar + 301.8999281*b2 + 282.0514736*b3 + 151.594045*b4
      + 114.7841859*b5 + 213.3645307*b6 + 772.6531483*b7 + 697.6762118*b8
      + 146.3063717*b9 + 390.5833939*b10 + 208.1475274*b11 + 662.8929022*b12
      + 577.4613376*b13 + 221.1004735*b14 + 425.9198267*b15 + 123.0747708*b16
      + 333.2812967*b17 + 248.3807467*b18 + 249.1629421*b19 + 164.5987992*b20
      + 280.9571711*b21 + 308.552481*b22 + 270.0596053*b23 + 104.6334836*b24
      + 79.66318986*b25 + 170.6962378*b26 + 237.7540763*b27 + 189.8629117*b28
      + 107.2175314*b29 + 131.3587153*b30 + 103.4067771*b31 + 626.4177638*b32
      + 487.1847308*b33 + 502.3005806*b34 + 506.4263525*b35 + 463.1857483*b36
      + 358.1782216*b37 + 281.6292472*b38 + 230.4203839*b39 + 251.9154331*b40
      + 209.2610889*b41 + 303.899003*b42 + 243.1974895*b43 + 237.3909659*b44
      + 57.1385835*b45 + 301.733744*b46 + 30.61237685*b47 + 21.33969484*b48
      + 278.520865*b49 + 162.1221457*b50 + 304.5088032*b51 + 252.5162062*b52
      + 178.7960296*b53 + 319.1456349*b54 + 257.7551033*b55 + 317.9968645*b56
      + 936.1711508*b57 + 887.6119637*b58 + 419.7607228*b59 + 519.9814012*b60
      + 524.6219579*b61 + 326.3704467*b62 + 119.6109274*b63 + 76.80085942*b64
      + 338.1531137*b65 + 113.1015469*b66 + 69.37623586*b67 + 313.6973235*b68
      + 116.2665854*b69 + 75.07446576*b70 + 401.4402965*b71 + 138.5995873*b72
      + 86.37682594*b73 + 456.7067237*b74 + 150.5541613*b75 + 91.68218598*b76
      + 93617.11508*x77 + 93617.11508*x78 + 93617.11508*x79 + 93617.11508*x80
      + 93617.11508*x81 =E= 0;

e2..    0.609376132*b2 + 1.180016336*b7 + 0.967493052*b12 + 1.004918785*b17
      + 0.698898063*b22 + 0.540292599*b27 + 1.460452986*b32 + 0.811980791*b37
      + 0.973180988*b42 + 0.544914116*b47 + 0.78515855*b52 + 1.312281472*b57
      - 2.008069891*x82 - 4.016139782*x83 - 6.024209674*x84 =E= 0;

e3..    0.609376132*b3 + 1.180016336*b8 + 0.967493052*b13 + 1.004918785*b18
      + 0.698898063*b23 + 0.540292599*b28 + 1.460452986*b33 + 0.811980791*b38
      + 0.973180988*b43 + 0.544914116*b48 + 0.78515855*b53 + 1.312281472*b58
      - 1.581486777*x85 - 3.162973554*x86 - 4.744460331*x87 =E= 0;

e4..    0.609376132*b4 + 1.180016336*b9 + 0.967493052*b14 + 1.004918785*b19
      + 0.698898063*b24 + 0.540292599*b29 + 1.460452986*b34 + 0.811980791*b39
      + 0.973180988*b44 + 0.544914116*b49 + 0.78515855*b54 + 1.312281472*b59
      - 1.99632469*x88 - 3.99264938*x89 - 5.988974071*x90 =E= 0;

e5..    0.609376132*b5 + 1.180016336*b10 + 0.967493052*b15 + 1.004918785*b20
      + 0.698898063*b25 + 0.540292599*b30 + 1.460452986*b35 + 0.811980791*b40
      + 0.973180988*b45 + 0.544914116*b50 + 0.78515855*b55 + 1.312281472*b60
      - 2.065052076*x91 - 4.130104152*x92 - 6.195156228*x93 =E= 0;

e6..    0.609376132*b6 + 1.180016336*b11 + 0.967493052*b16 + 1.004918785*b21
      + 0.698898063*b26 + 0.540292599*b31 + 1.460452986*b36 + 0.811980791*b41
      + 0.973180988*b46 + 0.544914116*b51 + 0.78515855*b56 + 1.312281472*b61
      - 2.044984424*x94 - 4.089968848*x95 - 6.134953271*x96 =E= 0;

e7..    b2 + b3 + b4 + b5 + b6 =E= 1;

e8..    b7 + b8 + b9 + b10 + b11 =E= 1;

e9..    b12 + b13 + b14 + b15 + b16 =E= 1;

e10..    b17 + b18 + b19 + b20 + b21 =E= 1;

e11..    b22 + b23 + b24 + b25 + b26 =E= 1;

e12..    b27 + b28 + b29 + b30 + b31 =E= 1;

e13..    b32 + b33 + b34 + b35 + b36 =E= 1;

e14..    b37 + b38 + b39 + b40 + b41 =E= 1;

e15..    b42 + b43 + b44 + b45 + b46 =E= 1;

e16..    b47 + b48 + b49 + b50 + b51 =E= 1;

e17..    b52 + b53 + b54 + b55 + b56 =E= 1;

e18..    b57 + b58 + b59 + b60 + b61 =E= 1;

e19..    b62 + b63 + b64 =L= 1;

e20..    b65 + b66 + b67 =L= 1;

e21..    b68 + b69 + b70 =L= 1;

e22..    b71 + b72 + b73 =L= 1;

e23..    b74 + b75 + b76 =L= 1;

e24..  - b62 + x82 =L= 0;

e25..  - b63 + x83 =L= 0;

e26..  - b64 + x84 =L= 0;

e27..  - b65 + x85 =L= 0;

e28..  - b66 + x86 =L= 0;

e29..  - b67 + x87 =L= 0;

e30..  - b68 + x88 =L= 0;

e31..  - b69 + x89 =L= 0;

e32..  - b70 + x90 =L= 0;

e33..  - b71 + x91 =L= 0;

e34..  - b72 + x92 =L= 0;

e35..  - b73 + x93 =L= 0;

e36..  - b74 + x94 =L= 0;

e37..  - b75 + x95 =L= 0;

e38..  - b76 + x96 =L= 0;

e39.. x82*b62 - x77*b62 + x82*x77 =L= 0;

e40.. x83*b63 - x77*b63 + x83*x77 =L= 0;

e41.. x84*b64 - x77*b64 + x84*x77 =L= 0;

e42.. x85*b65 - x78*b65 + x85*x78 =L= 0;

e43.. x86*b66 - x78*b66 + x86*x78 =L= 0;

e44.. x87*b67 - x78*b67 + x87*x78 =L= 0;

e45.. x88*b68 - x79*b68 + x88*x79 =L= 0;

e46.. x89*b69 - x79*b69 + x89*x79 =L= 0;

e47.. x90*b70 - x79*b70 + x90*x79 =L= 0;

e48.. x91*b71 - x80*b71 + x91*x80 =L= 0;

e49.. x92*b72 - x80*b72 + x92*x80 =L= 0;

e50.. x93*b73 - x80*b73 + x93*x80 =L= 0;

e51.. x94*b74 - x81*b74 + x94*x81 =L= 0;

e52.. x95*b75 - x81*b75 + x95*x81 =L= 0;

e53.. x96*b76 - x81*b76 + x96*x81 =L= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
