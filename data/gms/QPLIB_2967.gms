$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        192        2        0      190        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*         39       39        0        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        763        3      760        0
*
*  Solve m using QCP maximizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36
          ,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e48,e49,e50,e51,e52,e53
          ,e54,e55,e56,e57,e58,e59,e60,e61,e62,e63,e64,e65,e66,e67,e68,e69,e70
          ,e71,e72,e73,e74,e75,e76,e77,e78,e79,e80,e81,e82,e83,e84,e85,e86,e87
          ,e88,e89,e90,e91,e92,e93,e94,e95,e96,e97,e98,e99,e100,e101,e102,e103
          ,e104,e105,e106,e107,e108,e109,e110,e111,e112,e113,e114,e115,e116
          ,e117,e118,e119,e120,e121,e122,e123,e124,e125,e126,e127,e128,e129
          ,e130,e131,e132,e133,e134,e135,e136,e137,e138,e139,e140,e141,e142
          ,e143,e144,e145,e146,e147,e148,e149,e150,e151,e152,e153,e154,e155
          ,e156,e157,e158,e159,e160,e161,e162,e163,e164,e165,e166,e167,e168
          ,e169,e170,e171,e172,e173,e174,e175,e176,e177,e178,e179,e180,e181
          ,e182,e183,e184,e185,e186,e187,e188,e189,e190,e191,e192;


e1.. 0.25*x19 - 0.5*x2*x19 + 0.5*x2*x21 - 0.5*x3*x20 + 0.5*x3*x22 - 0.5*x4*x21
      + 0.5*x4*x23 - 0.5*x5*x22 + 0.5*x5*x24 - 0.5*x6*x23 + 0.5*x6*x25 - 0.5*x7
     *x24 + 0.5*x7*x26 - 0.5*x8*x25 + 0.5*x8*x27 - 0.5*x9*x26 + 0.5*x9*x28 - 
     0.5*x10*x27 + 0.5*x10*x29 - 0.5*x11*x28 + 0.5*x11*x30 - 0.5*x12*x29 + 0.5*
     x12*x31 - 0.5*x13*x30 + 0.5*x13*x32 - 0.5*x14*x31 + 0.5*x14*x33 - 0.5*x15*
     x32 + 0.5*x15*x34 - 0.5*x16*x33 + 0.5*x16*x35 - 0.5*x17*x34 + 0.5*x17*x36
      - 0.5*x18*x35 + 0.5*x18*x37 - 0.25*x37 + 0.5*x20*x38 - 0.5*x36*x39
      - objvar =E= 0;

e2..    x38 - x39 =E= 0;

e3.. x19*x19 + x38*x38 - x38 =L= 3.75;

e4.. x2*x2 - x2 + x20*x20 =L= 3.75;

e5.. x3*x3 - x3 + x21*x21 =L= 3.75;

e6.. x4*x4 - x4 + x22*x22 =L= 3.75;

e7.. x5*x5 - x5 + x23*x23 =L= 3.75;

e8.. x6*x6 - x6 + x24*x24 =L= 3.75;

e9.. x7*x7 - x7 + x25*x25 =L= 3.75;

e10.. x8*x8 - x8 + x26*x26 =L= 3.75;

e11.. x9*x9 - x9 + x27*x27 =L= 3.75;

e12.. x10*x10 - x10 + x28*x28 =L= 3.75;

e13.. x11*x11 - x11 + x29*x29 =L= 3.75;

e14.. x12*x12 - x12 + x30*x30 =L= 3.75;

e15.. x13*x13 - x13 + x31*x31 =L= 3.75;

e16.. x14*x14 - x14 + x32*x32 =L= 3.75;

e17.. x15*x15 - x15 + x33*x33 =L= 3.75;

e18.. x16*x16 - x16 + x34*x34 =L= 3.75;

e19.. x17*x17 - x17 + x35*x35 =L= 3.75;

e20.. x18*x18 - x18 + x36*x36 =L= 3.75;

e21.. x37*x37 + x39*x39 - x39 =L= 3.75;

e22.. x2*x2 - 2*x38*x2 + x19*x19 - 2*x20*x19 + x20*x20 + x38*x38 =L= 4;

e23.. x3*x3 - 2*x38*x3 + x19*x19 - 2*x21*x19 + x21*x21 + x38*x38 =L= 4;

e24.. x4*x4 - 2*x38*x4 + x19*x19 - 2*x22*x19 + x22*x22 + x38*x38 =L= 4;

e25.. x5*x5 - 2*x38*x5 + x19*x19 - 2*x23*x19 + x23*x23 + x38*x38 =L= 4;

e26.. x6*x6 - 2*x38*x6 + x19*x19 - 2*x24*x19 + x24*x24 + x38*x38 =L= 4;

e27.. x7*x7 - 2*x38*x7 + x19*x19 - 2*x25*x19 + x25*x25 + x38*x38 =L= 4;

e28.. x8*x8 - 2*x38*x8 + x19*x19 - 2*x26*x19 + x26*x26 + x38*x38 =L= 4;

e29.. x9*x9 - 2*x38*x9 + x19*x19 - 2*x27*x19 + x27*x27 + x38*x38 =L= 4;

e30.. x10*x10 - 2*x38*x10 + x19*x19 - 2*x28*x19 + x28*x28 + x38*x38 =L= 4;

e31.. x11*x11 - 2*x38*x11 + x19*x19 - 2*x29*x19 + x29*x29 + x38*x38 =L= 4;

e32.. x12*x12 - 2*x38*x12 + x19*x19 - 2*x30*x19 + x30*x30 + x38*x38 =L= 4;

e33.. x13*x13 - 2*x38*x13 + x19*x19 - 2*x31*x19 + x31*x31 + x38*x38 =L= 4;

e34.. x14*x14 - 2*x38*x14 + x19*x19 - 2*x32*x19 + x32*x32 + x38*x38 =L= 4;

e35.. x15*x15 - 2*x38*x15 + x19*x19 - 2*x33*x19 + x33*x33 + x38*x38 =L= 4;

e36.. x16*x16 - 2*x38*x16 + x19*x19 - 2*x34*x19 + x34*x34 + x38*x38 =L= 4;

e37.. x17*x17 - 2*x38*x17 + x19*x19 - 2*x35*x19 + x35*x35 + x38*x38 =L= 4;

e38.. x18*x18 - 2*x38*x18 + x19*x19 - 2*x36*x19 + x36*x36 + x38*x38 =L= 4;

e39.. x19*x19 - 2*x37*x19 + x37*x37 + x38*x38 - 2*x39*x38 + x39*x39 =L= 4;

e40.. x2*x2 - 2*x3*x2 + x3*x3 + x20*x20 - 2*x21*x20 + x21*x21 =L= 4;

e41.. x2*x2 - 2*x4*x2 + x4*x4 + x20*x20 - 2*x22*x20 + x22*x22 =L= 4;

e42.. x2*x2 - 2*x5*x2 + x5*x5 + x20*x20 - 2*x23*x20 + x23*x23 =L= 4;

e43.. x2*x2 - 2*x6*x2 + x6*x6 + x20*x20 - 2*x24*x20 + x24*x24 =L= 4;

e44.. x2*x2 - 2*x7*x2 + x7*x7 + x20*x20 - 2*x25*x20 + x25*x25 =L= 4;

e45.. x2*x2 - 2*x8*x2 + x8*x8 + x20*x20 - 2*x26*x20 + x26*x26 =L= 4;

e46.. x2*x2 - 2*x9*x2 + x9*x9 + x20*x20 - 2*x27*x20 + x27*x27 =L= 4;

e47.. x2*x2 - 2*x10*x2 + x10*x10 + x20*x20 - 2*x28*x20 + x28*x28 =L= 4;

e48.. x2*x2 - 2*x11*x2 + x11*x11 + x20*x20 - 2*x29*x20 + x29*x29 =L= 4;

e49.. x2*x2 - 2*x12*x2 + x12*x12 + x20*x20 - 2*x30*x20 + x30*x30 =L= 4;

e50.. x2*x2 - 2*x13*x2 + x13*x13 + x20*x20 - 2*x31*x20 + x31*x31 =L= 4;

e51.. x2*x2 - 2*x14*x2 + x14*x14 + x20*x20 - 2*x32*x20 + x32*x32 =L= 4;

e52.. x2*x2 - 2*x15*x2 + x15*x15 + x20*x20 - 2*x33*x20 + x33*x33 =L= 4;

e53.. x2*x2 - 2*x16*x2 + x16*x16 + x20*x20 - 2*x34*x20 + x34*x34 =L= 4;

e54.. x2*x2 - 2*x17*x2 + x17*x17 + x20*x20 - 2*x35*x20 + x35*x35 =L= 4;

e55.. x2*x2 - 2*x18*x2 + x18*x18 + x20*x20 - 2*x36*x20 + x36*x36 =L= 4;

e56.. x2*x2 - 2*x39*x2 + x20*x20 - 2*x37*x20 + x37*x37 + x39*x39 =L= 4;

e57.. x3*x3 - 2*x4*x3 + x4*x4 + x21*x21 - 2*x22*x21 + x22*x22 =L= 4;

e58.. x3*x3 - 2*x5*x3 + x5*x5 + x21*x21 - 2*x23*x21 + x23*x23 =L= 4;

e59.. x3*x3 - 2*x6*x3 + x6*x6 + x21*x21 - 2*x24*x21 + x24*x24 =L= 4;

e60.. x3*x3 - 2*x7*x3 + x7*x7 + x21*x21 - 2*x25*x21 + x25*x25 =L= 4;

e61.. x3*x3 - 2*x8*x3 + x8*x8 + x21*x21 - 2*x26*x21 + x26*x26 =L= 4;

e62.. x3*x3 - 2*x9*x3 + x9*x9 + x21*x21 - 2*x27*x21 + x27*x27 =L= 4;

e63.. x3*x3 - 2*x10*x3 + x10*x10 + x21*x21 - 2*x28*x21 + x28*x28 =L= 4;

e64.. x3*x3 - 2*x11*x3 + x11*x11 + x21*x21 - 2*x29*x21 + x29*x29 =L= 4;

e65.. x3*x3 - 2*x12*x3 + x12*x12 + x21*x21 - 2*x30*x21 + x30*x30 =L= 4;

e66.. x3*x3 - 2*x13*x3 + x13*x13 + x21*x21 - 2*x31*x21 + x31*x31 =L= 4;

e67.. x3*x3 - 2*x14*x3 + x14*x14 + x21*x21 - 2*x32*x21 + x32*x32 =L= 4;

e68.. x3*x3 - 2*x15*x3 + x15*x15 + x21*x21 - 2*x33*x21 + x33*x33 =L= 4;

e69.. x3*x3 - 2*x16*x3 + x16*x16 + x21*x21 - 2*x34*x21 + x34*x34 =L= 4;

e70.. x3*x3 - 2*x17*x3 + x17*x17 + x21*x21 - 2*x35*x21 + x35*x35 =L= 4;

e71.. x3*x3 - 2*x18*x3 + x18*x18 + x21*x21 - 2*x36*x21 + x36*x36 =L= 4;

e72.. x3*x3 - 2*x39*x3 + x21*x21 - 2*x37*x21 + x37*x37 + x39*x39 =L= 4;

e73.. x4*x4 - 2*x5*x4 + x5*x5 + x22*x22 - 2*x23*x22 + x23*x23 =L= 4;

e74.. x4*x4 - 2*x6*x4 + x6*x6 + x22*x22 - 2*x24*x22 + x24*x24 =L= 4;

e75.. x4*x4 - 2*x7*x4 + x7*x7 + x22*x22 - 2*x25*x22 + x25*x25 =L= 4;

e76.. x4*x4 - 2*x8*x4 + x8*x8 + x22*x22 - 2*x26*x22 + x26*x26 =L= 4;

e77.. x4*x4 - 2*x9*x4 + x9*x9 + x22*x22 - 2*x27*x22 + x27*x27 =L= 4;

e78.. x4*x4 - 2*x10*x4 + x10*x10 + x22*x22 - 2*x28*x22 + x28*x28 =L= 4;

e79.. x4*x4 - 2*x11*x4 + x11*x11 + x22*x22 - 2*x29*x22 + x29*x29 =L= 4;

e80.. x4*x4 - 2*x12*x4 + x12*x12 + x22*x22 - 2*x30*x22 + x30*x30 =L= 4;

e81.. x4*x4 - 2*x13*x4 + x13*x13 + x22*x22 - 2*x31*x22 + x31*x31 =L= 4;

e82.. x4*x4 - 2*x14*x4 + x14*x14 + x22*x22 - 2*x32*x22 + x32*x32 =L= 4;

e83.. x4*x4 - 2*x15*x4 + x15*x15 + x22*x22 - 2*x33*x22 + x33*x33 =L= 4;

e84.. x4*x4 - 2*x16*x4 + x16*x16 + x22*x22 - 2*x34*x22 + x34*x34 =L= 4;

e85.. x4*x4 - 2*x17*x4 + x17*x17 + x22*x22 - 2*x35*x22 + x35*x35 =L= 4;

e86.. x4*x4 - 2*x18*x4 + x18*x18 + x22*x22 - 2*x36*x22 + x36*x36 =L= 4;

e87.. x4*x4 - 2*x39*x4 + x22*x22 - 2*x37*x22 + x37*x37 + x39*x39 =L= 4;

e88.. x5*x5 - 2*x6*x5 + x6*x6 + x23*x23 - 2*x24*x23 + x24*x24 =L= 4;

e89.. x5*x5 - 2*x7*x5 + x7*x7 + x23*x23 - 2*x25*x23 + x25*x25 =L= 4;

e90.. x5*x5 - 2*x8*x5 + x8*x8 + x23*x23 - 2*x26*x23 + x26*x26 =L= 4;

e91.. x5*x5 - 2*x9*x5 + x9*x9 + x23*x23 - 2*x27*x23 + x27*x27 =L= 4;

e92.. x5*x5 - 2*x10*x5 + x10*x10 + x23*x23 - 2*x28*x23 + x28*x28 =L= 4;

e93.. x5*x5 - 2*x11*x5 + x11*x11 + x23*x23 - 2*x29*x23 + x29*x29 =L= 4;

e94.. x5*x5 - 2*x12*x5 + x12*x12 + x23*x23 - 2*x30*x23 + x30*x30 =L= 4;

e95.. x5*x5 - 2*x13*x5 + x13*x13 + x23*x23 - 2*x31*x23 + x31*x31 =L= 4;

e96.. x5*x5 - 2*x14*x5 + x14*x14 + x23*x23 - 2*x32*x23 + x32*x32 =L= 4;

e97.. x5*x5 - 2*x15*x5 + x15*x15 + x23*x23 - 2*x33*x23 + x33*x33 =L= 4;

e98.. x5*x5 - 2*x16*x5 + x16*x16 + x23*x23 - 2*x34*x23 + x34*x34 =L= 4;

e99.. x5*x5 - 2*x17*x5 + x17*x17 + x23*x23 - 2*x35*x23 + x35*x35 =L= 4;

e100.. x5*x5 - 2*x18*x5 + x18*x18 + x23*x23 - 2*x36*x23 + x36*x36 =L= 4;

e101.. x5*x5 - 2*x39*x5 + x23*x23 - 2*x37*x23 + x37*x37 + x39*x39 =L= 4;

e102.. x6*x6 - 2*x7*x6 + x7*x7 + x24*x24 - 2*x25*x24 + x25*x25 =L= 4;

e103.. x6*x6 - 2*x8*x6 + x8*x8 + x24*x24 - 2*x26*x24 + x26*x26 =L= 4;

e104.. x6*x6 - 2*x9*x6 + x9*x9 + x24*x24 - 2*x27*x24 + x27*x27 =L= 4;

e105.. x6*x6 - 2*x10*x6 + x10*x10 + x24*x24 - 2*x28*x24 + x28*x28 =L= 4;

e106.. x6*x6 - 2*x11*x6 + x11*x11 + x24*x24 - 2*x29*x24 + x29*x29 =L= 4;

e107.. x6*x6 - 2*x12*x6 + x12*x12 + x24*x24 - 2*x30*x24 + x30*x30 =L= 4;

e108.. x6*x6 - 2*x13*x6 + x13*x13 + x24*x24 - 2*x31*x24 + x31*x31 =L= 4;

e109.. x6*x6 - 2*x14*x6 + x14*x14 + x24*x24 - 2*x32*x24 + x32*x32 =L= 4;

e110.. x6*x6 - 2*x15*x6 + x15*x15 + x24*x24 - 2*x33*x24 + x33*x33 =L= 4;

e111.. x6*x6 - 2*x16*x6 + x16*x16 + x24*x24 - 2*x34*x24 + x34*x34 =L= 4;

e112.. x6*x6 - 2*x17*x6 + x17*x17 + x24*x24 - 2*x35*x24 + x35*x35 =L= 4;

e113.. x6*x6 - 2*x18*x6 + x18*x18 + x24*x24 - 2*x36*x24 + x36*x36 =L= 4;

e114.. x6*x6 - 2*x39*x6 + x24*x24 - 2*x37*x24 + x37*x37 + x39*x39 =L= 4;

e115.. x7*x7 - 2*x8*x7 + x8*x8 + x25*x25 - 2*x26*x25 + x26*x26 =L= 4;

e116.. x7*x7 - 2*x9*x7 + x9*x9 + x25*x25 - 2*x27*x25 + x27*x27 =L= 4;

e117.. x7*x7 - 2*x10*x7 + x10*x10 + x25*x25 - 2*x28*x25 + x28*x28 =L= 4;

e118.. x7*x7 - 2*x11*x7 + x11*x11 + x25*x25 - 2*x29*x25 + x29*x29 =L= 4;

e119.. x7*x7 - 2*x12*x7 + x12*x12 + x25*x25 - 2*x30*x25 + x30*x30 =L= 4;

e120.. x7*x7 - 2*x13*x7 + x13*x13 + x25*x25 - 2*x31*x25 + x31*x31 =L= 4;

e121.. x7*x7 - 2*x14*x7 + x14*x14 + x25*x25 - 2*x32*x25 + x32*x32 =L= 4;

e122.. x7*x7 - 2*x15*x7 + x15*x15 + x25*x25 - 2*x33*x25 + x33*x33 =L= 4;

e123.. x7*x7 - 2*x16*x7 + x16*x16 + x25*x25 - 2*x34*x25 + x34*x34 =L= 4;

e124.. x7*x7 - 2*x17*x7 + x17*x17 + x25*x25 - 2*x35*x25 + x35*x35 =L= 4;

e125.. x7*x7 - 2*x18*x7 + x18*x18 + x25*x25 - 2*x36*x25 + x36*x36 =L= 4;

e126.. x7*x7 - 2*x39*x7 + x25*x25 - 2*x37*x25 + x37*x37 + x39*x39 =L= 4;

e127.. x8*x8 - 2*x9*x8 + x9*x9 + x26*x26 - 2*x27*x26 + x27*x27 =L= 4;

e128.. x8*x8 - 2*x10*x8 + x10*x10 + x26*x26 - 2*x28*x26 + x28*x28 =L= 4;

e129.. x8*x8 - 2*x11*x8 + x11*x11 + x26*x26 - 2*x29*x26 + x29*x29 =L= 4;

e130.. x8*x8 - 2*x12*x8 + x12*x12 + x26*x26 - 2*x30*x26 + x30*x30 =L= 4;

e131.. x8*x8 - 2*x13*x8 + x13*x13 + x26*x26 - 2*x31*x26 + x31*x31 =L= 4;

e132.. x8*x8 - 2*x14*x8 + x14*x14 + x26*x26 - 2*x32*x26 + x32*x32 =L= 4;

e133.. x8*x8 - 2*x15*x8 + x15*x15 + x26*x26 - 2*x33*x26 + x33*x33 =L= 4;

e134.. x8*x8 - 2*x16*x8 + x16*x16 + x26*x26 - 2*x34*x26 + x34*x34 =L= 4;

e135.. x8*x8 - 2*x17*x8 + x17*x17 + x26*x26 - 2*x35*x26 + x35*x35 =L= 4;

e136.. x8*x8 - 2*x18*x8 + x18*x18 + x26*x26 - 2*x36*x26 + x36*x36 =L= 4;

e137.. x8*x8 - 2*x39*x8 + x26*x26 - 2*x37*x26 + x37*x37 + x39*x39 =L= 4;

e138.. x9*x9 - 2*x10*x9 + x10*x10 + x27*x27 - 2*x28*x27 + x28*x28 =L= 4;

e139.. x9*x9 - 2*x11*x9 + x11*x11 + x27*x27 - 2*x29*x27 + x29*x29 =L= 4;

e140.. x9*x9 - 2*x12*x9 + x12*x12 + x27*x27 - 2*x30*x27 + x30*x30 =L= 4;

e141.. x9*x9 - 2*x13*x9 + x13*x13 + x27*x27 - 2*x31*x27 + x31*x31 =L= 4;

e142.. x9*x9 - 2*x14*x9 + x14*x14 + x27*x27 - 2*x32*x27 + x32*x32 =L= 4;

e143.. x9*x9 - 2*x15*x9 + x15*x15 + x27*x27 - 2*x33*x27 + x33*x33 =L= 4;

e144.. x9*x9 - 2*x16*x9 + x16*x16 + x27*x27 - 2*x34*x27 + x34*x34 =L= 4;

e145.. x9*x9 - 2*x17*x9 + x17*x17 + x27*x27 - 2*x35*x27 + x35*x35 =L= 4;

e146.. x9*x9 - 2*x18*x9 + x18*x18 + x27*x27 - 2*x36*x27 + x36*x36 =L= 4;

e147.. x9*x9 - 2*x39*x9 + x27*x27 - 2*x37*x27 + x37*x37 + x39*x39 =L= 4;

e148.. x10*x10 - 2*x11*x10 + x11*x11 + x28*x28 - 2*x29*x28 + x29*x29 =L= 4;

e149.. x10*x10 - 2*x12*x10 + x12*x12 + x28*x28 - 2*x30*x28 + x30*x30 =L= 4;

e150.. x10*x10 - 2*x13*x10 + x13*x13 + x28*x28 - 2*x31*x28 + x31*x31 =L= 4;

e151.. x10*x10 - 2*x14*x10 + x14*x14 + x28*x28 - 2*x32*x28 + x32*x32 =L= 4;

e152.. x10*x10 - 2*x15*x10 + x15*x15 + x28*x28 - 2*x33*x28 + x33*x33 =L= 4;

e153.. x10*x10 - 2*x16*x10 + x16*x16 + x28*x28 - 2*x34*x28 + x34*x34 =L= 4;

e154.. x10*x10 - 2*x17*x10 + x17*x17 + x28*x28 - 2*x35*x28 + x35*x35 =L= 4;

e155.. x10*x10 - 2*x18*x10 + x18*x18 + x28*x28 - 2*x36*x28 + x36*x36 =L= 4;

e156.. x10*x10 - 2*x39*x10 + x28*x28 - 2*x37*x28 + x37*x37 + x39*x39 =L= 4;

e157.. x11*x11 - 2*x12*x11 + x12*x12 + x29*x29 - 2*x30*x29 + x30*x30 =L= 4;

e158.. x11*x11 - 2*x13*x11 + x13*x13 + x29*x29 - 2*x31*x29 + x31*x31 =L= 4;

e159.. x11*x11 - 2*x14*x11 + x14*x14 + x29*x29 - 2*x32*x29 + x32*x32 =L= 4;

e160.. x11*x11 - 2*x15*x11 + x15*x15 + x29*x29 - 2*x33*x29 + x33*x33 =L= 4;

e161.. x11*x11 - 2*x16*x11 + x16*x16 + x29*x29 - 2*x34*x29 + x34*x34 =L= 4;

e162.. x11*x11 - 2*x17*x11 + x17*x17 + x29*x29 - 2*x35*x29 + x35*x35 =L= 4;

e163.. x11*x11 - 2*x18*x11 + x18*x18 + x29*x29 - 2*x36*x29 + x36*x36 =L= 4;

e164.. x11*x11 - 2*x39*x11 + x29*x29 - 2*x37*x29 + x37*x37 + x39*x39 =L= 4;

e165.. x12*x12 - 2*x13*x12 + x13*x13 + x30*x30 - 2*x31*x30 + x31*x31 =L= 4;

e166.. x12*x12 - 2*x14*x12 + x14*x14 + x30*x30 - 2*x32*x30 + x32*x32 =L= 4;

e167.. x12*x12 - 2*x15*x12 + x15*x15 + x30*x30 - 2*x33*x30 + x33*x33 =L= 4;

e168.. x12*x12 - 2*x16*x12 + x16*x16 + x30*x30 - 2*x34*x30 + x34*x34 =L= 4;

e169.. x12*x12 - 2*x17*x12 + x17*x17 + x30*x30 - 2*x35*x30 + x35*x35 =L= 4;

e170.. x12*x12 - 2*x18*x12 + x18*x18 + x30*x30 - 2*x36*x30 + x36*x36 =L= 4;

e171.. x12*x12 - 2*x39*x12 + x30*x30 - 2*x37*x30 + x37*x37 + x39*x39 =L= 4;

e172.. x13*x13 - 2*x14*x13 + x14*x14 + x31*x31 - 2*x32*x31 + x32*x32 =L= 4;

e173.. x13*x13 - 2*x15*x13 + x15*x15 + x31*x31 - 2*x33*x31 + x33*x33 =L= 4;

e174.. x13*x13 - 2*x16*x13 + x16*x16 + x31*x31 - 2*x34*x31 + x34*x34 =L= 4;

e175.. x13*x13 - 2*x17*x13 + x17*x17 + x31*x31 - 2*x35*x31 + x35*x35 =L= 4;

e176.. x13*x13 - 2*x18*x13 + x18*x18 + x31*x31 - 2*x36*x31 + x36*x36 =L= 4;

e177.. x13*x13 - 2*x39*x13 + x31*x31 - 2*x37*x31 + x37*x37 + x39*x39 =L= 4;

e178.. x14*x14 - 2*x15*x14 + x15*x15 + x32*x32 - 2*x33*x32 + x33*x33 =L= 4;

e179.. x14*x14 - 2*x16*x14 + x16*x16 + x32*x32 - 2*x34*x32 + x34*x34 =L= 4;

e180.. x14*x14 - 2*x17*x14 + x17*x17 + x32*x32 - 2*x35*x32 + x35*x35 =L= 4;

e181.. x14*x14 - 2*x18*x14 + x18*x18 + x32*x32 - 2*x36*x32 + x36*x36 =L= 4;

e182.. x14*x14 - 2*x39*x14 + x32*x32 - 2*x37*x32 + x37*x37 + x39*x39 =L= 4;

e183.. x15*x15 - 2*x16*x15 + x16*x16 + x33*x33 - 2*x34*x33 + x34*x34 =L= 4;

e184.. x15*x15 - 2*x17*x15 + x17*x17 + x33*x33 - 2*x35*x33 + x35*x35 =L= 4;

e185.. x15*x15 - 2*x18*x15 + x18*x18 + x33*x33 - 2*x36*x33 + x36*x36 =L= 4;

e186.. x15*x15 - 2*x39*x15 + x33*x33 - 2*x37*x33 + x37*x37 + x39*x39 =L= 4;

e187.. x16*x16 - 2*x17*x16 + x17*x17 + x34*x34 - 2*x35*x34 + x35*x35 =L= 4;

e188.. x16*x16 - 2*x18*x16 + x18*x18 + x34*x34 - 2*x36*x34 + x36*x36 =L= 4;

e189.. x16*x16 - 2*x39*x16 + x34*x34 - 2*x37*x34 + x37*x37 + x39*x39 =L= 4;

e190.. x17*x17 - 2*x18*x17 + x18*x18 + x35*x35 - 2*x36*x35 + x36*x36 =L= 4;

e191.. x17*x17 - 2*x39*x17 + x35*x35 - 2*x37*x35 + x37*x37 + x39*x39 =L= 4;

e192.. x18*x18 - 2*x39*x18 + x36*x36 - 2*x37*x36 + x37*x37 + x39*x39 =L= 4;

* set non-default bounds
x2.lo = 0.5; x2.up = 2.5;
x3.lo = 0.5; x3.up = 2.5;
x4.lo = 0.5; x4.up = 2.5;
x5.lo = 0.5; x5.up = 2.5;
x6.lo = 0.5; x6.up = 2.5;
x7.lo = 0.5; x7.up = 2.5;
x8.lo = 0.5; x8.up = 2.5;
x9.lo = 0.5; x9.up = 2.5;
x10.lo = 0.5; x10.up = 2.5;
x11.lo = 0.5; x11.up = 2.5;
x12.lo = 0.5; x12.up = 2.5;
x13.lo = 0.5; x13.up = 2.5;
x14.lo = 0.5; x14.up = 2.5;
x15.lo = 0.5; x15.up = 2.5;
x16.lo = 0.5; x16.up = 2.5;
x17.lo = 0.5; x17.up = 2.5;
x18.lo = 0.5; x18.up = 2.5;
x38.lo = 0.5; x38.up = 2.5;
x39.lo = 0.5; x39.up = 2.5;

* set non-default levels
x2.l = 0.5;
x3.l = 0.5;
x4.l = 0.5;
x5.l = 0.5;
x6.l = 0.5;
x7.l = 0.5;
x8.l = 0.5;
x9.l = 0.5;
x10.l = 0.5;
x11.l = 0.5;
x12.l = 0.5;
x13.l = 0.5;
x14.l = 0.5;
x15.l = 0.5;
x16.l = 0.5;
x17.l = 0.5;
x18.l = 0.5;
x38.l = 0.5;
x39.l = 0.5;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set QCP $set QCP QCP
Solve m using %QCP% maximizing objvar;
