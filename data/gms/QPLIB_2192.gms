$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        271      181        0       90        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        291      201       90        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*       2323     2143      180        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102
          ,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115
          ,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127,x128
          ,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x140,x141
          ,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151,x152,x153,x154
          ,x155,x156,x157,x158,x159,x160,x161,x162,x163,x164,x165,x166,x167
          ,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177,x178,x179,x180
          ,x181,x182,x183,x184,x185,x186,x187,x188,x189,x190,x191,x192,x193
          ,x194,x195,x196,x197,x198,x199,x200,x201,x202,x203,x204,x205,x206
          ,x207,x208,x209,x210,x211,x212,x213,x214,x215,x216,x217,x218,x219
          ,x220,x221,x222,x223,x224,x225,x226,x227,x228,x229,x230,x231,x232
          ,x233,x234,x235,x236,x237,x238,x239,x240,x241,x242,x243,x244,x245
          ,x246,x247,x248,x249,x250,x251,x252,x253,x254,x255,x256,x257,x258
          ,x259,x260,x261,x262,x263,x264,x265,x266,x267,x268,x269,x270,x271
          ,x272,x273,x274,x275,x276,x277,x278,x279,x280,x281,x282,x283,x284
          ,x285,x286,x287,x288,x289,x290,x291;

Positive Variables  x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122
          ,x123,x124,x125,x126,x127,x128,x129,x130,x131,x132,x133,x134,x135
          ,x136,x137,x138,x139,x140,x141,x142,x143,x144,x145,x146,x147,x148
          ,x149,x150,x151,x152,x153,x154,x155,x156,x157,x158,x159,x160,x161
          ,x162,x163,x164,x165,x166,x167,x168,x169,x170,x171,x172,x173,x174
          ,x175,x176,x177,x178,x179,x180,x181,x182,x183,x184,x185,x186,x187
          ,x188,x189,x190,x191,x192,x193,x194,x195,x196,x197,x198,x199,x200
          ,x201;

Binary Variables  b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91;

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
          ,e182,e183,e184,e185,e186,e187,e188,e189,e190,e191,e192,e193,e194
          ,e195,e196,e197,e198,e199,e200,e201,e202,e203,e204,e205,e206,e207
          ,e208,e209,e210,e211,e212,e213,e214,e215,e216,e217,e218,e219,e220
          ,e221,e222,e223,e224,e225,e226,e227,e228,e229,e230,e231,e232,e233
          ,e234,e235,e236,e237,e238,e239,e240,e241,e242,e243,e244,e245,e246
          ,e247,e248,e249,e250,e251,e252,e253,e254,e255,e256,e257,e258,e259
          ,e260,e261,e262,e263,e264,e265,e266,e267,e268,e269,e270,e271;


e1..  - objvar + b2 + b3 + b4 + b5 + b6 + b7 + b8 + b9 + b10 + b11 + b12 + b13
      + b14 + b15 + b16 + b17 + b18 + b19 + b20 + b21 + b22 + b23 + b24 + b25
      + b26 + b27 + b28 + b29 + b30 + b31 + b32 + b33 + b34 + b35 + b36 + b37
      + b38 + b39 + b40 + b41 + b42 + b43 + b44 + b45 + b46 + b47 + b48 + b49
      + b50 + b51 + b52 + b53 + b54 + b55 + b56 + b57 + b58 + b59 + b60 + b61
      + b62 + b63 + b64 + b65 + b66 + b67 + b68 + b69 + b70 + b71 + b72 + b73
      + b74 + b75 + b76 + b77 + b78 + b79 + b80 + b81 + b82 + b83 + b84 + b85
      + b86 + b87 + b88 + b89 + b90 + b91 =E= 0;

e2..  - 66*x92 + 49*x93 - 81*x94 + 73*x95 + 15*x96 + 56*x97 + 38*x98 - 26*x99
      + 74*x100 + 48*x101 - 11*x102 - 29*x103 + 46*x104 - 48*x105 - 21*x106
      + 55*x107 + 68*x108 + 14*x109 + 42*x110 - 84*x111 - x112 =L= -9;

e3..  - 78*x92 + 8*x93 - 22*x94 + 13*x95 + 91*x96 + 73*x97 - 68*x98 - 45*x99
      - 48*x100 + 84*x101 - 13*x102 + 57*x103 - 75*x104 - 84*x105 + 88*x106
      - 95*x107 - 70*x108 - 24*x109 - 69*x110 + 5*x111 - x113 =L= 75;

e4..  - 14*x92 - 47*x93 - 37*x94 + 53*x95 - 79*x96 + 53*x97 + 40*x98 - 57*x99
      + 52*x100 - 18*x101 + 29*x102 + 85*x103 + 37*x105 - 13*x106 + 21*x107
      + 14*x108 + 26*x109 - 7*x110 + 26*x111 - x114 =L= -73;

e5..    92*x92 - 71*x93 - 11*x94 - 35*x95 + 90*x96 - 29*x97 - 20*x98 - 80*x99
      + 90*x100 + 96*x101 + 14*x102 + 73*x103 - 70*x104 + 81*x105 + 29*x106
      - 88*x107 + 90*x108 + 93*x109 + 56*x110 + 60*x111 - x115 =L= 13;

e6..  - 44*x92 + 92*x93 + 15*x94 - 13*x95 - 25*x96 + 84*x97 - 95*x98 + 53*x99
      + 44*x100 + 17*x101 - 15*x102 + 28*x103 + 49*x104 - 87*x105 - 90*x106
      + 54*x107 + 40*x108 - 76*x109 - 40*x110 - 86*x111 - x116 =L= 37;

e7..  - 27*x92 + 45*x93 - 61*x94 - 69*x95 - 68*x96 + 66*x97 + 9*x98 - 37*x99
      + 5*x100 - 13*x101 - 58*x102 + 45*x103 - 100*x104 + 16*x105 - 5*x106
      + 87*x107 + 52*x108 - 75*x109 - 98*x110 - x117 =L= 68;

e8..    70*x92 - 82*x93 + 71*x94 + 57*x95 + 15*x96 - 81*x97 + 65*x98 + 49*x99
      + 81*x100 + x101 + 76*x102 + 92*x103 + 12*x104 - 5*x105 - 17*x106
      + 29*x107 + 75*x108 + 16*x109 - 56*x110 + 99*x111 - x118 =L= -69;

e9..    38*x92 + 40*x93 + 97*x94 + 29*x95 + 30*x96 + 68*x97 + 36*x98 + 93*x99
      - 34*x100 + 59*x101 - 68*x102 + 72*x103 + 20*x104 - 16*x105 + 96*x106
      + 73*x107 - 7*x108 - 51*x109 + 68*x110 + 68*x111 - x119 =L= 47;

e10..  - 74*x92 - 5*x93 + 56*x94 + 13*x96 - 11*x97 - 93*x98 - 34*x99 - 15*x100
       + 16*x101 - 83*x102 + 34*x103 + 17*x104 - 53*x105 + 48*x106 + 91*x107
       + 72*x108 - 86*x109 + 7*x110 - 24*x111 - x120 =L= -100;

e11..    43*x92 - 90*x93 - 96*x94 + 51*x95 + 25*x96 + 86*x97 + 9*x98 - 17*x99
       - 22*x100 - 61*x101 - 39*x102 - 58*x103 + 21*x104 - 26*x105 - 68*x106
       - 8*x107 + 60*x108 - 64*x109 + 43*x110 - 5*x111 - x121 =L= -72;

e12..    26*x92 - 52*x93 - 76*x94 + 74*x95 - 80*x96 + 50*x97 - 24*x98 + 10*x99
       - 85*x100 - 25*x101 + 24*x102 + 57*x103 - 16*x104 + 64*x105 + 9*x106
       + 45*x107 - 2*x108 - 48*x109 - 2*x111 - x122 =L= -2;

e13..    69*x92 + 83*x93 - 28*x94 + 8*x95 + 20*x96 + 21*x97 - 12*x98 + 41*x99
       - 57*x100 + 52*x101 - 39*x102 + 57*x103 - 82*x104 + 79*x105 + 86*x106
       + 93*x107 + 23*x108 - 87*x109 - 78*x110 + 25*x111 - x123 =L= -86;

e14..    11*x92 - 53*x93 + 22*x94 + 86*x95 + 13*x96 + 14*x97 - 7*x98 - 76*x99
       - 53*x100 + 99*x101 + 11*x102 + 72*x103 - 43*x104 + 45*x105 + 64*x106
       - 2*x107 + 18*x108 - 78*x109 - 69*x110 + 39*x111 - x124 =L= 18;

e15..    76*x92 - 14*x93 - 58*x94 - 64*x95 + 37*x96 - 57*x97 - 47*x98 - 56*x99
       - x100 - 47*x101 - 11*x102 - 53*x103 - 41*x104 + 29*x105 + 49*x106
       + 38*x107 - 15*x108 + 51*x109 - 20*x110 - 25*x111 - x125 =L= 27;

e16..    6*x92 + 79*x93 + 30*x94 + 86*x95 - 99*x96 - 66*x97 + 28*x98 + 52*x99
       + 34*x100 + 53*x101 + 50*x102 + 79*x103 - 57*x104 + 26*x105 + 19*x106
       + 24*x107 - 27*x108 - 86*x109 - 50*x110 - 28*x111 - x126 =L= -3;

e17..  - 42*x93 - 53*x94 + 32*x95 + 79*x96 + 33*x97 - 92*x98 + 67*x99 + 13*x100
       - 64*x101 - 95*x102 - 5*x103 + 12*x104 - 67*x105 + 21*x106 + 28*x107
       - 39*x108 + 91*x109 + 52*x110 + 26*x111 - x127 =L= -87;

e18..  - 74*x92 + 51*x93 - 4*x94 + 42*x95 - 77*x96 + 27*x97 - 20*x98 + 40*x99
       + 56*x100 + 40*x101 - 47*x102 + 55*x103 - 74*x104 - 45*x105 - 84*x106
       - 58*x107 - 61*x108 + 23*x109 + 20*x110 + 9*x111 - x128 =L= 13;

e19..  - 75*x92 - 86*x93 + 76*x94 - 70*x95 + 12*x96 - 37*x97 - 33*x98 - 59*x99
       + 34*x100 - 93*x101 - 92*x102 + 63*x103 - 88*x104 + 41*x105 - 18*x106
       + 77*x107 + 87*x108 - 100*x109 - 30*x110 + 87*x111 - x129 =L= 98;

e20..  - 28*x92 + 95*x93 - 95*x94 - 32*x95 + 69*x96 - 12*x97 + 40*x98 + 13*x99
       - 80*x100 - 64*x101 - 52*x102 + 36*x103 + 97*x104 + 2*x105 + 80*x106
       - 7*x107 - 5*x108 - 19*x109 + 51*x110 - 77*x111 - x130 =L= -71;

e21..    39*x92 - 48*x93 + 5*x94 - 87*x95 - 71*x96 - 18*x97 - 84*x98 + 27*x99
       - 97*x100 - 52*x101 + 15*x102 - 68*x103 - 47*x104 - 85*x105 - 71*x106
       - 83*x107 - 72*x108 - 6*x109 + 44*x110 - 5*x111 - x131 =L= 11;

e22..  - x92 - 84*x93 - 41*x94 - 41*x95 - 34*x96 - 83*x97 - 81*x98 - 60*x99
       - 79*x100 - 66*x101 + 66*x102 + 65*x103 + 84*x104 + 6*x105 - 6*x106
       + 39*x107 + x108 + 53*x109 + 96*x110 - 7*x111 - x132 =L= 33;

e23..    78*x92 + 70*x93 + 50*x94 + 42*x95 - 83*x96 + 59*x97 - 25*x98 - 9*x99
       - 27*x100 + 55*x101 + 19*x102 - 89*x103 - 76*x104 + 11*x105 + 30*x106
       - 88*x107 + 4*x108 + 68*x109 - 69*x110 - 100*x111 - x133 =L= 79;

e24..  - 57*x92 - 63*x93 + 93*x94 + 63*x95 + 41*x96 + 17*x97 + 35*x98 + 54*x99
       - 54*x100 - 57*x101 - 26*x102 + 64*x103 - 68*x104 + 22*x105 - 76*x106
       - 13*x107 - 100*x108 + 3*x109 - 8*x110 + 37*x111 - x134 =L= -94;

e25..  - 19*x92 - 44*x94 + 99*x95 - 27*x96 - 26*x97 + 90*x98 - 84*x99 + 22*x100
       + 58*x101 - 29*x102 + 94*x103 - 64*x104 - 14*x105 + 56*x106 - 77*x107
       + 6*x108 - 52*x109 + 22*x110 + 55*x111 - x135 =L= -64;

e26..  - 2*x92 + 86*x93 - 37*x94 - 28*x95 - 80*x96 - 26*x97 + 77*x98 + 78*x99
       + 97*x100 - 79*x101 - 70*x102 + 87*x103 + 56*x104 + 75*x105 - 48*x106
       - 75*x107 + 7*x108 - 31*x109 - 23*x110 - 26*x111 - x136 =L= -5;

e27..    45*x92 + 86*x93 - x94 - 5*x95 + 91*x96 - 40*x97 - 10*x98 + 64*x99
       - 24*x100 + 45*x101 - 31*x102 + 31*x103 + 72*x104 + 32*x105 + 60*x106
       + 85*x107 - 36*x108 - 5*x109 + 13*x110 - 15*x111 - x137 =L= 89;

e28..  - 83*x92 - 15*x93 - 38*x94 + 39*x95 - 29*x96 + 6*x97 - 78*x98 + 47*x99
       + 85*x100 - 72*x101 + 88*x102 - 96*x103 - 20*x104 - 60*x105 - 80*x106
       - 93*x107 - 19*x108 - 11*x109 + 36*x110 - 49*x111 - x138 =L= 62;

e29..  - 81*x92 + 29*x93 + x94 - 69*x96 + 26*x97 - 79*x98 - 58*x99 + 77*x100
       + 97*x101 - 97*x102 + 72*x103 - 76*x104 - 74*x105 + 13*x106 - 74*x107
       + 72*x108 + 8*x109 - 11*x110 - 37*x111 - x139 =L= -14;

e30..    93*x92 + 61*x93 + 44*x94 + 68*x95 + 86*x96 - 77*x97 - 7*x98 - 22*x99
       - 24*x100 - 50*x101 - 74*x102 + 24*x103 + 23*x104 - 2*x105 + 3*x106
       + 56*x107 - 45*x108 - 15*x109 - 79*x110 - 54*x111 - x140 =L= 80;

e31..    15*x92 + 62*x93 + 56*x94 + 41*x95 - 32*x96 + 87*x97 - 59*x98 + 44*x99
       + 66*x100 - 31*x101 - 35*x102 - 32*x103 + 5*x104 + 10*x105 - 97*x106
       - 9*x107 - 50*x109 + x110 - 52*x111 - x141 =L= 21;

e32..  - 41*x92 + 82*x93 + 13*x94 - 41*x95 - 3*x96 - 72*x97 + 28*x98 - 74*x99
       + 64*x100 + 2*x101 - 19*x102 - 69*x103 + 43*x104 - 4*x105 + 43*x106
       + 70*x107 + 67*x108 - 5*x109 + 82*x110 - 84*x111 - x142 =L= -67;

e33..    35*x92 + 53*x93 + 82*x94 - 14*x95 + 71*x96 - 30*x97 + 33*x98 - 57*x99
       - 2*x100 - 60*x101 - 18*x102 - 23*x103 + 73*x104 - 22*x105 + 53*x106
       + 12*x107 - 25*x108 + 81*x109 + 69*x110 - 44*x111 - x143 =L= 71;

e34..    94*x92 + 52*x93 - 68*x94 - 64*x95 + 3*x96 - 38*x97 + 96*x98 + 43*x99
       + 15*x100 - 16*x101 - 17*x102 - 59*x103 + 90*x104 + 76*x105 - 99*x106
       - 84*x107 - 42*x108 + 73*x109 + 95*x110 + 28*x111 - x144 =L= -16;

e35..    73*x92 - 37*x93 + 98*x94 - 85*x95 - 45*x96 + 66*x97 - 94*x98 + 52*x99
       - 23*x100 - 54*x101 - 90*x102 - 34*x103 + 95*x104 + 49*x105 + 19*x106
       + 23*x107 + 22*x108 + 13*x109 - 34*x110 + 22*x111 - x145 =L= -21;

e36..    46*x92 - 96*x93 - 23*x94 + 22*x95 + 19*x96 + 87*x97 + 57*x98 + 63*x99
       + 64*x100 + 22*x101 - 38*x102 + 63*x103 - 92*x104 - 62*x105 + 16*x106
       - 65*x107 - 12*x108 + x110 - 7*x111 - x146 =L= -38;

e37..  - 67*x92 + 50*x93 - 15*x94 + 14*x95 + 69*x96 + 58*x97 - 75*x98 + 85*x99
       + 15*x100 - 11*x101 + 31*x102 - 55*x103 - 93*x104 - 34*x105 - 81*x106
       - 18*x107 + 34*x108 + 5*x109 - 87*x110 + 63*x111 - x147 =L= -79;

e38..  - 38*x92 + 79*x93 - 71*x94 - 67*x95 + 68*x96 - 96*x97 + 98*x98 + 11*x99
       + 16*x100 - 39*x101 - 74*x102 + 90*x103 - 81*x104 - 75*x105 + 6*x106
       - 22*x107 - 57*x108 - 21*x109 - 61*x110 + 92*x111 - x148 =L= 8;

e39..    41*x92 - 33*x93 + 64*x94 + 7*x95 + 54*x96 - 93*x97 + 87*x98 + 55*x99
       - 9*x100 + 84*x101 - 75*x102 - 88*x103 + 79*x104 - 49*x105 + 79*x106
       - 25*x107 - 97*x108 + 15*x109 + 20*x110 - 88*x111 - x149 =L= -8;

e40..    56*x92 - 14*x93 - 71*x94 - 59*x95 + 83*x96 + 47*x97 - 50*x98 - 42*x99
       - 69*x100 + 92*x101 + 68*x102 - 64*x103 + 35*x104 - 35*x105 - 67*x106
       + 58*x107 + 34*x108 + 35*x109 - 51*x110 - 54*x111 - x150 =L= 36;

e41..  - 38*x92 - 27*x93 + 69*x94 + 72*x95 + 50*x96 - 77*x97 - 55*x98 + 95*x99
       - 92*x100 + 19*x101 + 3*x102 - 19*x103 - 61*x104 + 34*x105 + 2*x106
       + 56*x107 - 6*x108 - 49*x109 - 76*x110 + 26*x111 - x151 =L= 22;

e42..    6*x92 - 76*x93 - 50*x94 - 95*x95 - 25*x96 - 50*x97 + 21*x98 - 96*x99
       - 96*x100 - 46*x101 + 88*x102 + 48*x103 + 2*x104 - 48*x105 + 94*x106
       + 32*x107 + 66*x108 - 91*x109 + 7*x110 - 34*x111 - x152 =L= -30;

e43..  - 77*x92 - 65*x93 + 93*x94 + 65*x95 + 22*x96 + 34*x97 - 98*x98 + 99*x99
       - 73*x100 - 93*x101 - 14*x102 + 49*x103 + 54*x104 + 23*x105 - 93*x106
       - 63*x107 - 87*x108 - 22*x109 + 16*x110 + 99*x111 - x153 =L= 91;

e44..  - 70*x92 + 67*x93 - 18*x94 - 88*x95 - 70*x96 + 80*x97 + 39*x98 - 11*x99
       - 49*x100 - 62*x101 - 32*x102 + 46*x103 - 31*x104 + 69*x105 - 47*x106
       + 23*x107 - 78*x108 + 45*x109 - 66*x110 - 94*x111 - x154 =L= 2;

e45..  - 67*x92 + 31*x93 - 29*x94 - 5*x95 + 5*x96 + 94*x97 + 77*x98 - 42*x99
       + 63*x100 - 36*x101 - 70*x102 + 37*x103 + 45*x104 - 86*x105 + 49*x106
       - 22*x107 + 95*x108 + 3*x109 - 19*x110 - x155 =L= -4;

e46..    54*x92 + 72*x93 + 45*x94 + 61*x95 + 3*x96 - 7*x97 - 22*x98 + 52*x99
       - 8*x100 + 71*x101 - 61*x102 + 87*x103 - 9*x104 - 28*x105 - 65*x106
       - 71*x107 - 53*x108 + 13*x109 - x110 + 52*x111 - x156 =L= -26;

e47..    61*x92 + 47*x93 + 44*x94 + 82*x95 - 62*x96 - 21*x97 - 80*x98 - 77*x99
       - 67*x100 + 86*x101 - 62*x102 + 64*x103 + 83*x104 - 66*x105 + 79*x106
       - 59*x107 - 96*x108 - 67*x109 - 61*x110 + 37*x111 - x157 =L= 75;

e48..  - 84*x92 - 61*x93 + 45*x94 + 67*x95 + 33*x96 + 59*x97 - 93*x98 + 46*x99
       - 4*x100 + 64*x101 + 50*x102 + 51*x103 - 52*x104 - 45*x105 - 23*x106
       + 34*x107 + 33*x108 + 56*x109 - 35*x110 + 45*x111 - x158 =L= -83;

e49..  - 63*x92 - 25*x93 + 10*x94 + 9*x95 + 34*x96 - 10*x97 + 14*x98 - 27*x99
       + 94*x100 + 17*x101 + 73*x102 - 95*x103 - 93*x104 + 49*x105 - 59*x106
       - 29*x107 - 29*x108 + 29*x109 + 74*x110 - 57*x111 - x159 =L= 97;

e50..    59*x92 - 93*x93 - 24*x94 + 99*x95 - 6*x96 + 17*x97 - 97*x98 + 98*x99
       - 70*x100 - 90*x101 - 71*x102 + 99*x103 - 59*x104 + 41*x105 + 45*x106
       - 31*x107 - 85*x108 - 53*x109 + 76*x110 - 78*x111 - x160 =L= 20;

e51..  - 26*x92 - 35*x93 - 27*x94 - 79*x95 - 93*x96 - 21*x97 + 52*x98 + 85*x99
       + 6*x100 + 5*x101 - 95*x102 - 77*x103 - 14*x104 - 81*x105 - 62*x106
       - 8*x107 - 33*x108 + 76*x109 - 15*x110 + 14*x111 - x161 =L= 15;

e52..  - 26*x92 - 28*x93 - 70*x94 - 96*x95 + 98*x96 - 67*x97 - 76*x98 + 33*x99
       + 16*x100 + 45*x101 - 37*x102 - 30*x103 - 10*x104 - 20*x105 - 39*x106
       - 24*x107 + 79*x108 - 81*x109 + 71*x110 - 86*x111 - x162 =L= -51;

e53..  - 63*x92 + 23*x93 + 16*x94 - 58*x95 - 9*x96 + 21*x97 + 86*x98 - 89*x99
       - 19*x100 - 7*x102 + 46*x103 + 78*x104 + 40*x105 - 86*x106 + 2*x107
       + x108 - 89*x109 + 50*x110 - 80*x111 - x163 =L= -42;

e54..    81*x92 + 73*x93 - 26*x94 - 95*x95 + 40*x96 - 91*x97 + 16*x98 + 88*x99
       + 70*x100 - 10*x101 + 13*x102 + 61*x103 + 23*x104 - 43*x105 + 5*x106
       + 55*x107 - 85*x108 + 54*x109 - 51*x110 + 63*x111 - x164 =L= -32;

e55..  - 84*x92 - 64*x93 - 23*x94 + 17*x95 + 72*x96 - 50*x97 - 55*x98 - 38*x99
       + 14*x100 + 87*x101 + 42*x102 - 48*x103 - 83*x104 + 95*x105 + 2*x106
       - 30*x107 - 8*x108 - 29*x109 + 59*x110 - 56*x111 - x165 =L= 25;

e56..  - 68*x92 - 6*x93 - 23*x94 - 33*x95 + 11*x96 + 39*x97 + 52*x98 - 75*x99
       - 99*x100 + 37*x101 + 52*x102 - 48*x103 - 73*x104 - 34*x105 + 54*x106
       - 55*x107 + 78*x108 + 26*x109 + 14*x110 - 31*x111 - x166 =L= -27;

e57..    41*x92 - 85*x93 - 34*x94 - 70*x95 - 87*x96 - 47*x97 - 13*x98 - 46*x99
       + 58*x100 - 27*x101 - 96*x102 + 6*x103 - 86*x104 + 59*x105 + 17*x106
       - 54*x107 + 99*x108 - 18*x109 + 55*x110 + 9*x111 - x167 =L= 71;

e58..  - 88*x92 + 64*x93 + 24*x94 - 93*x95 - 9*x96 - 7*x97 - 52*x98 + 67*x99
       - 37*x100 + 30*x101 + 25*x102 + 83*x103 + 29*x104 + 2*x105 + 85*x106
       + 42*x107 + 9*x108 + 2*x109 - 5*x110 - 25*x111 - x168 =L= -66;

e59..  - 3*x92 - 81*x93 - 19*x94 - 15*x95 + 18*x96 - 60*x97 - 18*x98 + 13*x99
       - 17*x100 + 77*x101 - 56*x102 + 33*x103 + 60*x104 + 16*x105 + 94*x106
       + 63*x108 + 21*x109 + 37*x110 - 69*x111 - x169 =L= 26;

e60..    94*x92 - 31*x93 + 29*x94 + 5*x95 - 45*x96 - 90*x97 + 84*x98 - 39*x99
       + 9*x100 - 25*x101 - 80*x102 - 15*x103 + 33*x105 + 42*x106 - 24*x107
       - 64*x108 + 78*x109 + 82*x110 - 69*x111 - x170 =L= 75;

e61..  - 79*x92 - 28*x93 - 100*x94 + 76*x95 + 37*x96 + 69*x97 - 38*x98 + 40*x99
       + 99*x100 - 13*x101 - 4*x102 + 79*x103 + 16*x104 + 9*x105 - 84*x106
       + 97*x107 - 28*x108 - 67*x109 - 42*x110 + 53*x111 - x171 =L= 98;

e62..    6*x92 - 18*x93 + 36*x94 + x95 + 26*x96 + 68*x97 + 71*x98 + 78*x99
       - 31*x100 + 57*x101 + 17*x102 - 56*x103 + 5*x104 - 54*x105 - 5*x106
       - 100*x107 - 36*x108 - 38*x109 - x110 - 5*x111 - x172 =L= 15;

e63..    74*x92 - 36*x93 - 42*x94 - 84*x95 - 6*x96 - 63*x97 + 8*x98 + 87*x99
       + 32*x100 + 63*x101 - 61*x102 + 49*x103 + 85*x104 - 60*x105 + 97*x106
       - 23*x107 - 36*x108 + 59*x109 - 57*x110 - 6*x111 - x173 =L= -56;

e64..    12*x92 + 41*x93 - 67*x94 + 67*x95 - 51*x96 + 47*x97 - 3*x98 + 2*x99
       + 14*x100 + 77*x101 + 47*x102 + 51*x103 + 87*x104 - 5*x105 - 38*x106
       + 56*x107 + 91*x108 - 22*x109 - 3*x110 + 37*x111 - x174 =L= -24;

e65..  - 94*x92 - 68*x93 + 21*x94 - 56*x95 - 93*x96 + 14*x97 + 44*x98 + 93*x99
       + 69*x100 + 75*x101 + 17*x102 - 11*x103 + 61*x104 + 89*x105 + 98*x106
       - 90*x107 + 41*x108 + 76*x109 + 32*x110 - 2*x111 - x175 =L= 86;

e66..  - 61*x92 - 95*x93 - 9*x94 - 87*x95 + 56*x96 - 83*x97 + 11*x98 + 48*x99
       + 50*x100 + 99*x101 - 54*x102 - 30*x103 - 45*x104 + 24*x105 + 69*x106
       + 78*x107 - 6*x108 + 69*x109 - 43*x110 - 25*x111 - x176 =L= 54;

e67..    14*x92 - 17*x93 + 14*x94 - 99*x95 - 60*x96 - 21*x97 - 38*x98 - 49*x99
       + 24*x100 + 19*x101 - 30*x102 - 92*x103 + 7*x104 - 80*x105 - 42*x106
       - 50*x107 + 98*x108 + 58*x109 + 97*x110 - 15*x111 - x177 =L= -6;

e68..  - 67*x92 - 21*x93 + 55*x94 + 11*x95 - 80*x96 + 97*x97 + 47*x98 - 42*x99
       + 36*x100 - 19*x101 - 14*x102 - 16*x103 - 85*x104 - 45*x105 + 59*x106
       + 22*x107 - 37*x108 - 43*x109 - 51*x110 - 49*x111 - x178 =L= 72;

e69..    46*x92 + 20*x93 - 87*x94 + 81*x95 - 49*x96 - 6*x97 - 57*x98 + 88*x99
       - 30*x100 - 47*x101 - 84*x102 - 13*x103 + 78*x104 - 14*x105 - 18*x106
       - 63*x107 + 67*x108 - 59*x109 - 41*x111 - x179 =L= 10;

e70..    93*x92 - 79*x93 - 73*x94 + 57*x95 + 29*x96 + 5*x97 + 86*x98 - 66*x99
       - 99*x100 + 25*x101 - 62*x102 + 17*x103 - 65*x104 + 20*x105 - 31*x106
       - 14*x107 + 22*x108 + 9*x109 + 71*x110 + 23*x111 - x180 =L= -4;

e71..  - 54*x92 - 89*x93 + 91*x94 - 84*x95 - 74*x96 - 4*x97 - 25*x98 - 71*x99
       - 3*x100 - 77*x101 - 16*x102 + 98*x103 - 47*x104 - 5*x105 + 33*x106
       - 12*x107 + 44*x108 - 64*x109 + 76*x110 - 39*x111 - x181 =L= -95;

e72..    40*x92 - 79*x93 - 2*x94 + 4*x95 + 45*x96 - 38*x97 + 45*x98 + 54*x99
       + 29*x100 + 28*x101 - 30*x102 - 76*x103 + 10*x104 - 5*x105 - 9*x106
       - 56*x107 + 54*x108 - 46*x109 + 16*x110 + 14*x111 - x182 =L= 57;

e73..  - 72*x92 + 5*x93 - 52*x94 - 85*x95 - 43*x96 + 82*x97 + 93*x98 - 62*x99
       + 90*x100 + 16*x101 - 44*x102 + 10*x103 - 74*x104 - 6*x105 - 65*x106
       + 84*x107 + 87*x108 + 58*x109 - 90*x110 - 9*x111 - x183 =L= -52;

e74..    70*x92 + 19*x93 + 30*x94 - 30*x95 - 79*x96 + 85*x97 - 56*x98 + 47*x99
       - 75*x100 + 81*x101 + 72*x102 + 94*x103 + 63*x104 + 75*x105 - 36*x106
       + 10*x107 - 66*x108 - 33*x109 + 78*x110 + 89*x111 - x184 =L= -11;

e75..    84*x92 + 33*x93 + 81*x94 + 51*x95 - 40*x96 + 68*x97 + 32*x98 + 69*x99
       - 60*x100 + 80*x101 + 75*x102 + 26*x103 - 93*x104 - 24*x105 - 60*x106
       - 83*x107 - 3*x108 + 12*x109 - 45*x110 + 58*x111 - x185 =L= 93;

e76..  - 65*x92 - 24*x93 - 18*x94 - 6*x95 - 70*x96 + 56*x97 + 52*x98 + 54*x99
       - 51*x100 + 10*x101 - 73*x102 + 25*x103 - 93*x104 - 99*x105 - x106
       + 70*x107 - 39*x108 + 45*x109 + 46*x110 - 9*x111 - x186 =L= 16;

e77..    58*x92 + 74*x93 + 38*x94 - 84*x95 + 87*x96 + 66*x97 + 81*x98 - 88*x99
       + 83*x100 - 22*x101 + 58*x102 + 47*x103 - 62*x104 - 70*x105 - 16*x106
       + 15*x107 - 83*x108 + 93*x109 - 26*x110 + 35*x111 - x187 =L= 54;

e78..  - 7*x92 + 5*x93 + 91*x94 + 94*x95 + 80*x96 + 43*x97 + 18*x98 - 82*x99
       + 74*x100 - 68*x101 - 51*x102 + 74*x103 + 9*x104 - 83*x105 + 76*x106
       + 52*x107 + 50*x108 + 75*x109 + 36*x110 - 11*x111 - x188 =L= 79;

e79..  - 40*x92 + 36*x93 - 45*x94 - 15*x95 - 82*x96 - 84*x97 + 88*x98 + 32*x99
       + 91*x100 - 59*x101 + 70*x102 + 31*x103 + 57*x104 + 53*x105 - 54*x106
       - 84*x107 + 53*x108 - 19*x109 - 87*x110 + 34*x111 - x189 =L= 76;

e80..    97*x92 + 88*x93 + 25*x94 + 71*x95 - 86*x96 - 83*x97 - 94*x98 - 60*x99
       - 93*x100 - 88*x101 - 30*x102 - 51*x103 + 57*x104 - 49*x105 - 43*x106
       - 34*x107 - 34*x108 - 41*x109 - 17*x110 - 18*x111 - x190 =L= 35;

e81..  - 39*x92 + 47*x93 - 96*x94 + 14*x95 + 33*x96 + 26*x97 + 67*x98 + 11*x99
       - 47*x100 + 93*x101 - x102 - 66*x103 + 74*x104 + 16*x105 + 34*x106
       + 80*x107 + 66*x108 - 80*x109 - 42*x110 - x191 =L= -90;

e82..    56*x92 - 41*x93 - 100*x94 + 51*x95 + 78*x96 - 56*x97 + 65*x98 + 60*x99
       - 72*x100 - 59*x101 + 52*x102 + 27*x103 + 54*x104 - 98*x105 - 4*x106
       - 2*x107 + 6*x108 - 93*x109 + 99*x110 - 46*x111 - x192 =L= -84;

e83..    36*x92 - 23*x93 - 90*x94 + 76*x95 + 19*x96 - 35*x97 + 33*x98 - 23*x99
       - 50*x100 - 70*x101 + 81*x102 + 31*x103 + 50*x104 + 11*x105 + 38*x106
       + 56*x107 - 4*x108 + 70*x109 + 28*x110 + 92*x111 - x193 =L= 51;

e84..  - 86*x92 - 56*x93 + 30*x94 - 42*x95 + 57*x96 + 47*x97 + 49*x98 + 98*x99
       + 26*x100 + 28*x101 + 91*x102 - 19*x103 - 95*x104 + 34*x105 + 62*x106
       - 7*x107 - 71*x108 + 30*x109 + 38*x110 - 92*x111 - x194 =L= 79;

e85..  - 16*x92 - 34*x93 - 23*x94 - 72*x95 - 84*x96 - 87*x98 - 37*x99 - 10*x100
       + 32*x101 + 98*x102 + 92*x103 + 60*x104 + 56*x105 + 91*x106 + 34*x107
       - 80*x108 - 67*x109 - 16*x110 - 15*x111 - x195 =L= 38;

e86..    71*x92 + 55*x93 - 95*x94 - 15*x95 - 54*x96 + 61*x97 - 79*x98 + 57*x99
       + 68*x100 - 71*x101 - 33*x102 - 45*x103 - 96*x104 + 82*x105 + 14*x106
       + 80*x107 - 98*x108 + 3*x109 + 89*x110 + 63*x111 - x196 =L= -29;

e87..    35*x92 + 5*x93 - 55*x94 - 48*x95 - 21*x96 + 79*x97 - 24*x98 - 51*x99
       + 22*x100 - 33*x101 + 6*x102 - 67*x103 + 83*x104 - 69*x105 + 93*x106
       + 39*x107 + 40*x108 - 20*x109 + 90*x110 + 99*x111 - x197 =L= -24;

e88..    74*x92 + 13*x93 + 68*x94 + 17*x95 + 16*x96 - 3*x97 - 2*x98 - 17*x99
       - 24*x100 + 85*x101 + 41*x102 - 98*x103 - 50*x104 + 52*x105 + 95*x106
       - 53*x107 + 88*x108 - 56*x109 - 98*x110 - 44*x111 - x198 =L= 4;

e89..    86*x92 + 53*x93 - 57*x94 - 10*x95 + 59*x96 - 55*x98 - 80*x99 + 61*x100
       - 60*x101 - 57*x102 + 16*x103 + 71*x104 - 44*x105 - 12*x106 - 78*x107
       + 87*x108 + 81*x109 + 13*x110 + 8*x111 - x199 =L= 53;

e90..  - 24*x92 + 90*x93 + 67*x94 + 26*x95 - 59*x96 - 61*x97 - 60*x98 + 12*x99
       + 41*x100 - 43*x101 - 23*x102 - 11*x103 + 11*x105 - 43*x106 + 90*x107
       - 82*x108 + 61*x109 - 97*x110 - 92*x111 - x200 =L= 24;

e91..  - 61*x92 - 42*x93 - 78*x94 + 51*x95 + 23*x96 + 31*x97 - 81*x98 + 98*x99
       - 18*x100 + 96*x101 - 14*x102 - 82*x103 + 62*x104 + 48*x105 - 65*x106
       - 72*x107 - 61*x108 + 20*x109 - 42*x110 + 69*x111 - x201 =L= 49;

e92..  - b2 - x202 =E= -1;

e93..  - b3 - x203 =E= -1;

e94..  - b4 - x204 =E= -1;

e95..  - b5 - x205 =E= -1;

e96..  - b6 - x206 =E= -1;

e97..  - b7 - x207 =E= -1;

e98..  - b8 - x208 =E= -1;

e99..  - b9 - x209 =E= -1;

e100..  - b10 - x210 =E= -1;

e101..  - b11 - x211 =E= -1;

e102..  - b12 - x212 =E= -1;

e103..  - b13 - x213 =E= -1;

e104..  - b14 - x214 =E= -1;

e105..  - b15 - x215 =E= -1;

e106..  - b16 - x216 =E= -1;

e107..  - b17 - x217 =E= -1;

e108..  - b18 - x218 =E= -1;

e109..  - b19 - x219 =E= -1;

e110..  - b20 - x220 =E= -1;

e111..  - b21 - x221 =E= -1;

e112..  - b22 - x222 =E= -1;

e113..  - b23 - x223 =E= -1;

e114..  - b24 - x224 =E= -1;

e115..  - b25 - x225 =E= -1;

e116..  - b26 - x226 =E= -1;

e117..  - b27 - x227 =E= -1;

e118..  - b28 - x228 =E= -1;

e119..  - b29 - x229 =E= -1;

e120..  - b30 - x230 =E= -1;

e121..  - b31 - x231 =E= -1;

e122..  - b32 - x232 =E= -1;

e123..  - b33 - x233 =E= -1;

e124..  - b34 - x234 =E= -1;

e125..  - b35 - x235 =E= -1;

e126..  - b36 - x236 =E= -1;

e127..  - b37 - x237 =E= -1;

e128..  - b38 - x238 =E= -1;

e129..  - b39 - x239 =E= -1;

e130..  - b40 - x240 =E= -1;

e131..  - b41 - x241 =E= -1;

e132..  - b42 - x242 =E= -1;

e133..  - b43 - x243 =E= -1;

e134..  - b44 - x244 =E= -1;

e135..  - b45 - x245 =E= -1;

e136..  - b46 - x246 =E= -1;

e137..  - b47 - x247 =E= -1;

e138..  - b48 - x248 =E= -1;

e139..  - b49 - x249 =E= -1;

e140..  - b50 - x250 =E= -1;

e141..  - b51 - x251 =E= -1;

e142..  - b52 - x252 =E= -1;

e143..  - b53 - x253 =E= -1;

e144..  - b54 - x254 =E= -1;

e145..  - b55 - x255 =E= -1;

e146..  - b56 - x256 =E= -1;

e147..  - b57 - x257 =E= -1;

e148..  - b58 - x258 =E= -1;

e149..  - b59 - x259 =E= -1;

e150..  - b60 - x260 =E= -1;

e151..  - b61 - x261 =E= -1;

e152..  - b62 - x262 =E= -1;

e153..  - b63 - x263 =E= -1;

e154..  - b64 - x264 =E= -1;

e155..  - b65 - x265 =E= -1;

e156..  - b66 - x266 =E= -1;

e157..  - b67 - x267 =E= -1;

e158..  - b68 - x268 =E= -1;

e159..  - b69 - x269 =E= -1;

e160..  - b70 - x270 =E= -1;

e161..  - b71 - x271 =E= -1;

e162..  - b72 - x272 =E= -1;

e163..  - b73 - x273 =E= -1;

e164..  - b74 - x274 =E= -1;

e165..  - b75 - x275 =E= -1;

e166..  - b76 - x276 =E= -1;

e167..  - b77 - x277 =E= -1;

e168..  - b78 - x278 =E= -1;

e169..  - b79 - x279 =E= -1;

e170..  - b80 - x280 =E= -1;

e171..  - b81 - x281 =E= -1;

e172..  - b82 - x282 =E= -1;

e173..  - b83 - x283 =E= -1;

e174..  - b84 - x284 =E= -1;

e175..  - b85 - x285 =E= -1;

e176..  - b86 - x286 =E= -1;

e177..  - b87 - x287 =E= -1;

e178..  - b88 - x288 =E= -1;

e179..  - b89 - x289 =E= -1;

e180..  - b90 - x290 =E= -1;

e181..  - b91 - x291 =E= -1;

e182.. x202*x112 =E= 0;

e183.. x203*x113 =E= 0;

e184.. x204*x114 =E= 0;

e185.. x205*x115 =E= 0;

e186.. x206*x116 =E= 0;

e187.. x207*x117 =E= 0;

e188.. x208*x118 =E= 0;

e189.. x209*x119 =E= 0;

e190.. x210*x120 =E= 0;

e191.. x211*x121 =E= 0;

e192.. x212*x122 =E= 0;

e193.. x213*x123 =E= 0;

e194.. x214*x124 =E= 0;

e195.. x215*x125 =E= 0;

e196.. x216*x126 =E= 0;

e197.. x217*x127 =E= 0;

e198.. x218*x128 =E= 0;

e199.. x219*x129 =E= 0;

e200.. x220*x130 =E= 0;

e201.. x221*x131 =E= 0;

e202.. x222*x132 =E= 0;

e203.. x223*x133 =E= 0;

e204.. x224*x134 =E= 0;

e205.. x225*x135 =E= 0;

e206.. x226*x136 =E= 0;

e207.. x227*x137 =E= 0;

e208.. x228*x138 =E= 0;

e209.. x229*x139 =E= 0;

e210.. x230*x140 =E= 0;

e211.. x231*x141 =E= 0;

e212.. x232*x142 =E= 0;

e213.. x233*x143 =E= 0;

e214.. x234*x144 =E= 0;

e215.. x235*x145 =E= 0;

e216.. x236*x146 =E= 0;

e217.. x237*x147 =E= 0;

e218.. x238*x148 =E= 0;

e219.. x239*x149 =E= 0;

e220.. x240*x150 =E= 0;

e221.. x241*x151 =E= 0;

e222.. x242*x152 =E= 0;

e223.. x243*x153 =E= 0;

e224.. x244*x154 =E= 0;

e225.. x245*x155 =E= 0;

e226.. x246*x156 =E= 0;

e227.. x247*x157 =E= 0;

e228.. x248*x158 =E= 0;

e229.. x249*x159 =E= 0;

e230.. x250*x160 =E= 0;

e231.. x251*x161 =E= 0;

e232.. x252*x162 =E= 0;

e233.. x253*x163 =E= 0;

e234.. x254*x164 =E= 0;

e235.. x255*x165 =E= 0;

e236.. x256*x166 =E= 0;

e237.. x257*x167 =E= 0;

e238.. x258*x168 =E= 0;

e239.. x259*x169 =E= 0;

e240.. x260*x170 =E= 0;

e241.. x261*x171 =E= 0;

e242.. x262*x172 =E= 0;

e243.. x263*x173 =E= 0;

e244.. x264*x174 =E= 0;

e245.. x265*x175 =E= 0;

e246.. x266*x176 =E= 0;

e247.. x267*x177 =E= 0;

e248.. x268*x178 =E= 0;

e249.. x269*x179 =E= 0;

e250.. x270*x180 =E= 0;

e251.. x271*x181 =E= 0;

e252.. x272*x182 =E= 0;

e253.. x273*x183 =E= 0;

e254.. x274*x184 =E= 0;

e255.. x275*x185 =E= 0;

e256.. x276*x186 =E= 0;

e257.. x277*x187 =E= 0;

e258.. x278*x188 =E= 0;

e259.. x279*x189 =E= 0;

e260.. x280*x190 =E= 0;

e261.. x281*x191 =E= 0;

e262.. x282*x192 =E= 0;

e263.. x283*x193 =E= 0;

e264.. x284*x194 =E= 0;

e265.. x285*x195 =E= 0;

e266.. x286*x196 =E= 0;

e267.. x287*x197 =E= 0;

e268.. x288*x198 =E= 0;

e269.. x289*x199 =E= 0;

e270.. x290*x200 =E= 0;

e271.. x291*x201 =E= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
