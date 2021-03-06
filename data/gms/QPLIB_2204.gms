$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        331      221        0      110        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        336      226      110        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*       1203      983      220        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102
          ,b103,b104,b105,b106,b107,b108,b109,b110,b111,x112,x113,x114,x115
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
          ,x285,x286,x287,x288,x289,x290,x291,x292,x293,x294,x295,x296,x297
          ,x298,x299,x300,x301,x302,x303,x304,x305,x306,x307,x308,x309,x310
          ,x311,x312,x313,x314,x315,x316,x317,x318,x319,x320,x321,x322,x323
          ,x324,x325,x326,x327,x328,x329,x330,x331,x332,x333,x334,x335,x336;

Positive Variables  x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127
          ,x128,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x140
          ,x141,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151,x152,x153
          ,x154,x155,x156,x157,x158,x159,x160,x161,x162,x163,x164,x165,x166
          ,x167,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177,x178,x179
          ,x180,x181,x182,x183,x184,x185,x186,x187,x188,x189,x190,x191,x192
          ,x193,x194,x195,x196,x197,x198,x199,x200,x201,x202,x203,x204,x205
          ,x206,x207,x208,x209,x210,x211,x212,x213,x214,x215,x216,x217,x218
          ,x219,x220,x221,x222,x223,x224,x225,x226;

Binary Variables  b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102
          ,b103,b104,b105,b106,b107,b108,b109,b110,b111;

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
          ,e260,e261,e262,e263,e264,e265,e266,e267,e268,e269,e270,e271,e272
          ,e273,e274,e275,e276,e277,e278,e279,e280,e281,e282,e283,e284,e285
          ,e286,e287,e288,e289,e290,e291,e292,e293,e294,e295,e296,e297,e298
          ,e299,e300,e301,e302,e303,e304,e305,e306,e307,e308,e309,e310,e311
          ,e312,e313,e314,e315,e316,e317,e318,e319,e320,e321,e322,e323,e324
          ,e325,e326,e327,e328,e329,e330,e331;


e1..  - objvar + b2 + b3 + b4 + b5 + b6 + b7 + b8 + b9 + b10 + b11 + b12 + b13
      + b14 + b15 + b16 + b17 + b18 + b19 + b20 + b21 + b22 + b23 + b24 + b25
      + b26 + b27 + b28 + b29 + b30 + b31 + b32 + b33 + b34 + b35 + b36 + b37
      + b38 + b39 + b40 + b41 + b42 + b43 + b44 + b45 + b46 + b47 + b48 + b49
      + b50 + b51 + b52 + b53 + b54 + b55 + b56 + b57 + b58 + b59 + b60 + b61
      + b62 + b63 + b64 + b65 + b66 + b67 + b68 + b69 + b70 + b71 + b72 + b73
      + b74 + b75 + b76 + b77 + b78 + b79 + b80 + b81 + b82 + b83 + b84 + b85
      + b86 + b87 + b88 + b89 + b90 + b91 + b92 + b93 + b94 + b95 + b96 + b97
      + b98 + b99 + b100 + b101 + b102 + b103 + b104 + b105 + b106 + b107
      + b108 + b109 + b110 + b111 =E= 0;

e2..  - 66*x112 + 49*x113 - 81*x114 + 73*x115 + 15*x116 - x117 =L= 56;

e3..    38*x112 - 26*x113 + 74*x114 + 48*x115 - 11*x116 - x118 =L= -29;

e4..    46*x112 - 48*x113 - 21*x114 + 55*x115 + 68*x116 - x119 =L= 14;

e5..    42*x112 - 84*x113 - 9*x114 - 78*x115 + 8*x116 - x120 =L= -22;

e6..    13*x112 + 91*x113 + 73*x114 - 68*x115 - 45*x116 - x121 =L= -48;

e7..    84*x112 - 13*x113 + 57*x114 - 75*x115 - 84*x116 - x122 =L= 88;

e8..  - 95*x112 - 70*x113 - 24*x114 - 69*x115 + 5*x116 - x123 =L= 75;

e9..  - 14*x112 - 47*x113 - 37*x114 + 53*x115 - 79*x116 - x124 =L= 53;

e10..    40*x112 - 57*x113 + 52*x114 - 18*x115 + 29*x116 - x125 =L= 85;

e11..    37*x113 - 13*x114 + 21*x115 + 14*x116 - x126 =L= 26;

e12..  - 7*x112 + 26*x113 - 73*x114 + 92*x115 - 71*x116 - x127 =L= -11;

e13..  - 35*x112 + 90*x113 - 29*x114 - 20*x115 - 80*x116 - x128 =L= 90;

e14..    96*x112 + 14*x113 + 73*x114 - 70*x115 + 81*x116 - x129 =L= 29;

e15..  - 88*x112 + 90*x113 + 93*x114 + 56*x115 + 60*x116 - x130 =L= 13;

e16..  - 44*x112 + 92*x113 + 15*x114 - 13*x115 - 25*x116 - x131 =L= 84;

e17..  - 95*x112 + 53*x113 + 44*x114 + 17*x115 - 15*x116 - x132 =L= 28;

e18..    49*x112 - 87*x113 - 90*x114 + 54*x115 + 40*x116 - x133 =L= -76;

e19..  - 40*x112 - 86*x113 + 37*x114 - 27*x115 + 45*x116 - x134 =L= -61;

e20..  - 69*x112 - 68*x113 + 66*x114 + 9*x115 - 37*x116 - x135 =L= 5;

e21..  - 13*x112 - 58*x113 + 45*x114 - 100*x115 + 16*x116 - x136 =L= -5;

e22..    87*x112 + 52*x113 - 75*x114 - 98*x115 - x137 =L= 68;

e23..    70*x112 - 82*x113 + 71*x114 + 57*x115 + 15*x116 - x138 =L= -81;

e24..    65*x112 + 49*x113 + 81*x114 + x115 + 76*x116 - x139 =L= 92;

e25..    12*x112 - 5*x113 - 17*x114 + 29*x115 + 75*x116 - x140 =L= 16;

e26..  - 56*x112 + 99*x113 - 69*x114 + 38*x115 + 40*x116 - x141 =L= 97;

e27..    29*x112 + 30*x113 + 68*x114 + 36*x115 + 93*x116 - x142 =L= -34;

e28..    59*x112 - 68*x113 + 72*x114 + 20*x115 - 16*x116 - x143 =L= 96;

e29..    73*x112 - 7*x113 - 51*x114 + 68*x115 + 68*x116 - x144 =L= 47;

e30..  - 74*x112 - 5*x113 + 56*x114 + 13*x116 - x145 =L= -11;

e31..  - 93*x112 - 34*x113 - 15*x114 + 16*x115 - 83*x116 - x146 =L= 34;

e32..    17*x112 - 53*x113 + 48*x114 + 91*x115 + 72*x116 - x147 =L= -86;

e33..    7*x112 - 24*x113 - 100*x114 + 43*x115 - 90*x116 - x148 =L= -96;

e34..    51*x112 + 25*x113 + 86*x114 + 9*x115 - 17*x116 - x149 =L= -22;

e35..  - 61*x112 - 39*x113 - 58*x114 + 21*x115 - 26*x116 - x150 =L= -68;

e36..  - 8*x112 + 60*x113 - 64*x114 + 43*x115 - 5*x116 - x151 =L= -72;

e37..    26*x112 - 52*x113 - 76*x114 + 74*x115 - 80*x116 - x152 =L= 50;

e38..  - 24*x112 + 10*x113 - 85*x114 - 25*x115 + 24*x116 - x153 =L= 57;

e39..  - 16*x112 + 64*x113 + 9*x114 + 45*x115 - 2*x116 - x154 =L= -48;

e40..  - 2*x113 - 2*x114 + 69*x115 + 83*x116 - x155 =L= -28;

e41..    8*x112 + 20*x113 + 21*x114 - 12*x115 + 41*x116 - x156 =L= -57;

e42..    52*x112 - 39*x113 + 57*x114 - 82*x115 + 79*x116 - x157 =L= 86;

e43..    93*x112 + 23*x113 - 87*x114 - 78*x115 + 25*x116 - x158 =L= -86;

e44..    11*x112 - 53*x113 + 22*x114 + 86*x115 + 13*x116 - x159 =L= 14;

e45..  - 7*x112 - 76*x113 - 53*x114 + 99*x115 + 11*x116 - x160 =L= 72;

e46..  - 43*x112 + 45*x113 + 64*x114 - 2*x115 + 18*x116 - x161 =L= -78;

e47..  - 69*x112 + 39*x113 + 18*x114 + 76*x115 - 14*x116 - x162 =L= -58;

e48..  - 64*x112 + 37*x113 - 57*x114 - 47*x115 - 56*x116 - x163 =L= -1;

e49..  - 47*x112 - 11*x113 - 53*x114 - 41*x115 + 29*x116 - x164 =L= 49;

e50..    38*x112 - 15*x113 + 51*x114 - 20*x115 - 25*x116 - x165 =L= 27;

e51..    6*x112 + 79*x113 + 30*x114 + 86*x115 - 99*x116 - x166 =L= -66;

e52..    28*x112 + 52*x113 + 34*x114 + 53*x115 + 50*x116 - x167 =L= 79;

e53..  - 57*x112 + 26*x113 + 19*x114 + 24*x115 - 27*x116 - x168 =L= -86;

e54..  - 50*x112 - 28*x113 - 3*x114 - 42*x116 - x169 =L= -53;

e55..    32*x112 + 79*x113 + 33*x114 - 92*x115 + 67*x116 - x170 =L= 13;

e56..  - 64*x112 - 95*x113 - 5*x114 + 12*x115 - 67*x116 - x171 =L= 21;

e57..    28*x112 - 39*x113 + 91*x114 + 52*x115 + 26*x116 - x172 =L= -87;

e58..  - 74*x112 + 51*x113 - 4*x114 + 42*x115 - 77*x116 - x173 =L= 27;

e59..  - 20*x112 + 40*x113 + 56*x114 + 40*x115 - 47*x116 - x174 =L= 55;

e60..  - 74*x112 - 45*x113 - 84*x114 - 58*x115 - 61*x116 - x175 =L= 23;

e61..    20*x112 + 9*x113 + 13*x114 - 75*x115 - 86*x116 - x176 =L= 76;

e62..  - 70*x112 + 12*x113 - 37*x114 - 33*x115 - 59*x116 - x177 =L= 34;

e63..  - 93*x112 - 92*x113 + 63*x114 - 88*x115 + 41*x116 - x178 =L= -18;

e64..    77*x112 + 87*x113 - 100*x114 - 30*x115 + 87*x116 - x179 =L= 98;

e65..  - 28*x112 + 95*x113 - 95*x114 - 32*x115 + 69*x116 - x180 =L= -12;

e66..    40*x112 + 13*x113 - 80*x114 - 64*x115 - 52*x116 - x181 =L= 36;

e67..    97*x112 + 2*x113 + 80*x114 - 7*x115 - 5*x116 - x182 =L= -19;

e68..    51*x112 - 77*x113 - 71*x114 + 39*x115 - 48*x116 - x183 =L= 5;

e69..  - 87*x112 - 71*x113 - 18*x114 - 84*x115 + 27*x116 - x184 =L= -97;

e70..  - 52*x112 + 15*x113 - 68*x114 - 47*x115 - 85*x116 - x185 =L= -71;

e71..  - 83*x112 - 72*x113 - 6*x114 + 44*x115 - 5*x116 - x186 =L= 11;

e72..  - x112 - 84*x113 - 41*x114 - 41*x115 - 34*x116 - x187 =L= -83;

e73..  - 81*x112 - 60*x113 - 79*x114 - 66*x115 + 66*x116 - x188 =L= 65;

e74..    84*x112 + 6*x113 - 6*x114 + 39*x115 + x116 - x189 =L= 53;

e75..    96*x112 - 7*x113 + 33*x114 + 78*x115 + 70*x116 - x190 =L= 50;

e76..    42*x112 - 83*x113 + 59*x114 - 25*x115 - 9*x116 - x191 =L= -27;

e77..    55*x112 + 19*x113 - 89*x114 - 76*x115 + 11*x116 - x192 =L= 30;

e78..  - 88*x112 + 4*x113 + 68*x114 - 69*x115 - 100*x116 - x193 =L= 79;

e79..  - 57*x112 - 63*x113 + 93*x114 + 63*x115 + 41*x116 - x194 =L= 17;

e80..    35*x112 + 54*x113 - 54*x114 - 57*x115 - 26*x116 - x195 =L= 64;

e81..  - 68*x112 + 22*x113 - 76*x114 - 13*x115 - 100*x116 - x196 =L= 3;

e82..  - 8*x112 + 37*x113 - 94*x114 - 19*x115 - x197 =L= -44;

e83..    99*x112 - 27*x113 - 26*x114 + 90*x115 - 84*x116 - x198 =L= 22;

e84..    58*x112 - 29*x113 + 94*x114 - 64*x115 - 14*x116 - x199 =L= 56;

e85..  - 77*x112 + 6*x113 - 52*x114 + 22*x115 + 55*x116 - x200 =L= -64;

e86..  - 2*x112 + 86*x113 - 37*x114 - 28*x115 - 80*x116 - x201 =L= -26;

e87..    77*x112 + 78*x113 + 97*x114 - 79*x115 - 70*x116 - x202 =L= 87;

e88..    56*x112 + 75*x113 - 48*x114 - 75*x115 + 7*x116 - x203 =L= -31;

e89..  - 23*x112 - 26*x113 - 5*x114 + 45*x115 + 86*x116 - x204 =L= -1;

e90..  - 5*x112 + 91*x113 - 40*x114 - 10*x115 + 64*x116 - x205 =L= -24;

e91..    45*x112 - 31*x113 + 31*x114 + 72*x115 + 32*x116 - x206 =L= 60;

e92..    85*x112 - 36*x113 - 5*x114 + 13*x115 - 15*x116 - x207 =L= 89;

e93..  - 83*x112 - 15*x113 - 38*x114 + 39*x115 - 29*x116 - x208 =L= 6;

e94..  - 78*x112 + 47*x113 + 85*x114 - 72*x115 + 88*x116 - x209 =L= -96;

e95..  - 20*x112 - 60*x113 - 80*x114 - 93*x115 - 19*x116 - x210 =L= -11;

e96..    36*x112 - 49*x113 + 62*x114 - 81*x115 + 29*x116 - x211 =L= 1;

e97..  - 69*x113 + 26*x114 - 79*x115 - 58*x116 - x212 =L= 77;

e98..    97*x112 - 97*x113 + 72*x114 - 76*x115 - 74*x116 - x213 =L= 13;

e99..  - 74*x112 + 72*x113 + 8*x114 - 11*x115 - 37*x116 - x214 =L= -14;

e100..    93*x112 + 61*x113 + 44*x114 + 68*x115 + 86*x116 - x215 =L= -77;

e101..  - 7*x112 - 22*x113 - 24*x114 - 50*x115 - 74*x116 - x216 =L= 24;

e102..    23*x112 - 2*x113 + 3*x114 + 56*x115 - 45*x116 - x217 =L= -15;

e103..  - 79*x112 - 54*x113 + 80*x114 + 15*x115 + 62*x116 - x218 =L= 56;

e104..    41*x112 - 32*x113 + 87*x114 - 59*x115 + 44*x116 - x219 =L= 66;

e105..  - 31*x112 - 35*x113 - 32*x114 + 5*x115 + 10*x116 - x220 =L= -97;

e106..  - 9*x112 - 50*x114 + x115 - 52*x116 - x221 =L= 21;

e107..  - 41*x112 + 82*x113 + 13*x114 - 41*x115 - 3*x116 - x222 =L= -72;

e108..    28*x112 - 74*x113 + 64*x114 + 2*x115 - 19*x116 - x223 =L= -69;

e109..    43*x112 - 4*x113 + 43*x114 + 70*x115 + 67*x116 - x224 =L= -5;

e110..    82*x112 - 84*x113 - 67*x114 + 35*x115 + 53*x116 - x225 =L= 82;

e111..  - 14*x112 + 71*x113 - 30*x114 + 33*x115 - 57*x116 - x226 =L= -2;

e112..  - b2 - x227 =E= -1;

e113..  - b3 - x228 =E= -1;

e114..  - b4 - x229 =E= -1;

e115..  - b5 - x230 =E= -1;

e116..  - b6 - x231 =E= -1;

e117..  - b7 - x232 =E= -1;

e118..  - b8 - x233 =E= -1;

e119..  - b9 - x234 =E= -1;

e120..  - b10 - x235 =E= -1;

e121..  - b11 - x236 =E= -1;

e122..  - b12 - x237 =E= -1;

e123..  - b13 - x238 =E= -1;

e124..  - b14 - x239 =E= -1;

e125..  - b15 - x240 =E= -1;

e126..  - b16 - x241 =E= -1;

e127..  - b17 - x242 =E= -1;

e128..  - b18 - x243 =E= -1;

e129..  - b19 - x244 =E= -1;

e130..  - b20 - x245 =E= -1;

e131..  - b21 - x246 =E= -1;

e132..  - b22 - x247 =E= -1;

e133..  - b23 - x248 =E= -1;

e134..  - b24 - x249 =E= -1;

e135..  - b25 - x250 =E= -1;

e136..  - b26 - x251 =E= -1;

e137..  - b27 - x252 =E= -1;

e138..  - b28 - x253 =E= -1;

e139..  - b29 - x254 =E= -1;

e140..  - b30 - x255 =E= -1;

e141..  - b31 - x256 =E= -1;

e142..  - b32 - x257 =E= -1;

e143..  - b33 - x258 =E= -1;

e144..  - b34 - x259 =E= -1;

e145..  - b35 - x260 =E= -1;

e146..  - b36 - x261 =E= -1;

e147..  - b37 - x262 =E= -1;

e148..  - b38 - x263 =E= -1;

e149..  - b39 - x264 =E= -1;

e150..  - b40 - x265 =E= -1;

e151..  - b41 - x266 =E= -1;

e152..  - b42 - x267 =E= -1;

e153..  - b43 - x268 =E= -1;

e154..  - b44 - x269 =E= -1;

e155..  - b45 - x270 =E= -1;

e156..  - b46 - x271 =E= -1;

e157..  - b47 - x272 =E= -1;

e158..  - b48 - x273 =E= -1;

e159..  - b49 - x274 =E= -1;

e160..  - b50 - x275 =E= -1;

e161..  - b51 - x276 =E= -1;

e162..  - b52 - x277 =E= -1;

e163..  - b53 - x278 =E= -1;

e164..  - b54 - x279 =E= -1;

e165..  - b55 - x280 =E= -1;

e166..  - b56 - x281 =E= -1;

e167..  - b57 - x282 =E= -1;

e168..  - b58 - x283 =E= -1;

e169..  - b59 - x284 =E= -1;

e170..  - b60 - x285 =E= -1;

e171..  - b61 - x286 =E= -1;

e172..  - b62 - x287 =E= -1;

e173..  - b63 - x288 =E= -1;

e174..  - b64 - x289 =E= -1;

e175..  - b65 - x290 =E= -1;

e176..  - b66 - x291 =E= -1;

e177..  - b67 - x292 =E= -1;

e178..  - b68 - x293 =E= -1;

e179..  - b69 - x294 =E= -1;

e180..  - b70 - x295 =E= -1;

e181..  - b71 - x296 =E= -1;

e182..  - b72 - x297 =E= -1;

e183..  - b73 - x298 =E= -1;

e184..  - b74 - x299 =E= -1;

e185..  - b75 - x300 =E= -1;

e186..  - b76 - x301 =E= -1;

e187..  - b77 - x302 =E= -1;

e188..  - b78 - x303 =E= -1;

e189..  - b79 - x304 =E= -1;

e190..  - b80 - x305 =E= -1;

e191..  - b81 - x306 =E= -1;

e192..  - b82 - x307 =E= -1;

e193..  - b83 - x308 =E= -1;

e194..  - b84 - x309 =E= -1;

e195..  - b85 - x310 =E= -1;

e196..  - b86 - x311 =E= -1;

e197..  - b87 - x312 =E= -1;

e198..  - b88 - x313 =E= -1;

e199..  - b89 - x314 =E= -1;

e200..  - b90 - x315 =E= -1;

e201..  - b91 - x316 =E= -1;

e202..  - b92 - x317 =E= -1;

e203..  - b93 - x318 =E= -1;

e204..  - b94 - x319 =E= -1;

e205..  - b95 - x320 =E= -1;

e206..  - b96 - x321 =E= -1;

e207..  - b97 - x322 =E= -1;

e208..  - b98 - x323 =E= -1;

e209..  - b99 - x324 =E= -1;

e210..  - b100 - x325 =E= -1;

e211..  - b101 - x326 =E= -1;

e212..  - b102 - x327 =E= -1;

e213..  - b103 - x328 =E= -1;

e214..  - b104 - x329 =E= -1;

e215..  - b105 - x330 =E= -1;

e216..  - b106 - x331 =E= -1;

e217..  - b107 - x332 =E= -1;

e218..  - b108 - x333 =E= -1;

e219..  - b109 - x334 =E= -1;

e220..  - b110 - x335 =E= -1;

e221..  - b111 - x336 =E= -1;

e222.. x227*x117 =E= 0;

e223.. x228*x118 =E= 0;

e224.. x229*x119 =E= 0;

e225.. x230*x120 =E= 0;

e226.. x231*x121 =E= 0;

e227.. x232*x122 =E= 0;

e228.. x233*x123 =E= 0;

e229.. x234*x124 =E= 0;

e230.. x235*x125 =E= 0;

e231.. x236*x126 =E= 0;

e232.. x237*x127 =E= 0;

e233.. x238*x128 =E= 0;

e234.. x239*x129 =E= 0;

e235.. x240*x130 =E= 0;

e236.. x241*x131 =E= 0;

e237.. x242*x132 =E= 0;

e238.. x243*x133 =E= 0;

e239.. x244*x134 =E= 0;

e240.. x245*x135 =E= 0;

e241.. x246*x136 =E= 0;

e242.. x247*x137 =E= 0;

e243.. x248*x138 =E= 0;

e244.. x249*x139 =E= 0;

e245.. x250*x140 =E= 0;

e246.. x251*x141 =E= 0;

e247.. x252*x142 =E= 0;

e248.. x253*x143 =E= 0;

e249.. x254*x144 =E= 0;

e250.. x255*x145 =E= 0;

e251.. x256*x146 =E= 0;

e252.. x257*x147 =E= 0;

e253.. x258*x148 =E= 0;

e254.. x259*x149 =E= 0;

e255.. x260*x150 =E= 0;

e256.. x261*x151 =E= 0;

e257.. x262*x152 =E= 0;

e258.. x263*x153 =E= 0;

e259.. x264*x154 =E= 0;

e260.. x265*x155 =E= 0;

e261.. x266*x156 =E= 0;

e262.. x267*x157 =E= 0;

e263.. x268*x158 =E= 0;

e264.. x269*x159 =E= 0;

e265.. x270*x160 =E= 0;

e266.. x271*x161 =E= 0;

e267.. x272*x162 =E= 0;

e268.. x273*x163 =E= 0;

e269.. x274*x164 =E= 0;

e270.. x275*x165 =E= 0;

e271.. x276*x166 =E= 0;

e272.. x277*x167 =E= 0;

e273.. x278*x168 =E= 0;

e274.. x279*x169 =E= 0;

e275.. x280*x170 =E= 0;

e276.. x281*x171 =E= 0;

e277.. x282*x172 =E= 0;

e278.. x283*x173 =E= 0;

e279.. x284*x174 =E= 0;

e280.. x285*x175 =E= 0;

e281.. x286*x176 =E= 0;

e282.. x287*x177 =E= 0;

e283.. x288*x178 =E= 0;

e284.. x289*x179 =E= 0;

e285.. x290*x180 =E= 0;

e286.. x291*x181 =E= 0;

e287.. x292*x182 =E= 0;

e288.. x293*x183 =E= 0;

e289.. x294*x184 =E= 0;

e290.. x295*x185 =E= 0;

e291.. x296*x186 =E= 0;

e292.. x297*x187 =E= 0;

e293.. x298*x188 =E= 0;

e294.. x299*x189 =E= 0;

e295.. x300*x190 =E= 0;

e296.. x301*x191 =E= 0;

e297.. x302*x192 =E= 0;

e298.. x303*x193 =E= 0;

e299.. x304*x194 =E= 0;

e300.. x305*x195 =E= 0;

e301.. x306*x196 =E= 0;

e302.. x307*x197 =E= 0;

e303.. x308*x198 =E= 0;

e304.. x309*x199 =E= 0;

e305.. x310*x200 =E= 0;

e306.. x311*x201 =E= 0;

e307.. x312*x202 =E= 0;

e308.. x313*x203 =E= 0;

e309.. x314*x204 =E= 0;

e310.. x315*x205 =E= 0;

e311.. x316*x206 =E= 0;

e312.. x317*x207 =E= 0;

e313.. x318*x208 =E= 0;

e314.. x319*x209 =E= 0;

e315.. x320*x210 =E= 0;

e316.. x321*x211 =E= 0;

e317.. x322*x212 =E= 0;

e318.. x323*x213 =E= 0;

e319.. x324*x214 =E= 0;

e320.. x325*x215 =E= 0;

e321.. x326*x216 =E= 0;

e322.. x327*x217 =E= 0;

e323.. x328*x218 =E= 0;

e324.. x329*x219 =E= 0;

e325.. x330*x220 =E= 0;

e326.. x331*x221 =E= 0;

e327.. x332*x222 =E= 0;

e328.. x333*x223 =E= 0;

e329.. x334*x224 =E= 0;

e330.. x335*x225 =E= 0;

e331.. x336*x226 =E= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
