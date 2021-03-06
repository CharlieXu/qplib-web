$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        142       17       51       74        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        119       64       55        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        740      584      156        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52
          ,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102
          ,b103,b104,b105,b106,b107,b108,b109,b110,b111,b112,b113,b114,b115
          ,b116,b117,b118,b119;

Positive Variables  x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17
          ,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34
          ,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51
          ,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64;

Binary Variables  b65,b66,b67,b68,b69,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79
          ,b80,b81,b82,b83,b84,b85,b86,b87,b88,b89,b90,b91,b92,b93,b94,b95,b96
          ,b97,b98,b99,b100,b101,b102,b103,b104,b105,b106,b107,b108,b109,b110
          ,b111,b112,b113,b114,b115,b116,b117,b118,b119;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36
          ,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e48,e49,e50,e51,e52,e53
          ,e54,e55,e56,e57,e58,e59,e60,e61,e62,e63,e64,e65,e66,e67,e68,e69,e70
          ,e71,e72,e73,e74,e75,e76,e77,e78,e79,e80,e81,e82,e83,e84,e85,e86,e87
          ,e88,e89,e90,e91,e92,e93,e94,e95,e96,e97,e98,e99,e100,e101,e102,e103
          ,e104,e105,e106,e107,e108,e109,e110,e111,e112,e113,e114,e115,e116
          ,e117,e118,e119,e120,e121,e122,e123,e124,e125,e126,e127,e128,e129
          ,e130,e131,e132,e133,e134,e135,e136,e137,e138,e139,e140,e141,e142;


e1..  - objvar + 75.07083333*x2 + 150.1416667*x3 + 280.2644444*x4
      + 245.2313889*x5 + 55.05194444*x6 + 125.1180556*x7 + 260.2455556*x8
      + 215.2030556*x9 + 30.02833333*x10 + 115.1086111*x11 + 240.2266667*x12
      + 220.2077778*x13 + 55.05194444*x14 + 140.1322222*x15 + 245.2313889*x16
      + 245.2313889*x17 + 55.05194444*x18 + 40.03777778*x19 + 150.1416667*x20
      + 150.1416667*x21 + 40.03777778*x22 + 120.1133333*x23 + 230.2172222*x24
      + 230.2172222*x25 + 30.02833333*x26 + 60.05666667*x27 + 175.1652778*x28
      + 165.1558333*x29 + 1177.970833*x30 + 2975.275556*x31 + 1263.051111*x32
      + 1293.079444*x33 + 1182.975556*x34 + 1313.098333*x35 + 1293.079444*x36
      + 2975.275556*x37 + 3025.322778*x38 + 2995.294444*x39 + 1313.098333*x40
      + 1233.022778*x41 + 1213.003889*x42 + 1293.079444*x43 + 1202.994444*x44
      + 1213.003889*x45 + 150.1416667*x46 + 135.1275*x47 + 100.0944444*x48
      + 90.085*x49 + 40.03777778*x50 + 70.06611111*x51 + 45.0425*x52 + 9345*b65
      + 18690*b66 + 34888*b67 + 30527*b68 + 6853*b69 + 15575*b70 + 32396*b71
      + 26789*b72 + 3738*b73 + 14329*b74 + 29904*b75 + 27412*b76 + 6853*b77
      + 17444*b78 + 30527*b79 + 30527*b80 + 6853*b81 + 4984*b82 + 18690*b83
      + 18690*b84 + 4984*b85 + 14952*b86 + 28658*b87 + 28658*b88 + 3738*b89
      + 7476*b90 + 21805*b91 + 20559*b92 + 9345*b93 + 9968*b94 + 19936*b95
      + 23674*b96 + 9968*b97 + 26166*b98 + 23674*b99 + 9968*b100 + 16198*b101
      + 12460*b102 + 26166*b103 + 16198*b104 + 13706*b105 + 23674*b106
      + 12460*b107 + 13706*b108 + 18690*b109 + 16821*b110 + 12460*b111
      + 11214*b112 + 4984*b113 + 8722*b114 + 5607*b115 + 13972*b116
      + 36676*b117 + 13972*b118 + 13972*b119 =E= 0;

e2..  - x2 - x3 - x4 - x5 - x46 =L= -20;

e3..  - x6 - x7 - x8 - x9 - x47 =L= -50;

e4..  - x10 - x11 - x12 - x13 - x48 =L= -47.5;

e5..  - x14 - x15 - x16 - x17 - x49 =L= -28;

e6..  - x18 - x19 - x20 - x21 - x50 =L= -100;

e7..  - x22 - x23 - x24 - x25 - x51 =L= -30;

e8..  - x26 - x27 - x28 - x29 - x52 =L= -25;

e9..    x2 + x3 + x4 + x5 + x46 =L= 20;

e10..    x6 + x7 + x8 + x9 + x47 =L= 50;

e11..    x10 + x11 + x12 + x13 + x48 =L= 47.5;

e12..    x14 + x15 + x16 + x17 + x49 =L= 28;

e13..    x18 + x19 + x20 + x21 + x50 =L= 100;

e14..    x22 + x23 + x24 + x25 + x51 =L= 30;

e15..    x26 + x27 + x28 + x29 + x52 =L= 25;

e16..    x30 + x34 + x35 + x36 - 300.5*b116 =L= 0;

e17..    x31 + x37 + x38 + x39 - 300.5*b117 =L= 0;

e18..    x32 + x40 + x41 + x42 - 300.5*b118 =L= 0;

e19..    x33 + x43 + x44 + x45 - 300.5*b119 =L= 0;

e20..  - x30 - x31 - x32 - x33 - x46 - x47 - x48 - x49 - x50 - x51 - x52
       =L= -300.5;

e21..    x30 + x31 + x32 + x33 + x46 + x47 + x48 + x49 + x50 + x51 + x52
       =L= 300.5;

e22..    x2 + x6 + x10 + x14 + x18 + x22 + x26 - x30 - x34 - x35 - x36 + x37
       + x40 + x43 =E= 0;

e23..    x3 + x7 + x11 + x15 + x19 + x23 + x27 - x31 + x34 - x37 - x38 - x39
       + x41 + x44 =E= 0;

e24..    x4 + x8 + x12 + x16 + x20 + x24 + x28 - x32 + x35 + x38 - x40 - x41
       - x42 + x45 =E= 0;

e25..    x5 + x9 + x13 + x17 + x21 + x25 + x29 - x33 + x36 + x39 + x42 - x43
       - x44 - x45 =E= 0;

e26..    x2 - 0.2*b65 =G= 0;

e27..    x3 - 0.2*b66 =G= 0;

e28..    x4 - 0.2*b67 =G= 0;

e29..    x5 - 0.2*b68 =G= 0;

e30..    x6 - 0.2*b69 =G= 0;

e31..    x7 - 0.2*b70 =G= 0;

e32..    x8 - 0.2*b71 =G= 0;

e33..    x9 - 0.2*b72 =G= 0;

e34..    x10 - 0.2*b73 =G= 0;

e35..    x11 - 0.2*b74 =G= 0;

e36..    x12 - 0.2*b75 =G= 0;

e37..    x13 - 0.2*b76 =G= 0;

e38..    x14 - 0.2*b77 =G= 0;

e39..    x15 - 0.2*b78 =G= 0;

e40..    x16 - 0.2*b79 =G= 0;

e41..    x17 - 0.2*b80 =G= 0;

e42..    x18 - 0.2*b81 =G= 0;

e43..    x19 - 0.2*b82 =G= 0;

e44..    x20 - 0.2*b83 =G= 0;

e45..    x21 - 0.2*b84 =G= 0;

e46..    x22 - 0.2*b85 =G= 0;

e47..    x23 - 0.2*b86 =G= 0;

e48..    x24 - 0.2*b87 =G= 0;

e49..    x25 - 0.2*b88 =G= 0;

e50..    x26 - 0.2*b89 =G= 0;

e51..    x27 - 0.2*b90 =G= 0;

e52..    x28 - 0.2*b91 =G= 0;

e53..    x29 - 0.2*b92 =G= 0;

e54..    x2 - 20*b65 =L= 0;

e55..    x3 - 20*b66 =L= 0;

e56..    x4 - 20*b67 =L= 0;

e57..    x5 - 20*b68 =L= 0;

e58..    x6 - 50*b69 =L= 0;

e59..    x7 - 50*b70 =L= 0;

e60..    x8 - 50*b71 =L= 0;

e61..    x9 - 50*b72 =L= 0;

e62..    x10 - 47.5*b73 =L= 0;

e63..    x11 - 47.5*b74 =L= 0;

e64..    x12 - 47.5*b75 =L= 0;

e65..    x13 - 47.5*b76 =L= 0;

e66..    x14 - 28*b77 =L= 0;

e67..    x15 - 28*b78 =L= 0;

e68..    x16 - 28*b79 =L= 0;

e69..    x17 - 28*b80 =L= 0;

e70..    x18 - 100*b81 =L= 0;

e71..    x19 - 100*b82 =L= 0;

e72..    x20 - 100*b83 =L= 0;

e73..    x21 - 100*b84 =L= 0;

e74..    x22 - 30*b85 =L= 0;

e75..    x23 - 30*b86 =L= 0;

e76..    x24 - 30*b87 =L= 0;

e77..    x25 - 30*b88 =L= 0;

e78..    x26 - 25*b89 =L= 0;

e79..    x27 - 25*b90 =L= 0;

e80..    x28 - 25*b91 =L= 0;

e81..    x29 - 25*b92 =L= 0;

e82..    x30 - 0.2*b93 =G= 0;

e83..    x31 - 0.2*b94 =G= 0;

e84..    x32 - 0.2*b95 =G= 0;

e85..    x33 - 0.2*b96 =G= 0;

e86..    x30 - 300.5*b93 =L= 0;

e87..    x31 - 300.5*b94 =L= 0;

e88..    x32 - 300.5*b95 =L= 0;

e89..    x33 - 300.5*b96 =L= 0;

e90..    x46 - 0.2*b109 =G= 0;

e91..    x47 - 0.2*b110 =G= 0;

e92..    x48 - 0.2*b111 =G= 0;

e93..    x49 - 0.2*b112 =G= 0;

e94..    x50 - 0.2*b113 =G= 0;

e95..    x51 - 0.2*b114 =G= 0;

e96..    x52 - 0.2*b115 =G= 0;

e97..    x46 - 20*b109 =L= 0;

e98..    x47 - 50*b110 =L= 0;

e99..    x48 - 47.5*b111 =L= 0;

e100..    x49 - 28*b112 =L= 0;

e101..    x50 - 100*b113 =L= 0;

e102..    x51 - 30*b114 =L= 0;

e103..    x52 - 25*b115 =L= 0;

e104..    x37 - 0.2*b100 =G= 0;

e105..    x40 - 0.2*b103 =G= 0;

e106..    x43 - 0.2*b106 =G= 0;

e107..    x34 - 0.2*b97 =G= 0;

e108..    x41 - 0.2*b104 =G= 0;

e109..    x44 - 0.2*b107 =G= 0;

e110..    x35 - 0.2*b98 =G= 0;

e111..    x38 - 0.2*b101 =G= 0;

e112..    x45 - 0.2*b108 =G= 0;

e113..    x36 - 0.2*b99 =G= 0;

e114..    x39 - 0.2*b102 =G= 0;

e115..    x42 - 0.2*b105 =G= 0;

e116..    x37 - 300.5*b100 =L= 0;

e117..    x40 - 300.5*b103 =L= 0;

e118..    x43 - 300.5*b106 =L= 0;

e119..    x34 - 300.5*b97 =L= 0;

e120..    x41 - 300.5*b104 =L= 0;

e121..    x44 - 300.5*b107 =L= 0;

e122..    x35 - 300.5*b98 =L= 0;

e123..    x38 - 300.5*b101 =L= 0;

e124..    x45 - 300.5*b108 =L= 0;

e125..    x36 - 300.5*b99 =L= 0;

e126..    x39 - 300.5*b102 =L= 0;

e127..    x42 - 300.5*b105 =L= 0;

e128.. (-x53*x30) - x53*x34 - x53*x35 - x53*x36 + 0.01*x56*x37 + 0.01*x59*x40
        + 0.01*x62*x43 + x2 + 8*x6 + 4*x10 + 12*x14 + 5*x18 + 0.5*x22 + 10*x26
        =E= 0;

e129.. (-x54*x30) - x54*x34 - x54*x35 - x54*x36 + 0.1*x57*x37 + 0.1*x60*x40 + 
       0.1*x63*x43 + 50*x2 + 175*x6 + 8*x10 + 100*x14 + 70*x18 + 10*x22 + 5*x26
        =E= 0;

e130.. (-x55*x30) - x55*x34 - x55*x35 - x55*x36 + 0.05*x58*x37 + 0.05*x61*x40
        + 0.05*x64*x43 + 25*x2 + 100*x6 + 5*x10 + 20*x14 + 12.5*x18 + 2.5*x22
        + 7.5*x26 =E= 0;

e131.. x53*x34 - x56*x31 - x56*x37 - x56*x38 - x56*x39 + x59*x41 + x62*x44
        + 100*x3 + 800*x7 + 400*x11 + 1200*x15 + 500*x19 + 50*x23 + 1000*x27
        =E= 0;

e132.. 0.13*x54*x34 - x57*x31 - x57*x37 - x57*x38 - x57*x39 + 0.13*x60*x41 + 
       0.13*x63*x44 + 65*x3 + 227.5*x7 + 10.4*x11 + 130*x15 + 91*x19 + 13*x23
        + 6.5*x27 =E= 0;

e133.. 0.1*x55*x34 - x58*x31 - x58*x37 - x58*x38 - x58*x39 + 0.1*x61*x41 + 0.1*
       x64*x44 + 50*x3 + 200*x7 + 10*x11 + 40*x15 + 25*x19 + 5*x23 + 15*x27
        =E= 0;

e134.. 0.9*x53*x35 - x59*x32 + 0.9*x56*x38 - x59*x40 - x59*x41 - x59*x42 + 0.9*
       x62*x45 + 90*x4 + 720*x8 + 360*x12 + 1080*x16 + 450*x20 + 45*x24
        + 900*x28 =E= 0;

e135.. 0.01*x54*x35 - x60*x32 + 0.01*x57*x38 - x60*x40 - x60*x41 - x60*x42 + 
       0.01*x63*x45 + 5*x4 + 17.5*x8 + 0.8*x12 + 10*x16 + 7*x20 + x24 + 0.5*x28
        =E= 0;

e136.. x55*x35 - x61*x32 + x58*x38 - x61*x40 - x61*x41 - x61*x42 + x64*x45
        + 500*x4 + 2000*x8 + 100*x12 + 400*x16 + 250*x20 + 50*x24 + 150*x28
        =E= 0;

e137.. 0.3*x53*x36 - x62*x33 + 0.3*x56*x39 + 0.3*x59*x42 - x62*x43 - x62*x44 - 
       x62*x45 + 30*x5 + 240*x9 + 120*x13 + 360*x17 + 150*x21 + 15*x25
        + 300*x29 =E= 0;

e138.. 0.8*x54*x36 - x63*x33 + 0.8*x57*x39 + 0.8*x60*x42 - x63*x43 - x63*x44 - 
       x63*x45 + 400*x5 + 1400*x9 + 64*x13 + 800*x17 + 560*x21 + 80*x25
        + 40*x29 =E= 0;

e139.. 0.7*x55*x36 - x64*x33 + 0.7*x58*x39 + 0.7*x61*x42 - x64*x43 - x64*x44 - 
       x64*x45 + 350*x5 + 1400*x9 + 70*x13 + 280*x17 + 175*x21 + 35*x25
        + 105*x29 =E= 0;

e140.. x53*x30 - 5*x30 + x56*x31 - 5*x31 + x59*x32 - 5*x32 + x62*x33 - 5*x33
        + 95*x46 + 795*x47 + 395*x48 + 1195*x49 + 495*x50 + 45*x51 + 995*x52
        =L= 0;

e141.. x54*x30 - 5*x30 + x57*x31 - 5*x31 + x60*x32 - 5*x32 + x63*x33 - 5*x33
        + 495*x46 + 1745*x47 + 75*x48 + 995*x49 + 695*x50 + 95*x51 + 45*x52
        =L= 0;

e142.. x55*x30 - 10*x30 + x58*x31 - 10*x31 + x61*x32 - 10*x32 + x64*x33 - 10*
       x33 + 490*x46 + 1990*x47 + 90*x48 + 390*x49 + 240*x50 + 40*x51 + 140*x52
        =L= 0;

* set non-default bounds
x2.up = 20;
x3.up = 20;
x4.up = 20;
x5.up = 20;
x6.up = 50;
x7.up = 50;
x8.up = 50;
x9.up = 50;
x10.up = 47.5;
x11.up = 47.5;
x12.up = 47.5;
x13.up = 47.5;
x14.up = 28;
x15.up = 28;
x16.up = 28;
x17.up = 28;
x18.up = 100;
x19.up = 100;
x20.up = 100;
x21.up = 100;
x22.up = 30;
x23.up = 30;
x24.up = 30;
x25.up = 30;
x26.up = 25;
x27.up = 25;
x28.up = 25;
x29.up = 25;
x30.up = 300.5;
x31.up = 300.5;
x32.up = 300.5;
x33.up = 300.5;
x34.up = 300.5;
x35.up = 300.5;
x36.up = 300.5;
x37.up = 300.5;
x38.up = 300.5;
x39.up = 300.5;
x40.up = 300.5;
x41.up = 300.5;
x42.up = 300.5;
x43.up = 300.5;
x44.up = 300.5;
x45.up = 300.5;
x46.up = 20;
x47.up = 50;
x48.up = 47.5;
x49.up = 28;
x50.up = 100;
x51.up = 30;
x52.up = 25;
x53.up = 12;
x54.up = 175;
x55.up = 100;
x56.up = 1200;
x57.up = 227.5;
x58.up = 200;
x59.up = 1080;
x60.up = 17.5;
x61.up = 2000;
x62.up = 360;
x63.up = 1400;
x64.up = 1400;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
