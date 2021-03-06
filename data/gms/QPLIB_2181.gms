$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        271      181        0       90        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        281      191       90        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*       1432     1252      180        0
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
          ,x272,x273,x274,x275,x276,x277,x278,x279,x280,x281;

Positive Variables  x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112
          ,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125
          ,x126,x127,x128,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138
          ,x139,x140,x141,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151
          ,x152,x153,x154,x155,x156,x157,x158,x159,x160,x161,x162,x163,x164
          ,x165,x166,x167,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177
          ,x178,x179,x180,x181,x182,x183,x184,x185,x186,x187,x188,x189,x190
          ,x191;

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
      + 74*x100 + 48*x101 - x102 =L= -11;

e3..  - 29*x92 + 46*x93 - 48*x94 - 21*x95 + 55*x96 + 68*x97 + 14*x98 + 42*x99
      - 84*x100 - 9*x101 - x103 =L= -78;

e4..    8*x92 - 22*x93 + 13*x94 + 91*x95 + 73*x96 - 68*x97 - 45*x98 - 48*x99
      + 84*x100 - 13*x101 - x104 =L= 57;

e5..  - 75*x92 - 84*x93 + 88*x94 - 95*x95 - 70*x96 - 24*x97 - 69*x98 + 5*x99
      + 75*x100 - 14*x101 - x105 =L= -47;

e6..  - 37*x92 + 53*x93 - 79*x94 + 53*x95 + 40*x96 - 57*x97 + 52*x98 - 18*x99
      + 29*x100 + 85*x101 - x106 =L= 0;

e7..    37*x92 - 13*x93 + 21*x94 + 14*x95 + 26*x96 - 7*x97 + 26*x98 - 73*x99
      + 92*x100 - 71*x101 - x107 =L= -11;

e8..  - 35*x92 + 90*x93 - 29*x94 - 20*x95 - 80*x96 + 90*x97 + 96*x98 + 14*x99
      + 73*x100 - 70*x101 - x108 =L= 81;

e9..    29*x92 - 88*x93 + 90*x94 + 93*x95 + 56*x96 + 60*x97 + 13*x98 - 44*x99
      + 92*x100 + 15*x101 - x109 =L= -13;

e10..  - 25*x92 + 84*x93 - 95*x94 + 53*x95 + 44*x96 + 17*x97 - 15*x98 + 28*x99
       + 49*x100 - 87*x101 - x110 =L= -90;

e11..    54*x92 + 40*x93 - 76*x94 - 40*x95 - 86*x96 + 37*x97 - 27*x98 + 45*x99
       - 61*x100 - 69*x101 - x111 =L= -68;

e12..    66*x92 + 9*x93 - 37*x94 + 5*x95 - 13*x96 - 58*x97 + 45*x98 - 100*x99
       + 16*x100 - 5*x101 - x112 =L= 87;

e13..    52*x92 - 75*x93 - 98*x94 + 68*x96 + 70*x97 - 82*x98 + 71*x99 + 57*x100
       + 15*x101 - x113 =L= -81;

e14..    65*x92 + 49*x93 + 81*x94 + x95 + 76*x96 + 92*x97 + 12*x98 - 5*x99
       - 17*x100 + 29*x101 - x114 =L= 75;

e15..    16*x92 - 56*x93 + 99*x94 - 69*x95 + 38*x96 + 40*x97 + 97*x98 + 29*x99
       + 30*x100 + 68*x101 - x115 =L= 36;

e16..    93*x92 - 34*x93 + 59*x94 - 68*x95 + 72*x96 + 20*x97 - 16*x98 + 96*x99
       + 73*x100 - 7*x101 - x116 =L= -51;

e17..    68*x92 + 68*x93 + 47*x94 - 74*x95 - 5*x96 + 56*x97 + 13*x99 - 11*x100
       - 93*x101 - x117 =L= -34;

e18..  - 15*x92 + 16*x93 - 83*x94 + 34*x95 + 17*x96 - 53*x97 + 48*x98 + 91*x99
       + 72*x100 - 86*x101 - x118 =L= 7;

e19..  - 24*x92 - 100*x93 + 43*x94 - 90*x95 - 96*x96 + 51*x97 + 25*x98 + 86*x99
       + 9*x100 - 17*x101 - x119 =L= -22;

e20..  - 61*x92 - 39*x93 - 58*x94 + 21*x95 - 26*x96 - 68*x97 - 8*x98 + 60*x99
       - 64*x100 + 43*x101 - x120 =L= -5;

e21..  - 72*x92 + 26*x93 - 52*x94 - 76*x95 + 74*x96 - 80*x97 + 50*x98 - 24*x99
       + 10*x100 - 85*x101 - x121 =L= -25;

e22..    24*x92 + 57*x93 - 16*x94 + 64*x95 + 9*x96 + 45*x97 - 2*x98 - 48*x99
       - 2*x101 - x122 =L= -2;

e23..    69*x92 + 83*x93 - 28*x94 + 8*x95 + 20*x96 + 21*x97 - 12*x98 + 41*x99
       - 57*x100 + 52*x101 - x123 =L= -39;

e24..    57*x92 - 82*x93 + 79*x94 + 86*x95 + 93*x96 + 23*x97 - 87*x98 - 78*x99
       + 25*x100 - 86*x101 - x124 =L= 11;

e25..  - 53*x92 + 22*x93 + 86*x94 + 13*x95 + 14*x96 - 7*x97 - 76*x98 - 53*x99
       + 99*x100 + 11*x101 - x125 =L= 72;

e26..  - 43*x92 + 45*x93 + 64*x94 - 2*x95 + 18*x96 - 78*x97 - 69*x98 + 39*x99
       + 18*x100 + 76*x101 - x126 =L= -14;

e27..  - 58*x92 - 64*x93 + 37*x94 - 57*x95 - 47*x96 - 56*x97 - x98 - 47*x99
       - 11*x100 - 53*x101 - x127 =L= -41;

e28..    29*x92 + 49*x93 + 38*x94 - 15*x95 + 51*x96 - 20*x97 - 25*x98 + 27*x99
       + 6*x100 + 79*x101 - x128 =L= 30;

e29..    86*x92 - 99*x93 - 66*x94 + 28*x95 + 52*x96 + 34*x97 + 53*x98 + 50*x99
       + 79*x100 - 57*x101 - x129 =L= 26;

e30..    19*x92 + 24*x93 - 27*x94 - 86*x95 - 50*x96 - 28*x97 - 3*x98 - 42*x100
       - 53*x101 - x130 =L= 32;

e31..    79*x92 + 33*x93 - 92*x94 + 67*x95 + 13*x96 - 64*x97 - 95*x98 - 5*x99
       + 12*x100 - 67*x101 - x131 =L= 21;

e32..    28*x92 - 39*x93 + 91*x94 + 52*x95 + 26*x96 - 87*x97 - 74*x98 + 51*x99
       - 4*x100 + 42*x101 - x132 =L= -77;

e33..    27*x92 - 20*x93 + 40*x94 + 56*x95 + 40*x96 - 47*x97 + 55*x98 - 74*x99
       - 45*x100 - 84*x101 - x133 =L= -58;

e34..  - 61*x92 + 23*x93 + 20*x94 + 9*x95 + 13*x96 - 75*x97 - 86*x98 + 76*x99
       - 70*x100 + 12*x101 - x134 =L= -37;

e35..  - 33*x92 - 59*x93 + 34*x94 - 93*x95 - 92*x96 + 63*x97 - 88*x98 + 41*x99
       - 18*x100 + 77*x101 - x135 =L= 87;

e36..  - 100*x92 - 30*x93 + 87*x94 + 98*x95 - 28*x96 + 95*x97 - 95*x98 - 32*x99
       + 69*x100 - 12*x101 - x136 =L= 40;

e37..    13*x92 - 80*x93 - 64*x94 - 52*x95 + 36*x96 + 97*x97 + 2*x98 + 80*x99
       - 7*x100 - 5*x101 - x137 =L= -19;

e38..    51*x92 - 77*x93 - 71*x94 + 39*x95 - 48*x96 + 5*x97 - 87*x98 - 71*x99
       - 18*x100 - 84*x101 - x138 =L= 27;

e39..  - 97*x92 - 52*x93 + 15*x94 - 68*x95 - 47*x96 - 85*x97 - 71*x98 - 83*x99
       - 72*x100 - 6*x101 - x139 =L= 44;

e40..  - 5*x92 + 11*x93 - x94 - 84*x95 - 41*x96 - 41*x97 - 34*x98 - 83*x99
       - 81*x100 - 60*x101 - x140 =L= -79;

e41..  - 66*x92 + 66*x93 + 65*x94 + 84*x95 + 6*x96 - 6*x97 + 39*x98 + x99
       + 53*x100 + 96*x101 - x141 =L= -7;

e42..    33*x92 + 78*x93 + 70*x94 + 50*x95 + 42*x96 - 83*x97 + 59*x98 - 25*x99
       - 9*x100 - 27*x101 - x142 =L= 55;

e43..    19*x92 - 89*x93 - 76*x94 + 11*x95 + 30*x96 - 88*x97 + 4*x98 + 68*x99
       - 69*x100 - 100*x101 - x143 =L= 79;

e44..  - 57*x92 - 63*x93 + 93*x94 + 63*x95 + 41*x96 + 17*x97 + 35*x98 + 54*x99
       - 54*x100 - 57*x101 - x144 =L= -26;

e45..    64*x92 - 68*x93 + 22*x94 - 76*x95 - 13*x96 - 100*x97 + 3*x98 - 8*x99
       + 37*x100 - 94*x101 - x145 =L= -19;

e46..  - 44*x93 + 99*x94 - 27*x95 - 26*x96 + 90*x97 - 84*x98 + 22*x99 + 58*x100
       - 29*x101 - x146 =L= 94;

e47..  - 64*x92 - 14*x93 + 56*x94 - 77*x95 + 6*x96 - 52*x97 + 22*x98 + 55*x99
       - 64*x100 - 2*x101 - x147 =L= 86;

e48..  - 37*x92 - 28*x93 - 80*x94 - 26*x95 + 77*x96 + 78*x97 + 97*x98 - 79*x99
       - 70*x100 + 87*x101 - x148 =L= 56;

e49..    75*x92 - 48*x93 - 75*x94 + 7*x95 - 31*x96 - 23*x97 - 26*x98 - 5*x99
       + 45*x100 + 86*x101 - x149 =L= -1;

e50..  - 5*x92 + 91*x93 - 40*x94 - 10*x95 + 64*x96 - 24*x97 + 45*x98 - 31*x99
       + 31*x100 + 72*x101 - x150 =L= 32;

e51..    60*x92 + 85*x93 - 36*x94 - 5*x95 + 13*x96 - 15*x97 + 89*x98 - 83*x99
       - 15*x100 - 38*x101 - x151 =L= 39;

e52..  - 29*x92 + 6*x93 - 78*x94 + 47*x95 + 85*x96 - 72*x97 + 88*x98 - 96*x99
       - 20*x100 - 60*x101 - x152 =L= -80;

e53..  - 93*x92 - 19*x93 - 11*x94 + 36*x95 - 49*x96 + 62*x97 - 81*x98 + 29*x99
       + x100 - x153 =L= -69;

e54..    26*x92 - 79*x93 - 58*x94 + 77*x95 + 97*x96 - 97*x97 + 72*x98 - 76*x99
       - 74*x100 + 13*x101 - x154 =L= -74;

e55..    72*x92 + 8*x93 - 11*x94 - 37*x95 - 14*x96 + 93*x97 + 61*x98 + 44*x99
       + 68*x100 + 86*x101 - x155 =L= -77;

e56..  - 7*x92 - 22*x93 - 24*x94 - 50*x95 - 74*x96 + 24*x97 + 23*x98 - 2*x99
       + 3*x100 + 56*x101 - x156 =L= -45;

e57..  - 15*x92 - 79*x93 - 54*x94 + 80*x95 + 15*x96 + 62*x97 + 56*x98 + 41*x99
       - 32*x100 + 87*x101 - x157 =L= -59;

e58..    44*x92 + 66*x93 - 31*x94 - 35*x95 - 32*x96 + 5*x97 + 10*x98 - 97*x99
       - 9*x100 - x158 =L= -50;

e59..    x92 - 52*x93 + 21*x94 - 41*x95 + 82*x96 + 13*x97 - 41*x98 - 3*x99
       - 72*x100 + 28*x101 - x159 =L= -74;

e60..    64*x92 + 2*x93 - 19*x94 - 69*x95 + 43*x96 - 4*x97 + 43*x98 + 70*x99
       + 67*x100 - 5*x101 - x160 =L= 82;

e61..  - 84*x92 - 67*x93 + 35*x94 + 53*x95 + 82*x96 - 14*x97 + 71*x98 - 30*x99
       + 33*x100 - 57*x101 - x161 =L= -2;

e62..  - 60*x92 - 18*x93 - 23*x94 + 73*x95 - 22*x96 + 53*x97 + 12*x98 - 25*x99
       + 81*x100 + 69*x101 - x162 =L= -44;

e63..    71*x92 + 94*x93 + 52*x94 - 68*x95 - 64*x96 + 3*x97 - 38*x98 + 96*x99
       + 43*x100 + 15*x101 - x163 =L= -16;

e64..  - 17*x92 - 59*x93 + 90*x94 + 76*x95 - 99*x96 - 84*x97 - 42*x98 + 73*x99
       + 95*x100 + 28*x101 - x164 =L= -16;

e65..    73*x92 - 37*x93 + 98*x94 - 85*x95 - 45*x96 + 66*x97 - 94*x98 + 52*x99
       - 23*x100 - 54*x101 - x165 =L= -90;

e66..  - 34*x92 + 95*x93 + 49*x94 + 19*x95 + 23*x96 + 22*x97 + 13*x98 - 34*x99
       + 22*x100 - 21*x101 - x166 =L= 46;

e67..  - 96*x92 - 23*x93 + 22*x94 + 19*x95 + 87*x96 + 57*x97 + 63*x98 + 64*x99
       + 22*x100 - 38*x101 - x167 =L= 63;

e68..  - 92*x92 - 62*x93 + 16*x94 - 65*x95 - 12*x96 + x98 - 7*x99 - 38*x100
       - 67*x101 - x168 =L= 50;

e69..  - 15*x92 + 14*x93 + 69*x94 + 58*x95 - 75*x96 + 85*x97 + 15*x98 - 11*x99
       + 31*x100 - 55*x101 - x169 =L= -93;

e70..  - 34*x92 - 81*x93 - 18*x94 + 34*x95 + 5*x96 - 87*x97 + 63*x98 - 79*x99
       - 38*x100 + 79*x101 - x170 =L= -71;

e71..  - 67*x92 + 68*x93 - 96*x94 + 98*x95 + 11*x96 + 16*x97 - 39*x98 - 74*x99
       + 90*x100 - 81*x101 - x171 =L= -75;

e72..    6*x92 - 22*x93 - 57*x94 - 21*x95 - 61*x96 + 92*x97 + 8*x98 + 41*x99
       - 33*x100 + 64*x101 - x172 =L= 7;

e73..    54*x92 - 93*x93 + 87*x94 + 55*x95 - 9*x96 + 84*x97 - 75*x98 - 88*x99
       + 79*x100 - 49*x101 - x173 =L= 79;

e74..  - 25*x92 - 97*x93 + 15*x94 + 20*x95 - 88*x96 - 8*x97 + 56*x98 - 14*x99
       - 71*x100 - 59*x101 - x174 =L= 83;

e75..    47*x92 - 50*x93 - 42*x94 - 69*x95 + 92*x96 + 68*x97 - 64*x98 + 35*x99
       - 35*x100 - 67*x101 - x175 =L= 58;

e76..    34*x92 + 35*x93 - 51*x94 - 54*x95 + 36*x96 - 38*x97 - 27*x98 + 69*x99
       + 72*x100 + 50*x101 - x176 =L= -77;

e77..  - 55*x92 + 95*x93 - 92*x94 + 19*x95 + 3*x96 - 19*x97 - 61*x98 + 34*x99
       + 2*x100 + 56*x101 - x177 =L= -6;

e78..  - 49*x92 - 76*x93 + 26*x94 + 22*x95 + 6*x96 - 76*x97 - 50*x98 - 95*x99
       - 25*x100 - 50*x101 - x178 =L= 21;

e79..  - 96*x92 - 96*x93 - 46*x94 + 88*x95 + 48*x96 + 2*x97 - 48*x98 + 94*x99
       + 32*x100 + 66*x101 - x179 =L= -91;

e80..    7*x92 - 34*x93 - 30*x94 - 77*x95 - 65*x96 + 93*x97 + 65*x98 + 22*x99
       + 34*x100 - 98*x101 - x180 =L= 99;

e81..  - 73*x92 - 93*x93 - 14*x94 + 49*x95 + 54*x96 + 23*x97 - 93*x98 - 63*x99
       - 87*x100 - 22*x101 - x181 =L= 16;

e82..    99*x92 + 91*x93 - 70*x94 + 67*x95 - 18*x96 - 88*x97 - 70*x98 + 80*x99
       + 39*x100 - 11*x101 - x182 =L= -49;

e83..  - 62*x92 - 32*x93 + 46*x94 - 31*x95 + 69*x96 - 47*x97 + 23*x98 - 78*x99
       + 45*x100 - 66*x101 - x183 =L= -94;

e84..    2*x92 - 67*x93 + 31*x94 - 29*x95 - 5*x96 + 5*x97 + 94*x98 + 77*x99
       - 42*x100 + 63*x101 - x184 =L= -36;

e85..  - 70*x92 + 37*x93 + 45*x94 - 86*x95 + 49*x96 - 22*x97 + 95*x98 + 3*x99
       - 19*x100 - x185 =L= -4;

e86..    54*x92 + 72*x93 + 45*x94 + 61*x95 + 3*x96 - 7*x97 - 22*x98 + 52*x99
       - 8*x100 + 71*x101 - x186 =L= -61;

e87..    87*x92 - 9*x93 - 28*x94 - 65*x95 - 71*x96 - 53*x97 + 13*x98 - x99
       + 52*x100 - 26*x101 - x187 =L= 61;

e88..    47*x92 + 44*x93 + 82*x94 - 62*x95 - 21*x96 - 80*x97 - 77*x98 - 67*x99
       + 86*x100 - 62*x101 - x188 =L= 64;

e89..    83*x92 - 66*x93 + 79*x94 - 59*x95 - 96*x96 - 67*x97 - 61*x98 + 37*x99
       + 75*x100 - 84*x101 - x189 =L= -61;

e90..    45*x92 + 67*x93 + 33*x94 + 59*x95 - 93*x96 + 46*x97 - 4*x98 + 64*x99
       + 50*x100 + 51*x101 - x190 =L= -52;

e91..  - 45*x92 - 23*x93 + 34*x94 + 33*x95 + 56*x96 - 35*x97 + 45*x98 - 83*x99
       - 63*x100 - 25*x101 - x191 =L= 10;

e92..  - b2 - x192 =E= -1;

e93..  - b3 - x193 =E= -1;

e94..  - b4 - x194 =E= -1;

e95..  - b5 - x195 =E= -1;

e96..  - b6 - x196 =E= -1;

e97..  - b7 - x197 =E= -1;

e98..  - b8 - x198 =E= -1;

e99..  - b9 - x199 =E= -1;

e100..  - b10 - x200 =E= -1;

e101..  - b11 - x201 =E= -1;

e102..  - b12 - x202 =E= -1;

e103..  - b13 - x203 =E= -1;

e104..  - b14 - x204 =E= -1;

e105..  - b15 - x205 =E= -1;

e106..  - b16 - x206 =E= -1;

e107..  - b17 - x207 =E= -1;

e108..  - b18 - x208 =E= -1;

e109..  - b19 - x209 =E= -1;

e110..  - b20 - x210 =E= -1;

e111..  - b21 - x211 =E= -1;

e112..  - b22 - x212 =E= -1;

e113..  - b23 - x213 =E= -1;

e114..  - b24 - x214 =E= -1;

e115..  - b25 - x215 =E= -1;

e116..  - b26 - x216 =E= -1;

e117..  - b27 - x217 =E= -1;

e118..  - b28 - x218 =E= -1;

e119..  - b29 - x219 =E= -1;

e120..  - b30 - x220 =E= -1;

e121..  - b31 - x221 =E= -1;

e122..  - b32 - x222 =E= -1;

e123..  - b33 - x223 =E= -1;

e124..  - b34 - x224 =E= -1;

e125..  - b35 - x225 =E= -1;

e126..  - b36 - x226 =E= -1;

e127..  - b37 - x227 =E= -1;

e128..  - b38 - x228 =E= -1;

e129..  - b39 - x229 =E= -1;

e130..  - b40 - x230 =E= -1;

e131..  - b41 - x231 =E= -1;

e132..  - b42 - x232 =E= -1;

e133..  - b43 - x233 =E= -1;

e134..  - b44 - x234 =E= -1;

e135..  - b45 - x235 =E= -1;

e136..  - b46 - x236 =E= -1;

e137..  - b47 - x237 =E= -1;

e138..  - b48 - x238 =E= -1;

e139..  - b49 - x239 =E= -1;

e140..  - b50 - x240 =E= -1;

e141..  - b51 - x241 =E= -1;

e142..  - b52 - x242 =E= -1;

e143..  - b53 - x243 =E= -1;

e144..  - b54 - x244 =E= -1;

e145..  - b55 - x245 =E= -1;

e146..  - b56 - x246 =E= -1;

e147..  - b57 - x247 =E= -1;

e148..  - b58 - x248 =E= -1;

e149..  - b59 - x249 =E= -1;

e150..  - b60 - x250 =E= -1;

e151..  - b61 - x251 =E= -1;

e152..  - b62 - x252 =E= -1;

e153..  - b63 - x253 =E= -1;

e154..  - b64 - x254 =E= -1;

e155..  - b65 - x255 =E= -1;

e156..  - b66 - x256 =E= -1;

e157..  - b67 - x257 =E= -1;

e158..  - b68 - x258 =E= -1;

e159..  - b69 - x259 =E= -1;

e160..  - b70 - x260 =E= -1;

e161..  - b71 - x261 =E= -1;

e162..  - b72 - x262 =E= -1;

e163..  - b73 - x263 =E= -1;

e164..  - b74 - x264 =E= -1;

e165..  - b75 - x265 =E= -1;

e166..  - b76 - x266 =E= -1;

e167..  - b77 - x267 =E= -1;

e168..  - b78 - x268 =E= -1;

e169..  - b79 - x269 =E= -1;

e170..  - b80 - x270 =E= -1;

e171..  - b81 - x271 =E= -1;

e172..  - b82 - x272 =E= -1;

e173..  - b83 - x273 =E= -1;

e174..  - b84 - x274 =E= -1;

e175..  - b85 - x275 =E= -1;

e176..  - b86 - x276 =E= -1;

e177..  - b87 - x277 =E= -1;

e178..  - b88 - x278 =E= -1;

e179..  - b89 - x279 =E= -1;

e180..  - b90 - x280 =E= -1;

e181..  - b91 - x281 =E= -1;

e182.. x192*x102 =E= 0;

e183.. x193*x103 =E= 0;

e184.. x194*x104 =E= 0;

e185.. x195*x105 =E= 0;

e186.. x196*x106 =E= 0;

e187.. x197*x107 =E= 0;

e188.. x198*x108 =E= 0;

e189.. x199*x109 =E= 0;

e190.. x200*x110 =E= 0;

e191.. x201*x111 =E= 0;

e192.. x202*x112 =E= 0;

e193.. x203*x113 =E= 0;

e194.. x204*x114 =E= 0;

e195.. x205*x115 =E= 0;

e196.. x206*x116 =E= 0;

e197.. x207*x117 =E= 0;

e198.. x208*x118 =E= 0;

e199.. x209*x119 =E= 0;

e200.. x210*x120 =E= 0;

e201.. x211*x121 =E= 0;

e202.. x212*x122 =E= 0;

e203.. x213*x123 =E= 0;

e204.. x214*x124 =E= 0;

e205.. x215*x125 =E= 0;

e206.. x216*x126 =E= 0;

e207.. x217*x127 =E= 0;

e208.. x218*x128 =E= 0;

e209.. x219*x129 =E= 0;

e210.. x220*x130 =E= 0;

e211.. x221*x131 =E= 0;

e212.. x222*x132 =E= 0;

e213.. x223*x133 =E= 0;

e214.. x224*x134 =E= 0;

e215.. x225*x135 =E= 0;

e216.. x226*x136 =E= 0;

e217.. x227*x137 =E= 0;

e218.. x228*x138 =E= 0;

e219.. x229*x139 =E= 0;

e220.. x230*x140 =E= 0;

e221.. x231*x141 =E= 0;

e222.. x232*x142 =E= 0;

e223.. x233*x143 =E= 0;

e224.. x234*x144 =E= 0;

e225.. x235*x145 =E= 0;

e226.. x236*x146 =E= 0;

e227.. x237*x147 =E= 0;

e228.. x238*x148 =E= 0;

e229.. x239*x149 =E= 0;

e230.. x240*x150 =E= 0;

e231.. x241*x151 =E= 0;

e232.. x242*x152 =E= 0;

e233.. x243*x153 =E= 0;

e234.. x244*x154 =E= 0;

e235.. x245*x155 =E= 0;

e236.. x246*x156 =E= 0;

e237.. x247*x157 =E= 0;

e238.. x248*x158 =E= 0;

e239.. x249*x159 =E= 0;

e240.. x250*x160 =E= 0;

e241.. x251*x161 =E= 0;

e242.. x252*x162 =E= 0;

e243.. x253*x163 =E= 0;

e244.. x254*x164 =E= 0;

e245.. x255*x165 =E= 0;

e246.. x256*x166 =E= 0;

e247.. x257*x167 =E= 0;

e248.. x258*x168 =E= 0;

e249.. x259*x169 =E= 0;

e250.. x260*x170 =E= 0;

e251.. x261*x171 =E= 0;

e252.. x262*x172 =E= 0;

e253.. x263*x173 =E= 0;

e254.. x264*x174 =E= 0;

e255.. x265*x175 =E= 0;

e256.. x266*x176 =E= 0;

e257.. x267*x177 =E= 0;

e258.. x268*x178 =E= 0;

e259.. x269*x179 =E= 0;

e260.. x270*x180 =E= 0;

e261.. x271*x181 =E= 0;

e262.. x272*x182 =E= 0;

e263.. x273*x183 =E= 0;

e264.. x274*x184 =E= 0;

e265.. x275*x185 =E= 0;

e266.. x276*x186 =E= 0;

e267.. x277*x187 =E= 0;

e268.. x278*x188 =E= 0;

e269.. x279*x189 =E= 0;

e270.. x280*x190 =E= 0;

e271.. x281*x191 =E= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
