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

e3.. sqr(x19) + sqr(x38) - x38 =L= 3.75;

e4.. sqr(x2) - x2 + sqr(x20) =L= 3.75;

e5.. sqr(x3) - x3 + sqr(x21) =L= 3.75;

e6.. sqr(x4) - x4 + sqr(x22) =L= 3.75;

e7.. sqr(x5) - x5 + sqr(x23) =L= 3.75;

e8.. sqr(x6) - x6 + sqr(x24) =L= 3.75;

e9.. sqr(x7) - x7 + sqr(x25) =L= 3.75;

e10.. sqr(x8) - x8 + sqr(x26) =L= 3.75;

e11.. sqr(x9) - x9 + sqr(x27) =L= 3.75;

e12.. sqr(x10) - x10 + sqr(x28) =L= 3.75;

e13.. sqr(x11) - x11 + sqr(x29) =L= 3.75;

e14.. sqr(x12) - x12 + sqr(x30) =L= 3.75;

e15.. sqr(x13) - x13 + sqr(x31) =L= 3.75;

e16.. sqr(x14) - x14 + sqr(x32) =L= 3.75;

e17.. sqr(x15) - x15 + sqr(x33) =L= 3.75;

e18.. sqr(x16) - x16 + sqr(x34) =L= 3.75;

e19.. sqr(x17) - x17 + sqr(x35) =L= 3.75;

e20.. sqr(x18) - x18 + sqr(x36) =L= 3.75;

e21.. sqr(x37) + sqr(x39) - x39 =L= 3.75;

e22.. sqr(x2) - 2*x38*x2 + sqr(x19) - 2*x20*x19 + sqr(x20) + sqr(x38) =L= 4;

e23.. sqr(x3) - 2*x38*x3 + sqr(x19) - 2*x21*x19 + sqr(x21) + sqr(x38) =L= 4;

e24.. sqr(x4) - 2*x38*x4 + sqr(x19) - 2*x22*x19 + sqr(x22) + sqr(x38) =L= 4;

e25.. sqr(x5) - 2*x38*x5 + sqr(x19) - 2*x23*x19 + sqr(x23) + sqr(x38) =L= 4;

e26.. sqr(x6) - 2*x38*x6 + sqr(x19) - 2*x24*x19 + sqr(x24) + sqr(x38) =L= 4;

e27.. sqr(x7) - 2*x38*x7 + sqr(x19) - 2*x25*x19 + sqr(x25) + sqr(x38) =L= 4;

e28.. sqr(x8) - 2*x38*x8 + sqr(x19) - 2*x26*x19 + sqr(x26) + sqr(x38) =L= 4;

e29.. sqr(x9) - 2*x38*x9 + sqr(x19) - 2*x27*x19 + sqr(x27) + sqr(x38) =L= 4;

e30.. sqr(x10) - 2*x38*x10 + sqr(x19) - 2*x28*x19 + sqr(x28) + sqr(x38) =L= 4;

e31.. sqr(x11) - 2*x38*x11 + sqr(x19) - 2*x29*x19 + sqr(x29) + sqr(x38) =L= 4;

e32.. sqr(x12) - 2*x38*x12 + sqr(x19) - 2*x30*x19 + sqr(x30) + sqr(x38) =L= 4;

e33.. sqr(x13) - 2*x38*x13 + sqr(x19) - 2*x31*x19 + sqr(x31) + sqr(x38) =L= 4;

e34.. sqr(x14) - 2*x38*x14 + sqr(x19) - 2*x32*x19 + sqr(x32) + sqr(x38) =L= 4;

e35.. sqr(x15) - 2*x38*x15 + sqr(x19) - 2*x33*x19 + sqr(x33) + sqr(x38) =L= 4;

e36.. sqr(x16) - 2*x38*x16 + sqr(x19) - 2*x34*x19 + sqr(x34) + sqr(x38) =L= 4;

e37.. sqr(x17) - 2*x38*x17 + sqr(x19) - 2*x35*x19 + sqr(x35) + sqr(x38) =L= 4;

e38.. sqr(x18) - 2*x38*x18 + sqr(x19) - 2*x36*x19 + sqr(x36) + sqr(x38) =L= 4;

e39.. sqr(x19) - 2*x37*x19 + sqr(x37) + sqr(x38) - 2*x39*x38 + sqr(x39) =L= 4;

e40.. sqr(x2) - 2*x3*x2 + sqr(x3) + sqr(x20) - 2*x21*x20 + sqr(x21) =L= 4;

e41.. sqr(x2) - 2*x4*x2 + sqr(x4) + sqr(x20) - 2*x22*x20 + sqr(x22) =L= 4;

e42.. sqr(x2) - 2*x5*x2 + sqr(x5) + sqr(x20) - 2*x23*x20 + sqr(x23) =L= 4;

e43.. sqr(x2) - 2*x6*x2 + sqr(x6) + sqr(x20) - 2*x24*x20 + sqr(x24) =L= 4;

e44.. sqr(x2) - 2*x7*x2 + sqr(x7) + sqr(x20) - 2*x25*x20 + sqr(x25) =L= 4;

e45.. sqr(x2) - 2*x8*x2 + sqr(x8) + sqr(x20) - 2*x26*x20 + sqr(x26) =L= 4;

e46.. sqr(x2) - 2*x9*x2 + sqr(x9) + sqr(x20) - 2*x27*x20 + sqr(x27) =L= 4;

e47.. sqr(x2) - 2*x10*x2 + sqr(x10) + sqr(x20) - 2*x28*x20 + sqr(x28) =L= 4;

e48.. sqr(x2) - 2*x11*x2 + sqr(x11) + sqr(x20) - 2*x29*x20 + sqr(x29) =L= 4;

e49.. sqr(x2) - 2*x12*x2 + sqr(x12) + sqr(x20) - 2*x30*x20 + sqr(x30) =L= 4;

e50.. sqr(x2) - 2*x13*x2 + sqr(x13) + sqr(x20) - 2*x31*x20 + sqr(x31) =L= 4;

e51.. sqr(x2) - 2*x14*x2 + sqr(x14) + sqr(x20) - 2*x32*x20 + sqr(x32) =L= 4;

e52.. sqr(x2) - 2*x15*x2 + sqr(x15) + sqr(x20) - 2*x33*x20 + sqr(x33) =L= 4;

e53.. sqr(x2) - 2*x16*x2 + sqr(x16) + sqr(x20) - 2*x34*x20 + sqr(x34) =L= 4;

e54.. sqr(x2) - 2*x17*x2 + sqr(x17) + sqr(x20) - 2*x35*x20 + sqr(x35) =L= 4;

e55.. sqr(x2) - 2*x18*x2 + sqr(x18) + sqr(x20) - 2*x36*x20 + sqr(x36) =L= 4;

e56.. sqr(x2) - 2*x39*x2 + sqr(x20) - 2*x37*x20 + sqr(x37) + sqr(x39) =L= 4;

e57.. sqr(x3) - 2*x4*x3 + sqr(x4) + sqr(x21) - 2*x22*x21 + sqr(x22) =L= 4;

e58.. sqr(x3) - 2*x5*x3 + sqr(x5) + sqr(x21) - 2*x23*x21 + sqr(x23) =L= 4;

e59.. sqr(x3) - 2*x6*x3 + sqr(x6) + sqr(x21) - 2*x24*x21 + sqr(x24) =L= 4;

e60.. sqr(x3) - 2*x7*x3 + sqr(x7) + sqr(x21) - 2*x25*x21 + sqr(x25) =L= 4;

e61.. sqr(x3) - 2*x8*x3 + sqr(x8) + sqr(x21) - 2*x26*x21 + sqr(x26) =L= 4;

e62.. sqr(x3) - 2*x9*x3 + sqr(x9) + sqr(x21) - 2*x27*x21 + sqr(x27) =L= 4;

e63.. sqr(x3) - 2*x10*x3 + sqr(x10) + sqr(x21) - 2*x28*x21 + sqr(x28) =L= 4;

e64.. sqr(x3) - 2*x11*x3 + sqr(x11) + sqr(x21) - 2*x29*x21 + sqr(x29) =L= 4;

e65.. sqr(x3) - 2*x12*x3 + sqr(x12) + sqr(x21) - 2*x30*x21 + sqr(x30) =L= 4;

e66.. sqr(x3) - 2*x13*x3 + sqr(x13) + sqr(x21) - 2*x31*x21 + sqr(x31) =L= 4;

e67.. sqr(x3) - 2*x14*x3 + sqr(x14) + sqr(x21) - 2*x32*x21 + sqr(x32) =L= 4;

e68.. sqr(x3) - 2*x15*x3 + sqr(x15) + sqr(x21) - 2*x33*x21 + sqr(x33) =L= 4;

e69.. sqr(x3) - 2*x16*x3 + sqr(x16) + sqr(x21) - 2*x34*x21 + sqr(x34) =L= 4;

e70.. sqr(x3) - 2*x17*x3 + sqr(x17) + sqr(x21) - 2*x35*x21 + sqr(x35) =L= 4;

e71.. sqr(x3) - 2*x18*x3 + sqr(x18) + sqr(x21) - 2*x36*x21 + sqr(x36) =L= 4;

e72.. sqr(x3) - 2*x39*x3 + sqr(x21) - 2*x37*x21 + sqr(x37) + sqr(x39) =L= 4;

e73.. sqr(x4) - 2*x5*x4 + sqr(x5) + sqr(x22) - 2*x23*x22 + sqr(x23) =L= 4;

e74.. sqr(x4) - 2*x6*x4 + sqr(x6) + sqr(x22) - 2*x24*x22 + sqr(x24) =L= 4;

e75.. sqr(x4) - 2*x7*x4 + sqr(x7) + sqr(x22) - 2*x25*x22 + sqr(x25) =L= 4;

e76.. sqr(x4) - 2*x8*x4 + sqr(x8) + sqr(x22) - 2*x26*x22 + sqr(x26) =L= 4;

e77.. sqr(x4) - 2*x9*x4 + sqr(x9) + sqr(x22) - 2*x27*x22 + sqr(x27) =L= 4;

e78.. sqr(x4) - 2*x10*x4 + sqr(x10) + sqr(x22) - 2*x28*x22 + sqr(x28) =L= 4;

e79.. sqr(x4) - 2*x11*x4 + sqr(x11) + sqr(x22) - 2*x29*x22 + sqr(x29) =L= 4;

e80.. sqr(x4) - 2*x12*x4 + sqr(x12) + sqr(x22) - 2*x30*x22 + sqr(x30) =L= 4;

e81.. sqr(x4) - 2*x13*x4 + sqr(x13) + sqr(x22) - 2*x31*x22 + sqr(x31) =L= 4;

e82.. sqr(x4) - 2*x14*x4 + sqr(x14) + sqr(x22) - 2*x32*x22 + sqr(x32) =L= 4;

e83.. sqr(x4) - 2*x15*x4 + sqr(x15) + sqr(x22) - 2*x33*x22 + sqr(x33) =L= 4;

e84.. sqr(x4) - 2*x16*x4 + sqr(x16) + sqr(x22) - 2*x34*x22 + sqr(x34) =L= 4;

e85.. sqr(x4) - 2*x17*x4 + sqr(x17) + sqr(x22) - 2*x35*x22 + sqr(x35) =L= 4;

e86.. sqr(x4) - 2*x18*x4 + sqr(x18) + sqr(x22) - 2*x36*x22 + sqr(x36) =L= 4;

e87.. sqr(x4) - 2*x39*x4 + sqr(x22) - 2*x37*x22 + sqr(x37) + sqr(x39) =L= 4;

e88.. sqr(x5) - 2*x6*x5 + sqr(x6) + sqr(x23) - 2*x24*x23 + sqr(x24) =L= 4;

e89.. sqr(x5) - 2*x7*x5 + sqr(x7) + sqr(x23) - 2*x25*x23 + sqr(x25) =L= 4;

e90.. sqr(x5) - 2*x8*x5 + sqr(x8) + sqr(x23) - 2*x26*x23 + sqr(x26) =L= 4;

e91.. sqr(x5) - 2*x9*x5 + sqr(x9) + sqr(x23) - 2*x27*x23 + sqr(x27) =L= 4;

e92.. sqr(x5) - 2*x10*x5 + sqr(x10) + sqr(x23) - 2*x28*x23 + sqr(x28) =L= 4;

e93.. sqr(x5) - 2*x11*x5 + sqr(x11) + sqr(x23) - 2*x29*x23 + sqr(x29) =L= 4;

e94.. sqr(x5) - 2*x12*x5 + sqr(x12) + sqr(x23) - 2*x30*x23 + sqr(x30) =L= 4;

e95.. sqr(x5) - 2*x13*x5 + sqr(x13) + sqr(x23) - 2*x31*x23 + sqr(x31) =L= 4;

e96.. sqr(x5) - 2*x14*x5 + sqr(x14) + sqr(x23) - 2*x32*x23 + sqr(x32) =L= 4;

e97.. sqr(x5) - 2*x15*x5 + sqr(x15) + sqr(x23) - 2*x33*x23 + sqr(x33) =L= 4;

e98.. sqr(x5) - 2*x16*x5 + sqr(x16) + sqr(x23) - 2*x34*x23 + sqr(x34) =L= 4;

e99.. sqr(x5) - 2*x17*x5 + sqr(x17) + sqr(x23) - 2*x35*x23 + sqr(x35) =L= 4;

e100.. sqr(x5) - 2*x18*x5 + sqr(x18) + sqr(x23) - 2*x36*x23 + sqr(x36) =L= 4;

e101.. sqr(x5) - 2*x39*x5 + sqr(x23) - 2*x37*x23 + sqr(x37) + sqr(x39) =L= 4;

e102.. sqr(x6) - 2*x7*x6 + sqr(x7) + sqr(x24) - 2*x25*x24 + sqr(x25) =L= 4;

e103.. sqr(x6) - 2*x8*x6 + sqr(x8) + sqr(x24) - 2*x26*x24 + sqr(x26) =L= 4;

e104.. sqr(x6) - 2*x9*x6 + sqr(x9) + sqr(x24) - 2*x27*x24 + sqr(x27) =L= 4;

e105.. sqr(x6) - 2*x10*x6 + sqr(x10) + sqr(x24) - 2*x28*x24 + sqr(x28) =L= 4;

e106.. sqr(x6) - 2*x11*x6 + sqr(x11) + sqr(x24) - 2*x29*x24 + sqr(x29) =L= 4;

e107.. sqr(x6) - 2*x12*x6 + sqr(x12) + sqr(x24) - 2*x30*x24 + sqr(x30) =L= 4;

e108.. sqr(x6) - 2*x13*x6 + sqr(x13) + sqr(x24) - 2*x31*x24 + sqr(x31) =L= 4;

e109.. sqr(x6) - 2*x14*x6 + sqr(x14) + sqr(x24) - 2*x32*x24 + sqr(x32) =L= 4;

e110.. sqr(x6) - 2*x15*x6 + sqr(x15) + sqr(x24) - 2*x33*x24 + sqr(x33) =L= 4;

e111.. sqr(x6) - 2*x16*x6 + sqr(x16) + sqr(x24) - 2*x34*x24 + sqr(x34) =L= 4;

e112.. sqr(x6) - 2*x17*x6 + sqr(x17) + sqr(x24) - 2*x35*x24 + sqr(x35) =L= 4;

e113.. sqr(x6) - 2*x18*x6 + sqr(x18) + sqr(x24) - 2*x36*x24 + sqr(x36) =L= 4;

e114.. sqr(x6) - 2*x39*x6 + sqr(x24) - 2*x37*x24 + sqr(x37) + sqr(x39) =L= 4;

e115.. sqr(x7) - 2*x8*x7 + sqr(x8) + sqr(x25) - 2*x26*x25 + sqr(x26) =L= 4;

e116.. sqr(x7) - 2*x9*x7 + sqr(x9) + sqr(x25) - 2*x27*x25 + sqr(x27) =L= 4;

e117.. sqr(x7) - 2*x10*x7 + sqr(x10) + sqr(x25) - 2*x28*x25 + sqr(x28) =L= 4;

e118.. sqr(x7) - 2*x11*x7 + sqr(x11) + sqr(x25) - 2*x29*x25 + sqr(x29) =L= 4;

e119.. sqr(x7) - 2*x12*x7 + sqr(x12) + sqr(x25) - 2*x30*x25 + sqr(x30) =L= 4;

e120.. sqr(x7) - 2*x13*x7 + sqr(x13) + sqr(x25) - 2*x31*x25 + sqr(x31) =L= 4;

e121.. sqr(x7) - 2*x14*x7 + sqr(x14) + sqr(x25) - 2*x32*x25 + sqr(x32) =L= 4;

e122.. sqr(x7) - 2*x15*x7 + sqr(x15) + sqr(x25) - 2*x33*x25 + sqr(x33) =L= 4;

e123.. sqr(x7) - 2*x16*x7 + sqr(x16) + sqr(x25) - 2*x34*x25 + sqr(x34) =L= 4;

e124.. sqr(x7) - 2*x17*x7 + sqr(x17) + sqr(x25) - 2*x35*x25 + sqr(x35) =L= 4;

e125.. sqr(x7) - 2*x18*x7 + sqr(x18) + sqr(x25) - 2*x36*x25 + sqr(x36) =L= 4;

e126.. sqr(x7) - 2*x39*x7 + sqr(x25) - 2*x37*x25 + sqr(x37) + sqr(x39) =L= 4;

e127.. sqr(x8) - 2*x9*x8 + sqr(x9) + sqr(x26) - 2*x27*x26 + sqr(x27) =L= 4;

e128.. sqr(x8) - 2*x10*x8 + sqr(x10) + sqr(x26) - 2*x28*x26 + sqr(x28) =L= 4;

e129.. sqr(x8) - 2*x11*x8 + sqr(x11) + sqr(x26) - 2*x29*x26 + sqr(x29) =L= 4;

e130.. sqr(x8) - 2*x12*x8 + sqr(x12) + sqr(x26) - 2*x30*x26 + sqr(x30) =L= 4;

e131.. sqr(x8) - 2*x13*x8 + sqr(x13) + sqr(x26) - 2*x31*x26 + sqr(x31) =L= 4;

e132.. sqr(x8) - 2*x14*x8 + sqr(x14) + sqr(x26) - 2*x32*x26 + sqr(x32) =L= 4;

e133.. sqr(x8) - 2*x15*x8 + sqr(x15) + sqr(x26) - 2*x33*x26 + sqr(x33) =L= 4;

e134.. sqr(x8) - 2*x16*x8 + sqr(x16) + sqr(x26) - 2*x34*x26 + sqr(x34) =L= 4;

e135.. sqr(x8) - 2*x17*x8 + sqr(x17) + sqr(x26) - 2*x35*x26 + sqr(x35) =L= 4;

e136.. sqr(x8) - 2*x18*x8 + sqr(x18) + sqr(x26) - 2*x36*x26 + sqr(x36) =L= 4;

e137.. sqr(x8) - 2*x39*x8 + sqr(x26) - 2*x37*x26 + sqr(x37) + sqr(x39) =L= 4;

e138.. sqr(x9) - 2*x10*x9 + sqr(x10) + sqr(x27) - 2*x28*x27 + sqr(x28) =L= 4;

e139.. sqr(x9) - 2*x11*x9 + sqr(x11) + sqr(x27) - 2*x29*x27 + sqr(x29) =L= 4;

e140.. sqr(x9) - 2*x12*x9 + sqr(x12) + sqr(x27) - 2*x30*x27 + sqr(x30) =L= 4;

e141.. sqr(x9) - 2*x13*x9 + sqr(x13) + sqr(x27) - 2*x31*x27 + sqr(x31) =L= 4;

e142.. sqr(x9) - 2*x14*x9 + sqr(x14) + sqr(x27) - 2*x32*x27 + sqr(x32) =L= 4;

e143.. sqr(x9) - 2*x15*x9 + sqr(x15) + sqr(x27) - 2*x33*x27 + sqr(x33) =L= 4;

e144.. sqr(x9) - 2*x16*x9 + sqr(x16) + sqr(x27) - 2*x34*x27 + sqr(x34) =L= 4;

e145.. sqr(x9) - 2*x17*x9 + sqr(x17) + sqr(x27) - 2*x35*x27 + sqr(x35) =L= 4;

e146.. sqr(x9) - 2*x18*x9 + sqr(x18) + sqr(x27) - 2*x36*x27 + sqr(x36) =L= 4;

e147.. sqr(x9) - 2*x39*x9 + sqr(x27) - 2*x37*x27 + sqr(x37) + sqr(x39) =L= 4;

e148.. sqr(x10) - 2*x11*x10 + sqr(x11) + sqr(x28) - 2*x29*x28 + sqr(x29) =L= 4;

e149.. sqr(x10) - 2*x12*x10 + sqr(x12) + sqr(x28) - 2*x30*x28 + sqr(x30) =L= 4;

e150.. sqr(x10) - 2*x13*x10 + sqr(x13) + sqr(x28) - 2*x31*x28 + sqr(x31) =L= 4;

e151.. sqr(x10) - 2*x14*x10 + sqr(x14) + sqr(x28) - 2*x32*x28 + sqr(x32) =L= 4;

e152.. sqr(x10) - 2*x15*x10 + sqr(x15) + sqr(x28) - 2*x33*x28 + sqr(x33) =L= 4;

e153.. sqr(x10) - 2*x16*x10 + sqr(x16) + sqr(x28) - 2*x34*x28 + sqr(x34) =L= 4;

e154.. sqr(x10) - 2*x17*x10 + sqr(x17) + sqr(x28) - 2*x35*x28 + sqr(x35) =L= 4;

e155.. sqr(x10) - 2*x18*x10 + sqr(x18) + sqr(x28) - 2*x36*x28 + sqr(x36) =L= 4;

e156.. sqr(x10) - 2*x39*x10 + sqr(x28) - 2*x37*x28 + sqr(x37) + sqr(x39) =L= 4;

e157.. sqr(x11) - 2*x12*x11 + sqr(x12) + sqr(x29) - 2*x30*x29 + sqr(x30) =L= 4;

e158.. sqr(x11) - 2*x13*x11 + sqr(x13) + sqr(x29) - 2*x31*x29 + sqr(x31) =L= 4;

e159.. sqr(x11) - 2*x14*x11 + sqr(x14) + sqr(x29) - 2*x32*x29 + sqr(x32) =L= 4;

e160.. sqr(x11) - 2*x15*x11 + sqr(x15) + sqr(x29) - 2*x33*x29 + sqr(x33) =L= 4;

e161.. sqr(x11) - 2*x16*x11 + sqr(x16) + sqr(x29) - 2*x34*x29 + sqr(x34) =L= 4;

e162.. sqr(x11) - 2*x17*x11 + sqr(x17) + sqr(x29) - 2*x35*x29 + sqr(x35) =L= 4;

e163.. sqr(x11) - 2*x18*x11 + sqr(x18) + sqr(x29) - 2*x36*x29 + sqr(x36) =L= 4;

e164.. sqr(x11) - 2*x39*x11 + sqr(x29) - 2*x37*x29 + sqr(x37) + sqr(x39) =L= 4;

e165.. sqr(x12) - 2*x13*x12 + sqr(x13) + sqr(x30) - 2*x31*x30 + sqr(x31) =L= 4;

e166.. sqr(x12) - 2*x14*x12 + sqr(x14) + sqr(x30) - 2*x32*x30 + sqr(x32) =L= 4;

e167.. sqr(x12) - 2*x15*x12 + sqr(x15) + sqr(x30) - 2*x33*x30 + sqr(x33) =L= 4;

e168.. sqr(x12) - 2*x16*x12 + sqr(x16) + sqr(x30) - 2*x34*x30 + sqr(x34) =L= 4;

e169.. sqr(x12) - 2*x17*x12 + sqr(x17) + sqr(x30) - 2*x35*x30 + sqr(x35) =L= 4;

e170.. sqr(x12) - 2*x18*x12 + sqr(x18) + sqr(x30) - 2*x36*x30 + sqr(x36) =L= 4;

e171.. sqr(x12) - 2*x39*x12 + sqr(x30) - 2*x37*x30 + sqr(x37) + sqr(x39) =L= 4;

e172.. sqr(x13) - 2*x14*x13 + sqr(x14) + sqr(x31) - 2*x32*x31 + sqr(x32) =L= 4;

e173.. sqr(x13) - 2*x15*x13 + sqr(x15) + sqr(x31) - 2*x33*x31 + sqr(x33) =L= 4;

e174.. sqr(x13) - 2*x16*x13 + sqr(x16) + sqr(x31) - 2*x34*x31 + sqr(x34) =L= 4;

e175.. sqr(x13) - 2*x17*x13 + sqr(x17) + sqr(x31) - 2*x35*x31 + sqr(x35) =L= 4;

e176.. sqr(x13) - 2*x18*x13 + sqr(x18) + sqr(x31) - 2*x36*x31 + sqr(x36) =L= 4;

e177.. sqr(x13) - 2*x39*x13 + sqr(x31) - 2*x37*x31 + sqr(x37) + sqr(x39) =L= 4;

e178.. sqr(x14) - 2*x15*x14 + sqr(x15) + sqr(x32) - 2*x33*x32 + sqr(x33) =L= 4;

e179.. sqr(x14) - 2*x16*x14 + sqr(x16) + sqr(x32) - 2*x34*x32 + sqr(x34) =L= 4;

e180.. sqr(x14) - 2*x17*x14 + sqr(x17) + sqr(x32) - 2*x35*x32 + sqr(x35) =L= 4;

e181.. sqr(x14) - 2*x18*x14 + sqr(x18) + sqr(x32) - 2*x36*x32 + sqr(x36) =L= 4;

e182.. sqr(x14) - 2*x39*x14 + sqr(x32) - 2*x37*x32 + sqr(x37) + sqr(x39) =L= 4;

e183.. sqr(x15) - 2*x16*x15 + sqr(x16) + sqr(x33) - 2*x34*x33 + sqr(x34) =L= 4;

e184.. sqr(x15) - 2*x17*x15 + sqr(x17) + sqr(x33) - 2*x35*x33 + sqr(x35) =L= 4;

e185.. sqr(x15) - 2*x18*x15 + sqr(x18) + sqr(x33) - 2*x36*x33 + sqr(x36) =L= 4;

e186.. sqr(x15) - 2*x39*x15 + sqr(x33) - 2*x37*x33 + sqr(x37) + sqr(x39) =L= 4;

e187.. sqr(x16) - 2*x17*x16 + sqr(x17) + sqr(x34) - 2*x35*x34 + sqr(x35) =L= 4;

e188.. sqr(x16) - 2*x18*x16 + sqr(x18) + sqr(x34) - 2*x36*x34 + sqr(x36) =L= 4;

e189.. sqr(x16) - 2*x39*x16 + sqr(x34) - 2*x37*x34 + sqr(x37) + sqr(x39) =L= 4;

e190.. sqr(x17) - 2*x18*x17 + sqr(x18) + sqr(x35) - 2*x36*x35 + sqr(x36) =L= 4;

e191.. sqr(x17) - 2*x39*x17 + sqr(x35) - 2*x37*x35 + sqr(x37) + sqr(x39) =L= 4;

e192.. sqr(x18) - 2*x39*x18 + sqr(x36) - 2*x37*x36 + sqr(x37) + sqr(x39) =L= 4;

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
