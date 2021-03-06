$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        284      145       46       93        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        691      645       46        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*       2531     2393      138        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,x48,x49,x50,x51,x52
          ,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69
          ,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86
          ,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102
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
          ,x285,x286,x287,x288,x289,x290,x291,x292,x293,x294,x295,x296,x297
          ,x298,x299,x300,x301,x302,x303,x304,x305,x306,x307,x308,x309,x310
          ,x311,x312,x313,x314,x315,x316,x317,x318,x319,x320,x321,x322,x323
          ,x324,x325,x326,x327,x328,x329,x330,x331,x332,x333,x334,x335,x336
          ,x337,x338,x339,x340,x341,x342,x343,x344,x345,x346,x347,x348,x349
          ,x350,x351,x352,x353,x354,x355,x356,x357,x358,x359,x360,x361,x362
          ,x363,x364,x365,x366,x367,x368,x369,x370,x371,x372,x373,x374,x375
          ,x376,x377,x378,x379,x380,x381,x382,x383,x384,x385,x386,x387,x388
          ,x389,x390,x391,x392,x393,x394,x395,x396,x397,x398,x399,x400,x401
          ,x402,x403,x404,x405,x406,x407,x408,x409,x410,x411,x412,x413,x414
          ,x415,x416,x417,x418,x419,x420,x421,x422,x423,x424,x425,x426,x427
          ,x428,x429,x430,x431,x432,x433,x434,x435,x436,x437,x438,x439,x440
          ,x441,x442,x443,x444,x445,x446,x447,x448,x449,x450,x451,x452,x453
          ,x454,x455,x456,x457,x458,x459,x460,x461,x462,x463,x464,x465,x466
          ,x467,x468,x469,x470,x471,x472,x473,x474,x475,x476,x477,x478,x479
          ,x480,x481,x482,x483,x484,x485,x486,x487,x488,x489,x490,x491,x492
          ,x493,x494,x495,x496,x497,x498,x499,x500,x501,x502,x503,x504,x505
          ,x506,x507,x508,x509,x510,x511,x512,x513,x514,x515,x516,x517,x518
          ,x519,x520,x521,x522,x523,x524,x525,x526,x527,x528,x529,x530,x531
          ,x532,x533,x534,x535,x536,x537,x538,x539,x540,x541,x542,x543,x544
          ,x545,x546,x547,x548,x549,x550,x551,x552,x553,x554,x555,x556,x557
          ,x558,x559,x560,x561,x562,x563,x564,x565,x566,x567,x568,x569,x570
          ,x571,x572,x573,x574,x575,x576,x577,x578,x579,x580,x581,x582,x583
          ,x584,x585,x586,x587,x588,x589,x590,x591,x592,x593,x594,x595,x596
          ,x597,x598,x599,x600,x601,x602,x603,x604,x605,x606,x607,x608,x609
          ,x610,x611,x612,x613,x614,x615,x616,x617,x618,x619,x620,x621,x622
          ,x623,x624,x625,x626,x627,x628,x629,x630,x631,x632,x633,x634,x635
          ,x636,x637,x638,x639,x640,x641,x642,x643,x644,x645,x646,x647,x648
          ,x649,x650,x651,x652,x653,x654,x655,x656,x657,x658,x659,x660,x661
          ,x662,x663,x664,x665,x666,x667,x668,x669,x670,x671,x672,x673,x674
          ,x675,x676,x677,x678,x679,x680,x681,x682,x683,x684,x685,x686,x687
          ,x688,x689,x690,x691;

Positive Variables  x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61
          ,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78
          ,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95
          ,x96,x97,x98,x99,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109
          ,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122
          ,x123,x124,x125,x126,x127,x128,x129,x130,x131,x132,x133,x134,x135
          ,x136,x137,x138,x139,x140,x141,x142,x143,x144,x145,x146,x147,x148
          ,x149,x150,x151,x152,x153,x154,x155,x156,x157,x158,x159,x160,x161
          ,x162,x163,x164,x165,x166,x167,x168,x169,x170,x171,x172,x173,x174
          ,x175,x176,x177,x178,x179,x180,x181,x182,x183,x184,x185,x186,x187
          ,x188,x189,x190,x191,x192,x193,x194,x195,x196,x197,x198,x199,x200
          ,x201,x202,x203,x204,x205,x206,x207,x208,x209,x210,x211,x212,x213
          ,x214,x215,x216,x217,x218,x219,x220,x221,x222,x223,x224,x225,x226
          ,x227,x228,x229,x230,x231,x232,x233,x234,x235,x236,x237,x238,x239
          ,x240,x241,x242,x243,x244,x245,x246,x247,x248,x249,x250,x251,x252
          ,x253,x254,x255,x256,x257,x258,x259,x260,x261,x262,x263,x264,x265
          ,x266,x267,x268,x269,x270,x271,x272,x273,x274,x275,x276,x277,x278
          ,x279,x280,x281,x282,x283,x284,x285,x286,x287,x288,x289,x290,x291
          ,x292,x293,x294,x295,x296,x297,x298,x299,x300,x301,x302,x303,x304
          ,x305,x306,x307,x308,x309,x310,x311,x312,x313,x314,x315,x316,x317
          ,x318,x319,x320,x321,x322,x323,x324,x325,x326,x327,x328,x329,x330
          ,x331,x332,x333,x334,x335,x336,x337,x338,x339,x340,x341,x342,x343
          ,x344,x345,x346,x347,x348,x349,x350,x351,x352,x353,x354,x355,x356
          ,x357,x358,x359,x360,x361,x362,x363,x364,x365,x366,x367,x368,x369
          ,x370,x371,x372,x373,x374,x375,x376,x377,x378,x379,x380,x381,x382
          ,x383,x384,x385,x386,x387,x388,x389,x390,x391,x392,x393,x394,x395
          ,x396,x397,x398,x399,x400,x401,x402,x403,x404,x405,x406,x407,x408
          ,x409,x410,x411,x412,x413,x414,x415,x416,x417,x418,x419,x420,x421
          ,x422,x423,x424,x425,x426,x427,x428,x429,x430,x431,x432,x433,x434
          ,x435,x436,x437,x438,x439,x440,x441,x442,x443,x444,x445,x446,x447
          ,x448,x449,x450,x451,x452,x453,x454,x455,x456,x457,x458,x459,x460
          ,x461,x462,x463,x464,x465,x466,x467,x468,x469,x470,x471,x472,x473
          ,x474,x475,x476,x477,x478,x479,x480,x481,x482,x483,x484,x485,x486
          ,x487,x488,x489,x490,x491,x492,x493,x494,x495,x496,x497,x498,x499
          ,x500,x501,x502,x503,x504,x505,x506,x507,x508,x509,x510,x511,x512
          ,x513,x514,x515,x516,x517,x518,x519,x520,x521,x522,x523,x524,x525
          ,x526,x527,x528,x529,x530,x531,x532,x533,x534,x535,x536,x537,x538
          ,x539,x540,x541,x542,x543,x544,x545,x546,x547,x548,x549,x550,x551
          ,x552,x553,x554,x555,x556,x557,x558,x559,x560,x561,x562,x563,x564
          ,x565,x566,x567,x568,x569,x570,x571,x572,x573,x574,x575,x576,x577
          ,x578,x579,x580,x581,x582,x583,x584,x585,x586,x587,x588,x589,x590
          ,x591,x592,x593,x594,x595,x596,x597,x598,x599,x600,x601,x602,x603
          ,x604,x605,x606,x607,x608,x609,x610,x611,x612,x613,x614,x615,x616
          ,x617,x618,x619,x620,x621,x622,x623,x624,x625,x626,x627,x628,x629
          ,x630,x631,x632,x633,x634,x635,x636,x637,x638,x639,x640,x641,x642
          ,x643,x644,x645,x646,x647,x648,x649,x650,x651,x652,x653,x654,x655
          ,x656,x657,x658,x659,x660,x661,x662,x663,x664,x665,x666,x667,x668
          ,x669,x670,x671,x672,x673,x674,x675,x676,x677,x678,x679,x680,x681
          ,x682,x683,x684,x685,x686,x687,x688,x689,x690,x691;

Binary Variables  b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47;

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
          ,e273,e274,e275,e276,e277,e278,e279,e280,e281,e282,e283,e284;


e1..  - objvar + 1.235768455*b2 + 1.754882812*b3 + 3.159455914*b4
      + 3.980618566*b5 + 2.905401043*b6 + 2.524310515*b7 + 3.289509208*b8
      + 1.235768455*b9 + 2.516549044*b10 + 2.174517481*b11 + 2.402340784*b12
      + 1.754882812*b13 + 3.153941476*b14 + 2.649872155*b15 + 2.46690751*b16
      + 3.159455914*b17 + 2.46690751*b18 + 1.583424277*b19 + 3.980618566*b20
      + 3.153941476*b21 + 1.572334903*b22 + 2.905401043*b23 + 2.516549044*b24
      + 1.572334903*b25 + 1.097733808*b26 + 2.174517481*b27 + 1.097733808*b28
      + 2.95175038*b29 + 2.477930353*b30 + 1.425428344*b31 + 2.95175038*b32
      + 1.694724004*b33 + 2.524310515*b34 + 1.694724004*b35 + 3.787543429*b36
      + 1.759730596*b37 + 2.402340784*b38 + 1.583424277*b39 + 2.477930353*b40
      + 3.787543429*b41 + 1.492267639*b42 + 3.289509208*b43 + 2.649872155*b44
      + 1.425428344*b45 + 1.759730596*b46 + 1.492267639*b47 =E= 0;

e2..  - x48 - x49 - x50 - x51 - x52 - x53 - x54 + x55 + x56 + x57 + x58 + x59
      + x60 + x61 =E= -149;

e3..  - x62 - x63 - x64 - x65 - x66 - x67 - x68 + x69 + x70 + x71 + x72 + x73
      + x74 + x75 =E= 20;

e4..  - x76 - x77 - x78 - x79 - x80 - x81 - x82 + x83 + x84 + x85 + x86 + x87
      + x88 + x89 =E= 13;

e5..  - x90 - x91 - x92 - x93 - x94 - x95 - x96 + x97 + x98 + x99 + x100 + x101
      + x102 + x103 =E= 11;

e6..  - x104 - x105 - x106 - x107 - x108 - x109 - x110 + x111 + x112 + x113
      + x114 + x115 + x116 + x117 =E= 13;

e7..  - x118 - x119 - x120 - x121 - x122 - x123 - x124 + x125 + x126 + x127
      + x128 + x129 + x130 + x131 =E= 11;

e8..  - x132 - x133 - x134 - x135 - x136 - x137 - x138 + x139 + x140 + x141
      + x142 + x143 + x144 + x145 =E= 18;

e9..  - x146 - x147 - x148 - x149 - x150 - x151 - x152 + x153 + x154 + x155
      + x156 + x157 + x158 + x159 =E= 19;

e10..  - x160 - x161 - x162 - x163 - x164 - x165 - x166 + x167 + x168 + x169
       + x170 + x171 + x172 + x173 =E= 14;

e11..  - x174 - x175 - x176 - x177 - x178 - x179 - x180 + x181 + x182 + x183
       + x184 + x185 + x186 + x187 =E= 15;

e12..  - x188 - x189 - x190 - x191 - x192 - x193 - x194 + x195 + x196 + x197
       + x198 + x199 + x200 + x201 =E= 20;

e13..  - x202 - x203 - x204 - x205 - x206 - x207 - x208 + x209 + x210 + x211
       + x212 + x213 + x214 + x215 =E= 22;

e14..    x48 - x55 - x216 - x217 - x218 + x219 + x220 + x221 =E= 12;

e15..    x62 - x69 - x222 - x223 - x224 + x225 + x226 + x227 =E= -178;

e16..    x76 - x83 - x228 - x229 - x230 + x231 + x232 + x233 =E= 7;

e17..    x90 - x97 - x234 - x235 - x236 + x237 + x238 + x239 =E= 6;

e18..    x104 - x111 - x240 - x241 - x242 + x243 + x244 + x245 =E= 25;

e19..    x118 - x125 - x246 - x247 - x248 + x249 + x250 + x251 =E= 25;

e20..    x132 - x139 - x252 - x253 - x254 + x255 + x256 + x257 =E= 25;

e21..    x146 - x153 - x258 - x259 - x260 + x261 + x262 + x263 =E= 23;

e22..    x160 - x167 - x264 - x265 - x266 + x267 + x268 + x269 =E= 8;

e23..    x174 - x181 - x270 - x271 - x272 + x273 + x274 + x275 =E= 7;

e24..    x188 - x195 - x276 - x277 - x278 + x279 + x280 + x281 =E= 20;

e25..    x202 - x209 - x282 - x283 - x284 + x285 + x286 + x287 =E= 14;

e26..    x49 - x56 - x288 - x289 + x290 + x291 =E= 6;

e27..    x63 - x70 - x292 - x293 + x294 + x295 =E= 21;

e28..    x77 - x84 - x296 - x297 + x298 + x299 =E= -157;

e29..    x91 - x98 - x300 - x301 + x302 + x303 =E= 25;

e30..    x105 - x112 - x304 - x305 + x306 + x307 =E= 18;

e31..    x119 - x126 - x308 - x309 + x310 + x311 =E= 23;

e32..    x133 - x140 - x312 - x313 + x314 + x315 =E= 22;

e33..    x147 - x154 - x316 - x317 + x318 + x319 =E= 19;

e34..    x161 - x168 - x320 - x321 + x322 + x323 =E= 18;

e35..    x175 - x182 - x324 - x325 + x326 + x327 =E= 21;

e36..    x189 - x196 - x328 - x329 + x330 + x331 =E= 24;

e37..    x203 - x210 - x332 - x333 + x334 + x335 =E= 16;

e38..  - x336 + x337 =E= 18;

e39..  - x338 + x339 =E= 24;

e40..  - x340 + x341 =E= 9;

e41..  - x342 + x343 =E= -183;

e42..  - x344 + x345 =E= 12;

e43..  - x346 + x347 =E= 16;

e44..  - x348 + x349 =E= 6;

e45..  - x350 + x351 =E= 14;

e46..  - x352 + x353 =E= 23;

e47..  - x354 + x355 =E= 14;

e48..  - x356 + x357 =E= 18;

e49..  - x358 + x359 =E= 24;

e50..    x50 - x57 + x336 - x337 - x360 + x361 =E= 5;

e51..    x64 - x71 + x338 - x339 - x362 + x363 =E= 12;

e52..    x78 - x85 + x340 - x341 - x364 + x365 =E= 19;

e53..    x92 - x99 + x342 - x343 - x366 + x367 =E= 22;

e54..    x106 - x113 + x344 - x345 - x368 + x369 =E= -179;

e55..    x120 - x127 + x346 - x347 - x370 + x371 =E= 22;

e56..    x134 - x141 + x348 - x349 - x372 + x373 =E= 9;

e57..    x148 - x155 + x350 - x351 - x374 + x375 =E= 6;

e58..    x162 - x169 + x352 - x353 - x376 + x377 =E= 6;

e59..    x176 - x183 + x354 - x355 - x378 + x379 =E= 21;

e60..    x190 - x197 + x356 - x357 - x380 + x381 =E= 6;

e61..    x204 - x211 + x358 - x359 - x382 + x383 =E= 22;

e62..    x51 - x58 + x288 - x290 - x384 + x385 =E= 13;

e63..    x65 - x72 + x292 - x294 - x386 + x387 =E= 12;

e64..    x79 - x86 + x296 - x298 - x388 + x389 =E= 23;

e65..    x93 - x100 + x300 - x302 - x390 + x391 =E= 16;

e66..    x107 - x114 + x304 - x306 - x392 + x393 =E= 7;

e67..    x121 - x128 + x308 - x310 - x394 + x395 =E= -178;

e68..    x135 - x142 + x312 - x314 - x396 + x397 =E= 19;

e69..    x149 - x156 + x316 - x318 - x398 + x399 =E= 25;

e70..    x163 - x170 + x320 - x322 - x400 + x401 =E= 13;

e71..    x177 - x184 + x324 - x326 - x402 + x403 =E= 17;

e72..    x191 - x198 + x328 - x330 - x404 + x405 =E= 24;

e73..    x205 - x212 + x332 - x334 - x406 + x407 =E= 8;

e74..    x52 - x59 + x216 - x219 + x384 - x385 - x408 + x409 =E= 9;

e75..    x66 - x73 + x222 - x225 + x386 - x387 - x410 + x411 =E= 20;

e76..    x80 - x87 + x228 - x231 + x388 - x389 - x412 + x413 =E= 21;

e77..    x94 - x101 + x234 - x237 + x390 - x391 - x414 + x415 =E= 22;

e78..    x108 - x115 + x240 - x243 + x392 - x393 - x416 + x417 =E= 6;

e79..    x122 - x129 + x246 - x249 + x394 - x395 - x418 + x419 =E= 8;

e80..    x136 - x143 + x252 - x255 + x396 - x397 - x420 + x421 =E= -162;

e81..    x150 - x157 + x258 - x261 + x398 - x399 - x422 + x423 =E= 22;

e82..    x164 - x171 + x264 - x267 + x400 - x401 - x424 + x425 =E= 19;

e83..    x178 - x185 + x270 - x273 + x402 - x403 - x426 + x427 =E= 17;

e84..    x192 - x199 + x276 - x279 + x404 - x405 - x428 + x429 =E= 11;

e85..    x206 - x213 + x282 - x285 + x406 - x407 - x430 + x431 =E= 16;

e86..    x217 - x220 + x408 - x409 - x432 - x433 - x434 + x435 + x436 + x437
       =E= 23;

e87..    x223 - x226 + x410 - x411 - x438 - x439 - x440 + x441 + x442 + x443
       =E= 11;

e88..    x229 - x232 + x412 - x413 - x444 - x445 - x446 + x447 + x448 + x449
       =E= 21;

e89..    x235 - x238 + x414 - x415 - x450 - x451 - x452 + x453 + x454 + x455
       =E= 23;

e90..    x241 - x244 + x416 - x417 - x456 - x457 - x458 + x459 + x460 + x461
       =E= 13;

e91..    x247 - x250 + x418 - x419 - x462 - x463 - x464 + x465 + x466 + x467
       =E= 18;

e92..    x253 - x256 + x420 - x421 - x468 - x469 - x470 + x471 + x472 + x473
       =E= 8;

e93..    x259 - x262 + x422 - x423 - x474 - x475 - x476 + x477 + x478 + x479
       =E= -176;

e94..    x265 - x268 + x424 - x425 - x480 - x481 - x482 + x483 + x484 + x485
       =E= 12;

e95..    x271 - x274 + x426 - x427 - x486 - x487 - x488 + x489 + x490 + x491
       =E= 15;

e96..    x277 - x280 + x428 - x429 - x492 - x493 - x494 + x495 + x496 + x497
       =E= 7;

e97..    x283 - x286 + x430 - x431 - x498 - x499 - x500 + x501 + x502 + x503
       =E= 22;

e98..    x432 - x435 - x504 + x505 =E= 21;

e99..    x438 - x441 - x506 + x507 =E= 10;

e100..    x444 - x447 - x508 + x509 =E= 7;

e101..    x450 - x453 - x510 + x511 =E= 14;

e102..    x456 - x459 - x512 + x513 =E= 14;

e103..    x462 - x465 - x514 + x515 =E= 11;

e104..    x468 - x471 - x516 + x517 =E= 15;

e105..    x474 - x477 - x518 + x519 =E= 16;

e106..    x480 - x483 - x520 + x521 =E= -139;

e107..    x486 - x489 - x522 + x523 =E= 25;

e108..    x492 - x495 - x524 + x525 =E= 23;

e109..    x498 - x501 - x526 + x527 =E= 14;

e110..    x53 - x60 + x504 - x505 - x528 - x529 + x530 + x531 =E= 12;

e111..    x67 - x74 + x506 - x507 - x532 - x533 + x534 + x535 =E= 21;

e112..    x81 - x88 + x508 - x509 - x536 - x537 + x538 + x539 =E= 10;

e113..    x95 - x102 + x510 - x511 - x540 - x541 + x542 + x543 =E= 19;

e114..    x109 - x116 + x512 - x513 - x544 - x545 + x546 + x547 =E= 23;

e115..    x123 - x130 + x514 - x515 - x548 - x549 + x550 + x551 =E= 17;

e116..    x137 - x144 + x516 - x517 - x552 - x553 + x554 + x555 =E= 11;

e117..    x151 - x158 + x518 - x519 - x556 - x557 + x558 + x559 =E= 13;

e118..    x165 - x172 + x520 - x521 - x560 - x561 + x562 + x563 =E= 11;

e119..    x179 - x186 + x522 - x523 - x564 - x565 + x566 + x567 =E= -191;

e120..    x193 - x200 + x524 - x525 - x568 - x569 + x570 + x571 =E= 18;

e121..    x207 - x214 + x526 - x527 - x572 - x573 + x574 + x575 =E= 15;

e122..    x218 - x221 + x360 - x361 + x433 - x436 + x528 - x530 - x576 + x577
        =E= 15;

e123..    x224 - x227 + x362 - x363 + x439 - x442 + x532 - x534 - x578 + x579
        =E= 13;

e124..    x230 - x233 + x364 - x365 + x445 - x448 + x536 - x538 - x580 + x581
        =E= 6;

e125..    x236 - x239 + x366 - x367 + x451 - x454 + x540 - x542 - x582 + x583
        =E= 13;

e126..    x242 - x245 + x368 - x369 + x457 - x460 + x544 - x546 - x584 + x585
        =E= 25;

e127..    x248 - x251 + x370 - x371 + x463 - x466 + x548 - x550 - x586 + x587
        =E= 13;

e128..    x254 - x257 + x372 - x373 + x469 - x472 + x552 - x554 - x588 + x589
        =E= 14;

e129..    x260 - x263 + x374 - x375 + x475 - x478 + x556 - x558 - x590 + x591
        =E= 14;

e130..    x266 - x269 + x376 - x377 + x481 - x484 + x560 - x562 - x592 + x593
        =E= 9;

e131..    x272 - x275 + x378 - x379 + x487 - x490 + x564 - x566 - x594 + x595
        =E= 19;

e132..    x278 - x281 + x380 - x381 + x493 - x496 + x568 - x570 - x596 + x597
        =E= -193;

e133..    x284 - x287 + x382 - x383 + x499 - x502 + x572 - x574 - x598 + x599
        =E= 17;

e134..    x54 - x61 + x289 - x291 + x434 - x437 + x529 - x531 + x576 - x577
        =E= 15;

e135..    x68 - x75 + x293 - x295 + x440 - x443 + x533 - x535 + x578 - x579
        =E= 14;

e136..    x82 - x89 + x297 - x299 + x446 - x449 + x537 - x539 + x580 - x581
        =E= 21;

e137..    x96 - x103 + x301 - x303 + x452 - x455 + x541 - x543 + x582 - x583
        =E= 12;

e138..    x110 - x117 + x305 - x307 + x458 - x461 + x545 - x547 + x584 - x585
        =E= 23;

e139..    x124 - x131 + x309 - x311 + x464 - x467 + x549 - x551 + x586 - x587
        =E= 14;

e140..    x138 - x145 + x313 - x315 + x470 - x473 + x553 - x555 + x588 - x589
        =E= 15;

e141..    x152 - x159 + x317 - x319 + x476 - x479 + x557 - x559 + x590 - x591
        =E= 5;

e142..    x166 - x173 + x321 - x323 + x482 - x485 + x561 - x563 + x592 - x593
        =E= 6;

e143..    x180 - x187 + x325 - x327 + x488 - x491 + x565 - x567 + x594 - x595
        =E= 20;

e144..    x194 - x201 + x329 - x331 + x494 - x497 + x569 - x571 + x596 - x597
        =E= 22;

e145..    x208 - x215 + x333 - x335 + x500 - x503 + x573 - x575 + x598 - x599
        =E= -190;

e146..  - x48 - x62 - x76 - x90 - x104 - x118 - x132 - x146 - x160 - x174
        - x188 - x202 + x600 =G= 0;

e147..  - x49 - x63 - x77 - x91 - x105 - x119 - x133 - x147 - x161 - x175
        - x189 - x203 + x601 =G= 0;

e148..  - x50 - x64 - x78 - x92 - x106 - x120 - x134 - x148 - x162 - x176
        - x190 - x204 + x602 =G= 0;

e149..  - x51 - x65 - x79 - x93 - x107 - x121 - x135 - x149 - x163 - x177
        - x191 - x205 + x603 =G= 0;

e150..  - x52 - x66 - x80 - x94 - x108 - x122 - x136 - x150 - x164 - x178
        - x192 - x206 + x604 =G= 0;

e151..  - x53 - x67 - x81 - x95 - x109 - x123 - x137 - x151 - x165 - x179
        - x193 - x207 + x605 =G= 0;

e152..  - x54 - x68 - x82 - x96 - x110 - x124 - x138 - x152 - x166 - x180
        - x194 - x208 + x606 =G= 0;

e153..  - x55 - x69 - x83 - x97 - x111 - x125 - x139 - x153 - x167 - x181
        - x195 - x209 + x607 =G= 0;

e154..  - x216 - x222 - x228 - x234 - x240 - x246 - x252 - x258 - x264 - x270
        - x276 - x282 + x608 =G= 0;

e155..  - x217 - x223 - x229 - x235 - x241 - x247 - x253 - x259 - x265 - x271
        - x277 - x283 + x609 =G= 0;

e156..  - x218 - x224 - x230 - x236 - x242 - x248 - x254 - x260 - x266 - x272
        - x278 - x284 + x610 =G= 0;

e157..  - x56 - x70 - x84 - x98 - x112 - x126 - x140 - x154 - x168 - x182
        - x196 - x210 + x611 =G= 0;

e158..  - x288 - x292 - x296 - x300 - x304 - x308 - x312 - x316 - x320 - x324
        - x328 - x332 + x612 =G= 0;

e159..  - x289 - x293 - x297 - x301 - x305 - x309 - x313 - x317 - x321 - x325
        - x329 - x333 + x613 =G= 0;

e160..  - x336 - x338 - x340 - x342 - x344 - x346 - x348 - x350 - x352 - x354
        - x356 - x358 + x614 =G= 0;

e161..  - x57 - x71 - x85 - x99 - x113 - x127 - x141 - x155 - x169 - x183
        - x197 - x211 + x615 =G= 0;

e162..  - x337 - x339 - x341 - x343 - x345 - x347 - x349 - x351 - x353 - x355
        - x357 - x359 + x616 =G= 0;

e163..  - x360 - x362 - x364 - x366 - x368 - x370 - x372 - x374 - x376 - x378
        - x380 - x382 + x617 =G= 0;

e164..  - x58 - x72 - x86 - x100 - x114 - x128 - x142 - x156 - x170 - x184
        - x198 - x212 + x618 =G= 0;

e165..  - x290 - x294 - x298 - x302 - x306 - x310 - x314 - x318 - x322 - x326
        - x330 - x334 + x619 =G= 0;

e166..  - x384 - x386 - x388 - x390 - x392 - x394 - x396 - x398 - x400 - x402
        - x404 - x406 + x620 =G= 0;

e167..  - x59 - x73 - x87 - x101 - x115 - x129 - x143 - x157 - x171 - x185
        - x199 - x213 + x621 =G= 0;

e168..  - x219 - x225 - x231 - x237 - x243 - x249 - x255 - x261 - x267 - x273
        - x279 - x285 + x622 =G= 0;

e169..  - x385 - x387 - x389 - x391 - x393 - x395 - x397 - x399 - x401 - x403
        - x405 - x407 + x623 =G= 0;

e170..  - x408 - x410 - x412 - x414 - x416 - x418 - x420 - x422 - x424 - x426
        - x428 - x430 + x624 =G= 0;

e171..  - x220 - x226 - x232 - x238 - x244 - x250 - x256 - x262 - x268 - x274
        - x280 - x286 + x625 =G= 0;

e172..  - x409 - x411 - x413 - x415 - x417 - x419 - x421 - x423 - x425 - x427
        - x429 - x431 + x626 =G= 0;

e173..  - x432 - x438 - x444 - x450 - x456 - x462 - x468 - x474 - x480 - x486
        - x492 - x498 + x627 =G= 0;

e174..  - x433 - x439 - x445 - x451 - x457 - x463 - x469 - x475 - x481 - x487
        - x493 - x499 + x628 =G= 0;

e175..  - x434 - x440 - x446 - x452 - x458 - x464 - x470 - x476 - x482 - x488
        - x494 - x500 + x629 =G= 0;

e176..  - x435 - x441 - x447 - x453 - x459 - x465 - x471 - x477 - x483 - x489
        - x495 - x501 + x630 =G= 0;

e177..  - x504 - x506 - x508 - x510 - x512 - x514 - x516 - x518 - x520 - x522
        - x524 - x526 + x631 =G= 0;

e178..  - x60 - x74 - x88 - x102 - x116 - x130 - x144 - x158 - x172 - x186
        - x200 - x214 + x632 =G= 0;

e179..  - x505 - x507 - x509 - x511 - x513 - x515 - x517 - x519 - x521 - x523
        - x525 - x527 + x633 =G= 0;

e180..  - x528 - x532 - x536 - x540 - x544 - x548 - x552 - x556 - x560 - x564
        - x568 - x572 + x634 =G= 0;

e181..  - x529 - x533 - x537 - x541 - x545 - x549 - x553 - x557 - x561 - x565
        - x569 - x573 + x635 =G= 0;

e182..  - x221 - x227 - x233 - x239 - x245 - x251 - x257 - x263 - x269 - x275
        - x281 - x287 + x636 =G= 0;

e183..  - x361 - x363 - x365 - x367 - x369 - x371 - x373 - x375 - x377 - x379
        - x381 - x383 + x637 =G= 0;

e184..  - x436 - x442 - x448 - x454 - x460 - x466 - x472 - x478 - x484 - x490
        - x496 - x502 + x638 =G= 0;

e185..  - x530 - x534 - x538 - x542 - x546 - x550 - x554 - x558 - x562 - x566
        - x570 - x574 + x639 =G= 0;

e186..  - x576 - x578 - x580 - x582 - x584 - x586 - x588 - x590 - x592 - x594
        - x596 - x598 + x640 =G= 0;

e187..  - x61 - x75 - x89 - x103 - x117 - x131 - x145 - x159 - x173 - x187
        - x201 - x215 + x641 =G= 0;

e188..  - x291 - x295 - x299 - x303 - x307 - x311 - x315 - x319 - x323 - x327
        - x331 - x335 + x642 =G= 0;

e189..  - x437 - x443 - x449 - x455 - x461 - x467 - x473 - x479 - x485 - x491
        - x497 - x503 + x643 =G= 0;

e190..  - x531 - x535 - x539 - x543 - x547 - x551 - x555 - x559 - x563 - x567
        - x571 - x575 + x644 =G= 0;

e191..  - x577 - x579 - x581 - x583 - x585 - x587 - x589 - x591 - x593 - x595
        - x597 - x599 + x645 =G= 0;

e192..    x646 + x647 + x648 + x649 + x650 + x651 + x652 + x653 + x654 + x655
        + x656 + x657 + x658 + x659 + x660 + x661 + x662 + x663 + x664 + x665
        + x666 + x667 + x668 + x669 + x670 + x671 + x672 + x673 + x674 + x675
        + x676 + x677 + x678 + x679 + x680 + x681 + x682 + x683 + x684 + x685
        + x686 + x687 + x688 + x689 + x690 + x691 =L= 6225;

e193..  - 293*b2 + x48 + x62 + x76 + x90 + x104 + x118 + x132 + x146 + x160
        + x174 + x188 + x202 =L= 0;

e194..  - 192*b3 + x49 + x63 + x77 + x91 + x105 + x119 + x133 + x147 + x161
        + x175 + x189 + x203 =L= 0;

e195..  - 417*b4 + x50 + x64 + x78 + x92 + x106 + x120 + x134 + x148 + x162
        + x176 + x190 + x204 =L= 0;

e196..  - 427*b5 + x51 + x65 + x79 + x93 + x107 + x121 + x135 + x149 + x163
        + x177 + x191 + x205 =L= 0;

e197..  - 295*b6 + x52 + x66 + x80 + x94 + x108 + x122 + x136 + x150 + x164
        + x178 + x192 + x206 =L= 0;

e198..  - 280*b7 + x53 + x67 + x81 + x95 + x109 + x123 + x137 + x151 + x165
        + x179 + x193 + x207 =L= 0;

e199..  - 337*b8 + x54 + x68 + x82 + x96 + x110 + x124 + x138 + x152 + x166
        + x180 + x194 + x208 =L= 0;

e200..  - 293*b9 + x55 + x69 + x83 + x97 + x111 + x125 + x139 + x153 + x167
        + x181 + x195 + x209 =L= 0;

e201..  - 341*b10 + x216 + x222 + x228 + x234 + x240 + x246 + x252 + x258
        + x264 + x270 + x276 + x282 =L= 0;

e202..  - 276*b11 + x217 + x223 + x229 + x235 + x241 + x247 + x253 + x259
        + x265 + x271 + x277 + x283 =L= 0;

e203..  - 119*b12 + x218 + x224 + x230 + x236 + x242 + x248 + x254 + x260
        + x266 + x272 + x278 + x284 =L= 0;

e204..  - 192*b13 + x56 + x70 + x84 + x98 + x112 + x126 + x140 + x154 + x168
        + x182 + x196 + x210 =L= 0;

e205..  - 347*b14 + x288 + x292 + x296 + x300 + x304 + x308 + x312 + x316
        + x320 + x324 + x328 + x332 =L= 0;

e206..  - 398*b15 + x289 + x293 + x297 + x301 + x305 + x309 + x313 + x317
        + x321 + x325 + x329 + x333 =L= 0;

e207..  - 359*b16 + x336 + x338 + x340 + x342 + x344 + x346 + x348 + x350
        + x352 + x354 + x356 + x358 =L= 0;

e208..  - 417*b17 + x57 + x71 + x85 + x99 + x113 + x127 + x141 + x155 + x169
        + x183 + x197 + x211 =L= 0;

e209..  - 359*b18 + x337 + x339 + x341 + x343 + x345 + x347 + x349 + x351
        + x353 + x355 + x357 + x359 =L= 0;

e210..  - 193*b19 + x360 + x362 + x364 + x366 + x368 + x370 + x372 + x374
        + x376 + x378 + x380 + x382 =L= 0;

e211..  - 427*b20 + x58 + x72 + x86 + x100 + x114 + x128 + x142 + x156 + x170
        + x184 + x198 + x212 =L= 0;

e212..  - 347*b21 + x290 + x294 + x298 + x302 + x306 + x310 + x314 + x318
        + x322 + x326 + x330 + x334 =L= 0;

e213..  - 218*b22 + x384 + x386 + x388 + x390 + x392 + x394 + x396 + x398
        + x400 + x402 + x404 + x406 =L= 0;

e214..  - 295*b23 + x59 + x73 + x87 + x101 + x115 + x129 + x143 + x157 + x171
        + x185 + x199 + x213 =L= 0;

e215..  - 341*b24 + x219 + x225 + x231 + x237 + x243 + x249 + x255 + x261
        + x267 + x273 + x279 + x285 =L= 0;

e216..  - 218*b25 + x385 + x387 + x389 + x391 + x393 + x395 + x397 + x399
        + x401 + x403 + x405 + x407 =L= 0;

e217..  - 134*b26 + x408 + x410 + x412 + x414 + x416 + x418 + x420 + x422
        + x424 + x426 + x428 + x430 =L= 0;

e218..  - 276*b27 + x220 + x226 + x232 + x238 + x244 + x250 + x256 + x262
        + x268 + x274 + x280 + x286 =L= 0;

e219..  - 134*b28 + x409 + x411 + x413 + x415 + x417 + x419 + x421 + x423
        + x425 + x427 + x429 + x431 =L= 0;

e220..  - 200*b29 + x432 + x438 + x444 + x450 + x456 + x462 + x468 + x474
        + x480 + x486 + x492 + x498 =L= 0;

e221..  - 222*b30 + x433 + x439 + x445 + x451 + x457 + x463 + x469 + x475
        + x481 + x487 + x493 + x499 =L= 0;

e222..  - 196*b31 + x434 + x440 + x446 + x452 + x458 + x464 + x470 + x476
        + x482 + x488 + x494 + x500 =L= 0;

e223..  - 200*b32 + x435 + x441 + x447 + x453 + x459 + x465 + x471 + x477
        + x483 + x489 + x495 + x501 =L= 0;

e224..  - 129*b33 + x504 + x506 + x508 + x510 + x512 + x514 + x516 + x518
        + x520 + x522 + x524 + x526 =L= 0;

e225..  - 280*b34 + x60 + x74 + x88 + x102 + x116 + x130 + x144 + x158 + x172
        + x186 + x200 + x214 =L= 0;

e226..  - 129*b35 + x505 + x507 + x509 + x511 + x513 + x515 + x517 + x519
        + x521 + x523 + x525 + x527 =L= 0;

e227..  - 382*b36 + x528 + x532 + x536 + x540 + x544 + x548 + x552 + x556
        + x560 + x564 + x568 + x572 =L= 0;

e228..  - 424*b37 + x529 + x533 + x537 + x541 + x545 + x549 + x553 + x557
        + x561 + x565 + x569 + x573 =L= 0;

e229..  - 119*b38 + x221 + x227 + x233 + x239 + x245 + x251 + x257 + x263
        + x269 + x275 + x281 + x287 =L= 0;

e230..  - 193*b39 + x361 + x363 + x365 + x367 + x369 + x371 + x373 + x375
        + x377 + x379 + x381 + x383 =L= 0;

e231..  - 222*b40 + x436 + x442 + x448 + x454 + x460 + x466 + x472 + x478
        + x484 + x490 + x496 + x502 =L= 0;

e232..  - 382*b41 + x530 + x534 + x538 + x542 + x546 + x550 + x554 + x558
        + x562 + x566 + x570 + x574 =L= 0;

e233..  - 275*b42 + x576 + x578 + x580 + x582 + x584 + x586 + x588 + x590
        + x592 + x594 + x596 + x598 =L= 0;

e234..  - 337*b43 + x61 + x75 + x89 + x103 + x117 + x131 + x145 + x159 + x173
        + x187 + x201 + x215 =L= 0;

e235..  - 398*b44 + x291 + x295 + x299 + x303 + x307 + x311 + x315 + x319
        + x323 + x327 + x331 + x335 =L= 0;

e236..  - 196*b45 + x437 + x443 + x449 + x455 + x461 + x467 + x473 + x479
        + x485 + x491 + x497 + x503 =L= 0;

e237..  - 424*b46 + x531 + x535 + x539 + x543 + x547 + x551 + x555 + x559
        + x563 + x567 + x571 + x575 =L= 0;

e238..  - 275*b47 + x577 + x579 + x581 + x583 + x585 + x587 + x589 + x591
        + x593 + x595 + x597 + x599 =L= 0;

e239.. 293*x600*b2 - 293*x646*b2 + x646*x600 =L= 0;

e240.. 192*x601*b3 - 192*x647*b3 + x647*x601 =L= 0;

e241.. 417*x602*b4 - 417*x648*b4 + x648*x602 =L= 0;

e242.. 427*x603*b5 - 427*x649*b5 + x649*x603 =L= 0;

e243.. 295*x604*b6 - 295*x650*b6 + x650*x604 =L= 0;

e244.. 280*x605*b7 - 280*x651*b7 + x651*x605 =L= 0;

e245.. 337*x606*b8 - 337*x652*b8 + x652*x606 =L= 0;

e246.. 293*x607*b9 - 293*x653*b9 + x653*x607 =L= 0;

e247.. 341*x608*b10 - 341*x654*b10 + x654*x608 =L= 0;

e248.. 276*x609*b11 - 276*x655*b11 + x655*x609 =L= 0;

e249.. 119*x610*b12 - 119*x656*b12 + x656*x610 =L= 0;

e250.. 192*x611*b13 - 192*x657*b13 + x657*x611 =L= 0;

e251.. 347*x612*b14 - 347*x658*b14 + x658*x612 =L= 0;

e252.. 398*x613*b15 - 398*x659*b15 + x659*x613 =L= 0;

e253.. 359*x614*b16 - 359*x660*b16 + x660*x614 =L= 0;

e254.. 417*x615*b17 - 417*x661*b17 + x661*x615 =L= 0;

e255.. 359*x616*b18 - 359*x662*b18 + x662*x616 =L= 0;

e256.. 193*x617*b19 - 193*x663*b19 + x663*x617 =L= 0;

e257.. 427*x618*b20 - 427*x664*b20 + x664*x618 =L= 0;

e258.. 347*x619*b21 - 347*x665*b21 + x665*x619 =L= 0;

e259.. 218*x620*b22 - 218*x666*b22 + x666*x620 =L= 0;

e260.. 295*x621*b23 - 295*x667*b23 + x667*x621 =L= 0;

e261.. 341*x622*b24 - 341*x668*b24 + x668*x622 =L= 0;

e262.. 218*x623*b25 - 218*x669*b25 + x669*x623 =L= 0;

e263.. 134*x624*b26 - 134*x670*b26 + x670*x624 =L= 0;

e264.. 276*x625*b27 - 276*x671*b27 + x671*x625 =L= 0;

e265.. 134*x626*b28 - 134*x672*b28 + x672*x626 =L= 0;

e266.. 200*x627*b29 - 200*x673*b29 + x673*x627 =L= 0;

e267.. 222*x628*b30 - 222*x674*b30 + x674*x628 =L= 0;

e268.. 196*x629*b31 - 196*x675*b31 + x675*x629 =L= 0;

e269.. 200*x630*b32 - 200*x676*b32 + x676*x630 =L= 0;

e270.. 129*x631*b33 - 129*x677*b33 + x677*x631 =L= 0;

e271.. 280*x632*b34 - 280*x678*b34 + x678*x632 =L= 0;

e272.. 129*x633*b35 - 129*x679*b35 + x679*x633 =L= 0;

e273.. 382*x634*b36 - 382*x680*b36 + x680*x634 =L= 0;

e274.. 424*x635*b37 - 424*x681*b37 + x681*x635 =L= 0;

e275.. 119*x636*b38 - 119*x682*b38 + x682*x636 =L= 0;

e276.. 193*x637*b39 - 193*x683*b39 + x683*x637 =L= 0;

e277.. 222*x638*b40 - 222*x684*b40 + x684*x638 =L= 0;

e278.. 382*x639*b41 - 382*x685*b41 + x685*x639 =L= 0;

e279.. 275*x640*b42 - 275*x686*b42 + x686*x640 =L= 0;

e280.. 337*x641*b43 - 337*x687*b43 + x687*x641 =L= 0;

e281.. 398*x642*b44 - 398*x688*b44 + x688*x642 =L= 0;

e282.. 196*x643*b45 - 196*x689*b45 + x689*x643 =L= 0;

e283.. 424*x644*b46 - 424*x690*b46 + x690*x644 =L= 0;

e284.. 275*x645*b47 - 275*x691*b47 + x691*x645 =L= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
