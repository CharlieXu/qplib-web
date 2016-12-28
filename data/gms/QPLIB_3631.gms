$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        236      186        0       50        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        894      144      750        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*       2057     1946      111        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52
          ,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69
          ,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86
          ,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102
          ,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115
          ,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127,x128
          ,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x140,x141
          ,x142,x143,x144,b145,b146,b147,b148,b149,b150,b151,b152,b153,b154
          ,b155,b156,b157,b158,b159,b160,b161,b162,b163,b164,b165,b166,b167
          ,b168,b169,b170,b171,b172,b173,b174,b175,b176,b177,b178,b179,b180
          ,b181,b182,b183,b184,b185,b186,b187,b188,b189,b190,b191,b192,b193
          ,b194,b195,b196,b197,b198,b199,b200,b201,b202,b203,b204,b205,b206
          ,b207,b208,b209,b210,b211,b212,b213,b214,b215,b216,b217,b218,b219
          ,b220,b221,b222,b223,b224,b225,b226,b227,b228,b229,b230,b231,b232
          ,b233,b234,b235,b236,b237,b238,b239,b240,b241,b242,b243,b244,b245
          ,b246,b247,b248,b249,b250,b251,b252,b253,b254,b255,b256,b257,b258
          ,b259,b260,b261,b262,b263,b264,b265,b266,b267,b268,b269,b270,b271
          ,b272,b273,b274,b275,b276,b277,b278,b279,b280,b281,b282,b283,b284
          ,b285,b286,b287,b288,b289,b290,b291,b292,b293,b294,b295,b296,b297
          ,b298,b299,b300,b301,b302,b303,b304,b305,b306,b307,b308,b309,b310
          ,b311,b312,b313,b314,b315,b316,b317,b318,b319,b320,b321,b322,b323
          ,b324,b325,b326,b327,b328,b329,b330,b331,b332,b333,b334,b335,b336
          ,b337,b338,b339,b340,b341,b342,b343,b344,b345,b346,b347,b348,b349
          ,b350,b351,b352,b353,b354,b355,b356,b357,b358,b359,b360,b361,b362
          ,b363,b364,b365,b366,b367,b368,b369,b370,b371,b372,b373,b374,b375
          ,b376,b377,b378,b379,b380,b381,b382,b383,b384,b385,b386,b387,b388
          ,b389,b390,b391,b392,b393,b394,b395,b396,b397,b398,b399,b400,b401
          ,b402,b403,b404,b405,b406,b407,b408,b409,b410,b411,b412,b413,b414
          ,b415,b416,b417,b418,b419,b420,b421,b422,b423,b424,b425,b426,b427
          ,b428,b429,b430,b431,b432,b433,b434,b435,b436,b437,b438,b439,b440
          ,b441,b442,b443,b444,b445,b446,b447,b448,b449,b450,b451,b452,b453
          ,b454,b455,b456,b457,b458,b459,b460,b461,b462,b463,b464,b465,b466
          ,b467,b468,b469,b470,b471,b472,b473,b474,b475,b476,b477,b478,b479
          ,b480,b481,b482,b483,b484,b485,b486,b487,b488,b489,b490,b491,b492
          ,b493,b494,b495,b496,b497,b498,b499,b500,b501,b502,b503,b504,b505
          ,b506,b507,b508,b509,b510,b511,b512,b513,b514,b515,b516,b517,b518
          ,b519,b520,b521,b522,b523,b524,b525,b526,b527,b528,b529,b530,b531
          ,b532,b533,b534,b535,b536,b537,b538,b539,b540,b541,b542,b543,b544
          ,b545,b546,b547,b548,b549,b550,b551,b552,b553,b554,b555,b556,b557
          ,b558,b559,b560,b561,b562,b563,b564,b565,b566,b567,b568,b569,b570
          ,b571,b572,b573,b574,b575,b576,b577,b578,b579,b580,b581,b582,b583
          ,b584,b585,b586,b587,b588,b589,b590,b591,b592,b593,b594,b595,b596
          ,b597,b598,b599,b600,b601,b602,b603,b604,b605,b606,b607,b608,b609
          ,b610,b611,b612,b613,b614,b615,b616,b617,b618,b619,b620,b621,b622
          ,b623,b624,b625,b626,b627,b628,b629,b630,b631,b632,b633,b634,b635
          ,b636,b637,b638,b639,b640,b641,b642,b643,b644,b645,b646,b647,b648
          ,b649,b650,b651,b652,b653,b654,b655,b656,b657,b658,b659,b660,b661
          ,b662,b663,b664,b665,b666,b667,b668,b669,b670,b671,b672,b673,b674
          ,b675,b676,b677,b678,b679,b680,b681,b682,b683,b684,b685,b686,b687
          ,b688,b689,b690,b691,b692,b693,b694,b695,b696,b697,b698,b699,b700
          ,b701,b702,b703,b704,b705,b706,b707,b708,b709,b710,b711,b712,b713
          ,b714,b715,b716,b717,b718,b719,b720,b721,b722,b723,b724,b725,b726
          ,b727,b728,b729,b730,b731,b732,b733,b734,b735,b736,b737,b738,b739
          ,b740,b741,b742,b743,b744,b745,b746,b747,b748,b749,b750,b751,b752
          ,b753,b754,b755,b756,b757,b758,b759,b760,b761,b762,b763,b764,b765
          ,b766,b767,b768,b769,b770,b771,b772,b773,b774,b775,b776,b777,b778
          ,b779,b780,b781,b782,b783,b784,b785,b786,b787,b788,b789,b790,b791
          ,b792,b793,b794,b795,b796,b797,b798,b799,b800,b801,b802,b803,b804
          ,b805,b806,b807,b808,b809,b810,b811,b812,b813,b814,b815,b816,b817
          ,b818,b819,b820,b821,b822,b823,b824,b825,b826,b827,b828,b829,b830
          ,b831,b832,b833,b834,b835,b836,b837,b838,b839,b840,b841,b842,b843
          ,b844,b845,b846,b847,b848,b849,b850,b851,b852,b853,b854,b855,b856
          ,b857,b858,b859,b860,b861,b862,b863,b864,b865,b866,b867,b868,b869
          ,b870,b871,b872,b873,b874,b875,b876,b877,b878,b879,b880,b881,b882
          ,b883,b884,b885,b886,b887,b888,b889,b890,b891,b892,b893,b894;

Binary Variables  b145,b146,b147,b148,b149,b150,b151,b152,b153,b154,b155,b156
          ,b157,b158,b159,b160,b161,b162,b163,b164,b165,b166,b167,b168,b169
          ,b170,b171,b172,b173,b174,b175,b176,b177,b178,b179,b180,b181,b182
          ,b183,b184,b185,b186,b187,b188,b189,b190,b191,b192,b193,b194,b195
          ,b196,b197,b198,b199,b200,b201,b202,b203,b204,b205,b206,b207,b208
          ,b209,b210,b211,b212,b213,b214,b215,b216,b217,b218,b219,b220,b221
          ,b222,b223,b224,b225,b226,b227,b228,b229,b230,b231,b232,b233,b234
          ,b235,b236,b237,b238,b239,b240,b241,b242,b243,b244,b245,b246,b247
          ,b248,b249,b250,b251,b252,b253,b254,b255,b256,b257,b258,b259,b260
          ,b261,b262,b263,b264,b265,b266,b267,b268,b269,b270,b271,b272,b273
          ,b274,b275,b276,b277,b278,b279,b280,b281,b282,b283,b284,b285,b286
          ,b287,b288,b289,b290,b291,b292,b293,b294,b295,b296,b297,b298,b299
          ,b300,b301,b302,b303,b304,b305,b306,b307,b308,b309,b310,b311,b312
          ,b313,b314,b315,b316,b317,b318,b319,b320,b321,b322,b323,b324,b325
          ,b326,b327,b328,b329,b330,b331,b332,b333,b334,b335,b336,b337,b338
          ,b339,b340,b341,b342,b343,b344,b345,b346,b347,b348,b349,b350,b351
          ,b352,b353,b354,b355,b356,b357,b358,b359,b360,b361,b362,b363,b364
          ,b365,b366,b367,b368,b369,b370,b371,b372,b373,b374,b375,b376,b377
          ,b378,b379,b380,b381,b382,b383,b384,b385,b386,b387,b388,b389,b390
          ,b391,b392,b393,b394,b395,b396,b397,b398,b399,b400,b401,b402,b403
          ,b404,b405,b406,b407,b408,b409,b410,b411,b412,b413,b414,b415,b416
          ,b417,b418,b419,b420,b421,b422,b423,b424,b425,b426,b427,b428,b429
          ,b430,b431,b432,b433,b434,b435,b436,b437,b438,b439,b440,b441,b442
          ,b443,b444,b445,b446,b447,b448,b449,b450,b451,b452,b453,b454,b455
          ,b456,b457,b458,b459,b460,b461,b462,b463,b464,b465,b466,b467,b468
          ,b469,b470,b471,b472,b473,b474,b475,b476,b477,b478,b479,b480,b481
          ,b482,b483,b484,b485,b486,b487,b488,b489,b490,b491,b492,b493,b494
          ,b495,b496,b497,b498,b499,b500,b501,b502,b503,b504,b505,b506,b507
          ,b508,b509,b510,b511,b512,b513,b514,b515,b516,b517,b518,b519,b520
          ,b521,b522,b523,b524,b525,b526,b527,b528,b529,b530,b531,b532,b533
          ,b534,b535,b536,b537,b538,b539,b540,b541,b542,b543,b544,b545,b546
          ,b547,b548,b549,b550,b551,b552,b553,b554,b555,b556,b557,b558,b559
          ,b560,b561,b562,b563,b564,b565,b566,b567,b568,b569,b570,b571,b572
          ,b573,b574,b575,b576,b577,b578,b579,b580,b581,b582,b583,b584,b585
          ,b586,b587,b588,b589,b590,b591,b592,b593,b594,b595,b596,b597,b598
          ,b599,b600,b601,b602,b603,b604,b605,b606,b607,b608,b609,b610,b611
          ,b612,b613,b614,b615,b616,b617,b618,b619,b620,b621,b622,b623,b624
          ,b625,b626,b627,b628,b629,b630,b631,b632,b633,b634,b635,b636,b637
          ,b638,b639,b640,b641,b642,b643,b644,b645,b646,b647,b648,b649,b650
          ,b651,b652,b653,b654,b655,b656,b657,b658,b659,b660,b661,b662,b663
          ,b664,b665,b666,b667,b668,b669,b670,b671,b672,b673,b674,b675,b676
          ,b677,b678,b679,b680,b681,b682,b683,b684,b685,b686,b687,b688,b689
          ,b690,b691,b692,b693,b694,b695,b696,b697,b698,b699,b700,b701,b702
          ,b703,b704,b705,b706,b707,b708,b709,b710,b711,b712,b713,b714,b715
          ,b716,b717,b718,b719,b720,b721,b722,b723,b724,b725,b726,b727,b728
          ,b729,b730,b731,b732,b733,b734,b735,b736,b737,b738,b739,b740,b741
          ,b742,b743,b744,b745,b746,b747,b748,b749,b750,b751,b752,b753,b754
          ,b755,b756,b757,b758,b759,b760,b761,b762,b763,b764,b765,b766,b767
          ,b768,b769,b770,b771,b772,b773,b774,b775,b776,b777,b778,b779,b780
          ,b781,b782,b783,b784,b785,b786,b787,b788,b789,b790,b791,b792,b793
          ,b794,b795,b796,b797,b798,b799,b800,b801,b802,b803,b804,b805,b806
          ,b807,b808,b809,b810,b811,b812,b813,b814,b815,b816,b817,b818,b819
          ,b820,b821,b822,b823,b824,b825,b826,b827,b828,b829,b830,b831,b832
          ,b833,b834,b835,b836,b837,b838,b839,b840,b841,b842,b843,b844,b845
          ,b846,b847,b848,b849,b850,b851,b852,b853,b854,b855,b856,b857,b858
          ,b859,b860,b861,b862,b863,b864,b865,b866,b867,b868,b869,b870,b871
          ,b872,b873,b874,b875,b876,b877,b878,b879,b880,b881,b882,b883,b884
          ,b885,b886,b887,b888,b889,b890,b891,b892,b893,b894;

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
          ,e234,e235,e236;


e1..  - objvar + 7.5*x2 + 13.05038314*x3 + 13.05038314*x4 + 13.05038314*x5
      + 13.05038314*x6 + 10.68000468*x7 + 10.68000468*x8 + 10.68000468*x9
      + 10.68000468*x10 + 7.5*x11 + 7.5*x12 + 7.5*x13 + 7.5*x14
      + 18.11422093*x15 + 18.11422093*x16 + 18.11422093*x17 + 18.11422093*x18
      + 18.11422093*x19 + 18.11422093*x20 + 18.11422093*x21 + 18.11422093*x22
      + 13.34634782*x23 + 13.34634782*x24 + 13.34634782*x25 + 13.34634782*x26
      =E= 0;

e2..  - 133.3333333*x2 + x45 =E= 0;

e3..  - 76.62610282*x3 + x46 =E= 0;

e4..  - 76.62610282*x4 + x47 =E= 0;

e5..  - 76.62610282*x5 + x48 =E= 0;

e6..  - 76.62610282*x6 + x49 =E= 0;

e7..  - 93.63291776*x7 + x50 =E= 0;

e8..  - 93.63291776*x8 + x51 =E= 0;

e9..  - 93.63291776*x9 + x52 =E= 0;

e10..  - 93.63291776*x10 + x53 =E= 0;

e11..  - 133.3333333*x11 + x54 =E= 0;

e12..  - 133.3333333*x12 + x55 =E= 0;

e13..  - 133.3333333*x13 + x56 =E= 0;

e14..  - 133.3333333*x14 + x57 =E= 0;

e15..  - 55.20524475*x15 + x58 =E= 0;

e16..  - 55.20524475*x16 + x59 =E= 0;

e17..  - 55.20524475*x17 + x60 =E= 0;

e18..  - 55.20524475*x18 + x61 =E= 0;

e19..  - 55.20524475*x19 + x62 =E= 0;

e20..  - 55.20524475*x20 + x63 =E= 0;

e21..  - 55.20524475*x21 + x64 =E= 0;

e22..  - 55.20524475*x22 + x65 =E= 0;

e23..  - 74.92686493*x23 + x66 =E= 0;

e24..  - 74.92686493*x24 + x67 =E= 0;

e25..  - 74.92686493*x25 + x68 =E= 0;

e26..  - 74.92686493*x26 + x69 =E= 0;

e27..  - 40*x2 + x70 =E= 0;

e28..  - 40*x3 + x71 =E= 0;

e29..  - 40*x4 + x72 =E= 0;

e30..  - 40*x5 + x73 =E= 0;

e31..  - 40*x6 + x74 =E= 0;

e32..  - 40*x7 + x75 =E= 0;

e33..  - 40*x8 + x76 =E= 0;

e34..  - 40*x9 + x77 =E= 0;

e35..  - 40*x10 + x78 =E= 0;

e36..  - 40*x11 + x79 =E= 0;

e37..  - 40*x12 + x80 =E= 0;

e38..  - 40*x13 + x81 =E= 0;

e39..  - 40*x14 + x82 =E= 0;

e40..  - 40*x15 + x83 =E= 0;

e41..  - 40*x16 + x84 =E= 0;

e42..  - 40*x17 + x85 =E= 0;

e43..  - 40*x18 + x86 =E= 0;

e44..  - 40*x19 + x87 =E= 0;

e45..  - 40*x20 + x88 =E= 0;

e46..  - 40*x21 + x89 =E= 0;

e47..  - 40*x22 + x90 =E= 0;

e48..  - 40*x23 + x91 =E= 0;

e49..  - 40*x24 + x92 =E= 0;

e50..  - 40*x25 + x93 =E= 0;

e51..  - 40*x26 + x94 =E= 0;

e52..  - 40*x2 + x95 =E= 0;

e53..  - 40*x3 + x96 =E= 0;

e54..  - 40*x4 + x97 =E= 0;

e55..  - 40*x5 + x98 =E= 0;

e56..  - 40*x6 + x99 =E= 0;

e57..  - 40*x7 + x100 =E= 0;

e58..  - 40*x8 + x101 =E= 0;

e59..  - 40*x9 + x102 =E= 0;

e60..  - 40*x10 + x103 =E= 0;

e61..  - 40*x11 + x104 =E= 0;

e62..  - 40*x12 + x105 =E= 0;

e63..  - 40*x13 + x106 =E= 0;

e64..  - 40*x14 + x107 =E= 0;

e65..  - 40*x15 + x108 =E= 0;

e66..  - 40*x16 + x109 =E= 0;

e67..  - 40*x17 + x110 =E= 0;

e68..  - 40*x18 + x111 =E= 0;

e69..  - 40*x19 + x112 =E= 0;

e70..  - 40*x20 + x113 =E= 0;

e71..  - 40*x21 + x114 =E= 0;

e72..  - 40*x22 + x115 =E= 0;

e73..  - 40*x23 + x116 =E= 0;

e74..  - 40*x24 + x117 =E= 0;

e75..  - 40*x25 + x118 =E= 0;

e76..  - 40*x26 + x119 =E= 0;

e77..  - x120 - 0.5746957711*x121 - 0.5746957711*x122 =E= 1;

e78..  - 0.2873478856*x121 + 0.2873478856*x122 - 0.3511234416*x123
       + 0.3511234416*x124 =E= 10;

e79..    0.7662610282*x121 + 0.7662610282*x122 + 0.9363291776*x123
       + 0.9363291776*x124 =E= -10;

e80..    x120 + 0.5746957711*x125 + 0.5746957711*x126 =E= 0;

e81..  - 0.2873478856*x125 + 0.2873478856*x126 - 0.3511234416*x127
       + 0.3511234416*x128 =E= 10;

e82..    0.7662610282*x125 + 0.7662610282*x126 + 0.9363291776*x127
       + 0.9363291776*x128 =E= -10;

e83..  - 0.5746957711*x125 - x129 + 0.3450327797*x130 - 0.7590721153*x131
       + 0.4682929058*x132 =E= 0.5;

e84..    0.3511234416*x123 + 0.2873478856*x125 + 0.7590721153*x130
       - 0.3450327797*x131 - 0.4682929058*x132 + x133 =E= 0;

e85..  - 0.9363291776*x123 - 0.7662610282*x125 + 0.5520524475*x130
       + 0.5520524475*x131 + 0.7492686493*x132 =E= 0;

e86..    0.5746957711*x121 + x129 - 0.3450327797*x134 + 0.7590721153*x135
       - 0.4682929058*x136 =E= 0;

e87..    0.2873478856*x121 + 0.3511234416*x127 + 0.7590721153*x134
       - 0.3450327797*x135 - 0.4682929058*x136 + x137 =E= 0;

e88..  - 0.7662610282*x121 - 0.9363291776*x127 + 0.5520524475*x134
       + 0.5520524475*x135 + 0.7492686493*x136 =E= 0;

e89..    0.5746957711*x122 + x138 - 0.3450327797*x139 + 0.7590721153*x140
       - 0.4682929058*x141 =E= 0;

e90..  - 0.2873478856*x122 - 0.3511234416*x128 - x137 - 0.7590721153*x139
       + 0.3450327797*x140 + 0.4682929058*x141 =E= 0;

e91..  - 0.7662610282*x122 - 0.9363291776*x128 + 0.5520524475*x139
       + 0.5520524475*x140 + 0.7492686493*x141 =E= 0;

e92..  - 0.5746957711*x126 - x138 + 0.3450327797*x142 - 0.7590721153*x143
       + 0.4682929058*x144 =E= 0.6;

e93..  - 0.3511234416*x124 - 0.2873478856*x126 - x133 - 0.7590721153*x142
       + 0.3450327797*x143 + 0.4682929058*x144 =E= 0;

e94..  - 0.9363291776*x124 - 0.7662610282*x126 + 0.5520524475*x142
       + 0.5520524475*x143 + 0.7492686493*x144 =E= 0;

e95..  - x70 + x120 =L= 0;

e96..  - x95 - x120 =L= 0;

e97..  - x71 + x121 =L= 0;

e98..  - x96 - x121 =L= 0;

e99..  - x72 + x125 =L= 0;

e100..  - x97 - x125 =L= 0;

e101..  - x73 + x122 =L= 0;

e102..  - x98 - x122 =L= 0;

e103..  - x74 + x126 =L= 0;

e104..  - x99 - x126 =L= 0;

e105..  - x75 + x127 =L= 0;

e106..  - x100 - x127 =L= 0;

e107..  - x76 + x128 =L= 0;

e108..  - x101 - x128 =L= 0;

e109..  - x77 + x123 =L= 0;

e110..  - x102 - x123 =L= 0;

e111..  - x78 + x124 =L= 0;

e112..  - x103 - x124 =L= 0;

e113..  - x79 + x133 =L= 0;

e114..  - x104 - x133 =L= 0;

e115..  - x80 + x137 =L= 0;

e116..  - x105 - x137 =L= 0;

e117..  - x81 + x129 =L= 0;

e118..  - x106 - x129 =L= 0;

e119..  - x82 + x138 =L= 0;

e120..  - x107 - x138 =L= 0;

e121..  - x83 + x130 =L= 0;

e122..  - x108 - x130 =L= 0;

e123..  - x84 + x142 =L= 0;

e124..  - x109 - x142 =L= 0;

e125..  - x85 + x134 =L= 0;

e126..  - x110 - x134 =L= 0;

e127..  - x86 + x139 =L= 0;

e128..  - x111 - x139 =L= 0;

e129..  - x87 + x135 =L= 0;

e130..  - x112 - x135 =L= 0;

e131..  - x88 + x131 =L= 0;

e132..  - x113 - x131 =L= 0;

e133..  - x89 + x140 =L= 0;

e134..  - x114 - x140 =L= 0;

e135..  - x90 + x143 =L= 0;

e136..  - x115 - x143 =L= 0;

e137..  - x91 + x144 =L= 0;

e138..  - x116 - x144 =L= 0;

e139..  - x92 + x132 =L= 0;

e140..  - x117 - x132 =L= 0;

e141..  - x93 + x136 =L= 0;

e142..  - x118 - x136 =L= 0;

e143..  - x94 + x141 =L= 0;

e144..  - x119 - x141 =L= 0;

e145..  - x2 + 0.1*b145 + 0.2*b146 + 0.3*b147 + 0.4*b148 + 0.5*b149 + 0.6*b150
        + 0.7*b151 + 0.8*b152 + 0.9*b153 + b154 + 1.1*b155 + 1.2*b156
        + 1.3*b157 + 1.4*b158 + 1.5*b159 + 1.6*b160 + 1.7*b161 + 1.8*b162
        + 1.9*b163 + 2*b164 + 2.1*b165 + 2.2*b166 + 2.3*b167 + 2.4*b168
        + 2.5*b169 + 2.6*b170 + 2.8*b171 + 3*b172 + 3.2*b173 + 3.4*b174 =E= 0;

e146..  - x3 + 0.1*b175 + 0.2*b176 + 0.3*b177 + 0.4*b178 + 0.5*b179 + 0.6*b180
        + 0.7*b181 + 0.8*b182 + 0.9*b183 + b184 + 1.1*b185 + 1.2*b186
        + 1.3*b187 + 1.4*b188 + 1.5*b189 + 1.6*b190 + 1.7*b191 + 1.8*b192
        + 1.9*b193 + 2*b194 + 2.1*b195 + 2.2*b196 + 2.3*b197 + 2.4*b198
        + 2.5*b199 + 2.6*b200 + 2.8*b201 + 3*b202 + 3.2*b203 + 3.4*b204 =E= 0;

e147..  - x4 + 0.1*b205 + 0.2*b206 + 0.3*b207 + 0.4*b208 + 0.5*b209 + 0.6*b210
        + 0.7*b211 + 0.8*b212 + 0.9*b213 + b214 + 1.1*b215 + 1.2*b216
        + 1.3*b217 + 1.4*b218 + 1.5*b219 + 1.6*b220 + 1.7*b221 + 1.8*b222
        + 1.9*b223 + 2*b224 + 2.1*b225 + 2.2*b226 + 2.3*b227 + 2.4*b228
        + 2.5*b229 + 2.6*b230 + 2.8*b231 + 3*b232 + 3.2*b233 + 3.4*b234 =E= 0;

e148..  - x5 + 0.1*b235 + 0.2*b236 + 0.3*b237 + 0.4*b238 + 0.5*b239 + 0.6*b240
        + 0.7*b241 + 0.8*b242 + 0.9*b243 + b244 + 1.1*b245 + 1.2*b246
        + 1.3*b247 + 1.4*b248 + 1.5*b249 + 1.6*b250 + 1.7*b251 + 1.8*b252
        + 1.9*b253 + 2*b254 + 2.1*b255 + 2.2*b256 + 2.3*b257 + 2.4*b258
        + 2.5*b259 + 2.6*b260 + 2.8*b261 + 3*b262 + 3.2*b263 + 3.4*b264 =E= 0;

e149..  - x6 + 0.1*b265 + 0.2*b266 + 0.3*b267 + 0.4*b268 + 0.5*b269 + 0.6*b270
        + 0.7*b271 + 0.8*b272 + 0.9*b273 + b274 + 1.1*b275 + 1.2*b276
        + 1.3*b277 + 1.4*b278 + 1.5*b279 + 1.6*b280 + 1.7*b281 + 1.8*b282
        + 1.9*b283 + 2*b284 + 2.1*b285 + 2.2*b286 + 2.3*b287 + 2.4*b288
        + 2.5*b289 + 2.6*b290 + 2.8*b291 + 3*b292 + 3.2*b293 + 3.4*b294 =E= 0;

e150..  - x7 + 0.1*b295 + 0.2*b296 + 0.3*b297 + 0.4*b298 + 0.5*b299 + 0.6*b300
        + 0.7*b301 + 0.8*b302 + 0.9*b303 + b304 + 1.1*b305 + 1.2*b306
        + 1.3*b307 + 1.4*b308 + 1.5*b309 + 1.6*b310 + 1.7*b311 + 1.8*b312
        + 1.9*b313 + 2*b314 + 2.1*b315 + 2.2*b316 + 2.3*b317 + 2.4*b318
        + 2.5*b319 + 2.6*b320 + 2.8*b321 + 3*b322 + 3.2*b323 + 3.4*b324 =E= 0;

e151..  - x8 + 0.1*b325 + 0.2*b326 + 0.3*b327 + 0.4*b328 + 0.5*b329 + 0.6*b330
        + 0.7*b331 + 0.8*b332 + 0.9*b333 + b334 + 1.1*b335 + 1.2*b336
        + 1.3*b337 + 1.4*b338 + 1.5*b339 + 1.6*b340 + 1.7*b341 + 1.8*b342
        + 1.9*b343 + 2*b344 + 2.1*b345 + 2.2*b346 + 2.3*b347 + 2.4*b348
        + 2.5*b349 + 2.6*b350 + 2.8*b351 + 3*b352 + 3.2*b353 + 3.4*b354 =E= 0;

e152..  - x9 + 0.1*b355 + 0.2*b356 + 0.3*b357 + 0.4*b358 + 0.5*b359 + 0.6*b360
        + 0.7*b361 + 0.8*b362 + 0.9*b363 + b364 + 1.1*b365 + 1.2*b366
        + 1.3*b367 + 1.4*b368 + 1.5*b369 + 1.6*b370 + 1.7*b371 + 1.8*b372
        + 1.9*b373 + 2*b374 + 2.1*b375 + 2.2*b376 + 2.3*b377 + 2.4*b378
        + 2.5*b379 + 2.6*b380 + 2.8*b381 + 3*b382 + 3.2*b383 + 3.4*b384 =E= 0;

e153..  - x10 + 0.1*b385 + 0.2*b386 + 0.3*b387 + 0.4*b388 + 0.5*b389 + 0.6*b390
        + 0.7*b391 + 0.8*b392 + 0.9*b393 + b394 + 1.1*b395 + 1.2*b396
        + 1.3*b397 + 1.4*b398 + 1.5*b399 + 1.6*b400 + 1.7*b401 + 1.8*b402
        + 1.9*b403 + 2*b404 + 2.1*b405 + 2.2*b406 + 2.3*b407 + 2.4*b408
        + 2.5*b409 + 2.6*b410 + 2.8*b411 + 3*b412 + 3.2*b413 + 3.4*b414 =E= 0;

e154..  - x11 + 0.1*b415 + 0.2*b416 + 0.3*b417 + 0.4*b418 + 0.5*b419 + 0.6*b420
        + 0.7*b421 + 0.8*b422 + 0.9*b423 + b424 + 1.1*b425 + 1.2*b426
        + 1.3*b427 + 1.4*b428 + 1.5*b429 + 1.6*b430 + 1.7*b431 + 1.8*b432
        + 1.9*b433 + 2*b434 + 2.1*b435 + 2.2*b436 + 2.3*b437 + 2.4*b438
        + 2.5*b439 + 2.6*b440 + 2.8*b441 + 3*b442 + 3.2*b443 + 3.4*b444 =E= 0;

e155..  - x12 + 0.1*b445 + 0.2*b446 + 0.3*b447 + 0.4*b448 + 0.5*b449 + 0.6*b450
        + 0.7*b451 + 0.8*b452 + 0.9*b453 + b454 + 1.1*b455 + 1.2*b456
        + 1.3*b457 + 1.4*b458 + 1.5*b459 + 1.6*b460 + 1.7*b461 + 1.8*b462
        + 1.9*b463 + 2*b464 + 2.1*b465 + 2.2*b466 + 2.3*b467 + 2.4*b468
        + 2.5*b469 + 2.6*b470 + 2.8*b471 + 3*b472 + 3.2*b473 + 3.4*b474 =E= 0;

e156..  - x13 + 0.1*b475 + 0.2*b476 + 0.3*b477 + 0.4*b478 + 0.5*b479 + 0.6*b480
        + 0.7*b481 + 0.8*b482 + 0.9*b483 + b484 + 1.1*b485 + 1.2*b486
        + 1.3*b487 + 1.4*b488 + 1.5*b489 + 1.6*b490 + 1.7*b491 + 1.8*b492
        + 1.9*b493 + 2*b494 + 2.1*b495 + 2.2*b496 + 2.3*b497 + 2.4*b498
        + 2.5*b499 + 2.6*b500 + 2.8*b501 + 3*b502 + 3.2*b503 + 3.4*b504 =E= 0;

e157..  - x14 + 0.1*b505 + 0.2*b506 + 0.3*b507 + 0.4*b508 + 0.5*b509 + 0.6*b510
        + 0.7*b511 + 0.8*b512 + 0.9*b513 + b514 + 1.1*b515 + 1.2*b516
        + 1.3*b517 + 1.4*b518 + 1.5*b519 + 1.6*b520 + 1.7*b521 + 1.8*b522
        + 1.9*b523 + 2*b524 + 2.1*b525 + 2.2*b526 + 2.3*b527 + 2.4*b528
        + 2.5*b529 + 2.6*b530 + 2.8*b531 + 3*b532 + 3.2*b533 + 3.4*b534 =E= 0;

e158..  - x15 + 0.1*b535 + 0.2*b536 + 0.3*b537 + 0.4*b538 + 0.5*b539 + 0.6*b540
        + 0.7*b541 + 0.8*b542 + 0.9*b543 + b544 + 1.1*b545 + 1.2*b546
        + 1.3*b547 + 1.4*b548 + 1.5*b549 + 1.6*b550 + 1.7*b551 + 1.8*b552
        + 1.9*b553 + 2*b554 + 2.1*b555 + 2.2*b556 + 2.3*b557 + 2.4*b558
        + 2.5*b559 + 2.6*b560 + 2.8*b561 + 3*b562 + 3.2*b563 + 3.4*b564 =E= 0;

e159..  - x16 + 0.1*b565 + 0.2*b566 + 0.3*b567 + 0.4*b568 + 0.5*b569 + 0.6*b570
        + 0.7*b571 + 0.8*b572 + 0.9*b573 + b574 + 1.1*b575 + 1.2*b576
        + 1.3*b577 + 1.4*b578 + 1.5*b579 + 1.6*b580 + 1.7*b581 + 1.8*b582
        + 1.9*b583 + 2*b584 + 2.1*b585 + 2.2*b586 + 2.3*b587 + 2.4*b588
        + 2.5*b589 + 2.6*b590 + 2.8*b591 + 3*b592 + 3.2*b593 + 3.4*b594 =E= 0;

e160..  - x17 + 0.1*b595 + 0.2*b596 + 0.3*b597 + 0.4*b598 + 0.5*b599 + 0.6*b600
        + 0.7*b601 + 0.8*b602 + 0.9*b603 + b604 + 1.1*b605 + 1.2*b606
        + 1.3*b607 + 1.4*b608 + 1.5*b609 + 1.6*b610 + 1.7*b611 + 1.8*b612
        + 1.9*b613 + 2*b614 + 2.1*b615 + 2.2*b616 + 2.3*b617 + 2.4*b618
        + 2.5*b619 + 2.6*b620 + 2.8*b621 + 3*b622 + 3.2*b623 + 3.4*b624 =E= 0;

e161..  - x18 + 0.1*b625 + 0.2*b626 + 0.3*b627 + 0.4*b628 + 0.5*b629 + 0.6*b630
        + 0.7*b631 + 0.8*b632 + 0.9*b633 + b634 + 1.1*b635 + 1.2*b636
        + 1.3*b637 + 1.4*b638 + 1.5*b639 + 1.6*b640 + 1.7*b641 + 1.8*b642
        + 1.9*b643 + 2*b644 + 2.1*b645 + 2.2*b646 + 2.3*b647 + 2.4*b648
        + 2.5*b649 + 2.6*b650 + 2.8*b651 + 3*b652 + 3.2*b653 + 3.4*b654 =E= 0;

e162..  - x19 + 0.1*b655 + 0.2*b656 + 0.3*b657 + 0.4*b658 + 0.5*b659 + 0.6*b660
        + 0.7*b661 + 0.8*b662 + 0.9*b663 + b664 + 1.1*b665 + 1.2*b666
        + 1.3*b667 + 1.4*b668 + 1.5*b669 + 1.6*b670 + 1.7*b671 + 1.8*b672
        + 1.9*b673 + 2*b674 + 2.1*b675 + 2.2*b676 + 2.3*b677 + 2.4*b678
        + 2.5*b679 + 2.6*b680 + 2.8*b681 + 3*b682 + 3.2*b683 + 3.4*b684 =E= 0;

e163..  - x20 + 0.1*b685 + 0.2*b686 + 0.3*b687 + 0.4*b688 + 0.5*b689 + 0.6*b690
        + 0.7*b691 + 0.8*b692 + 0.9*b693 + b694 + 1.1*b695 + 1.2*b696
        + 1.3*b697 + 1.4*b698 + 1.5*b699 + 1.6*b700 + 1.7*b701 + 1.8*b702
        + 1.9*b703 + 2*b704 + 2.1*b705 + 2.2*b706 + 2.3*b707 + 2.4*b708
        + 2.5*b709 + 2.6*b710 + 2.8*b711 + 3*b712 + 3.2*b713 + 3.4*b714 =E= 0;

e164..  - x21 + 0.1*b715 + 0.2*b716 + 0.3*b717 + 0.4*b718 + 0.5*b719 + 0.6*b720
        + 0.7*b721 + 0.8*b722 + 0.9*b723 + b724 + 1.1*b725 + 1.2*b726
        + 1.3*b727 + 1.4*b728 + 1.5*b729 + 1.6*b730 + 1.7*b731 + 1.8*b732
        + 1.9*b733 + 2*b734 + 2.1*b735 + 2.2*b736 + 2.3*b737 + 2.4*b738
        + 2.5*b739 + 2.6*b740 + 2.8*b741 + 3*b742 + 3.2*b743 + 3.4*b744 =E= 0;

e165..  - x22 + 0.1*b745 + 0.2*b746 + 0.3*b747 + 0.4*b748 + 0.5*b749 + 0.6*b750
        + 0.7*b751 + 0.8*b752 + 0.9*b753 + b754 + 1.1*b755 + 1.2*b756
        + 1.3*b757 + 1.4*b758 + 1.5*b759 + 1.6*b760 + 1.7*b761 + 1.8*b762
        + 1.9*b763 + 2*b764 + 2.1*b765 + 2.2*b766 + 2.3*b767 + 2.4*b768
        + 2.5*b769 + 2.6*b770 + 2.8*b771 + 3*b772 + 3.2*b773 + 3.4*b774 =E= 0;

e166..  - x23 + 0.1*b775 + 0.2*b776 + 0.3*b777 + 0.4*b778 + 0.5*b779 + 0.6*b780
        + 0.7*b781 + 0.8*b782 + 0.9*b783 + b784 + 1.1*b785 + 1.2*b786
        + 1.3*b787 + 1.4*b788 + 1.5*b789 + 1.6*b790 + 1.7*b791 + 1.8*b792
        + 1.9*b793 + 2*b794 + 2.1*b795 + 2.2*b796 + 2.3*b797 + 2.4*b798
        + 2.5*b799 + 2.6*b800 + 2.8*b801 + 3*b802 + 3.2*b803 + 3.4*b804 =E= 0;

e167..  - x24 + 0.1*b805 + 0.2*b806 + 0.3*b807 + 0.4*b808 + 0.5*b809 + 0.6*b810
        + 0.7*b811 + 0.8*b812 + 0.9*b813 + b814 + 1.1*b815 + 1.2*b816
        + 1.3*b817 + 1.4*b818 + 1.5*b819 + 1.6*b820 + 1.7*b821 + 1.8*b822
        + 1.9*b823 + 2*b824 + 2.1*b825 + 2.2*b826 + 2.3*b827 + 2.4*b828
        + 2.5*b829 + 2.6*b830 + 2.8*b831 + 3*b832 + 3.2*b833 + 3.4*b834 =E= 0;

e168..  - x25 + 0.1*b835 + 0.2*b836 + 0.3*b837 + 0.4*b838 + 0.5*b839 + 0.6*b840
        + 0.7*b841 + 0.8*b842 + 0.9*b843 + b844 + 1.1*b845 + 1.2*b846
        + 1.3*b847 + 1.4*b848 + 1.5*b849 + 1.6*b850 + 1.7*b851 + 1.8*b852
        + 1.9*b853 + 2*b854 + 2.1*b855 + 2.2*b856 + 2.3*b857 + 2.4*b858
        + 2.5*b859 + 2.6*b860 + 2.8*b861 + 3*b862 + 3.2*b863 + 3.4*b864 =E= 0;

e169..  - x26 + 0.1*b865 + 0.2*b866 + 0.3*b867 + 0.4*b868 + 0.5*b869 + 0.6*b870
        + 0.7*b871 + 0.8*b872 + 0.9*b873 + b874 + 1.1*b875 + 1.2*b876
        + 1.3*b877 + 1.4*b878 + 1.5*b879 + 1.6*b880 + 1.7*b881 + 1.8*b882
        + 1.9*b883 + 2*b884 + 2.1*b885 + 2.2*b886 + 2.3*b887 + 2.4*b888
        + 2.5*b889 + 2.6*b890 + 2.8*b891 + 3*b892 + 3.2*b893 + 3.4*b894 =E= 0;

e170..    b145 + b146 + b147 + b148 + b149 + b150 + b151 + b152 + b153 + b154
        + b155 + b156 + b157 + b158 + b159 + b160 + b161 + b162 + b163 + b164
        + b165 + b166 + b167 + b168 + b169 + b170 + b171 + b172 + b173 + b174
        =E= 1;

e171..    b175 + b176 + b177 + b178 + b179 + b180 + b181 + b182 + b183 + b184
        + b185 + b186 + b187 + b188 + b189 + b190 + b191 + b192 + b193 + b194
        + b195 + b196 + b197 + b198 + b199 + b200 + b201 + b202 + b203 + b204
        =E= 1;

e172..    b205 + b206 + b207 + b208 + b209 + b210 + b211 + b212 + b213 + b214
        + b215 + b216 + b217 + b218 + b219 + b220 + b221 + b222 + b223 + b224
        + b225 + b226 + b227 + b228 + b229 + b230 + b231 + b232 + b233 + b234
        =E= 1;

e173..    b235 + b236 + b237 + b238 + b239 + b240 + b241 + b242 + b243 + b244
        + b245 + b246 + b247 + b248 + b249 + b250 + b251 + b252 + b253 + b254
        + b255 + b256 + b257 + b258 + b259 + b260 + b261 + b262 + b263 + b264
        =E= 1;

e174..    b265 + b266 + b267 + b268 + b269 + b270 + b271 + b272 + b273 + b274
        + b275 + b276 + b277 + b278 + b279 + b280 + b281 + b282 + b283 + b284
        + b285 + b286 + b287 + b288 + b289 + b290 + b291 + b292 + b293 + b294
        =E= 1;

e175..    b295 + b296 + b297 + b298 + b299 + b300 + b301 + b302 + b303 + b304
        + b305 + b306 + b307 + b308 + b309 + b310 + b311 + b312 + b313 + b314
        + b315 + b316 + b317 + b318 + b319 + b320 + b321 + b322 + b323 + b324
        =E= 1;

e176..    b325 + b326 + b327 + b328 + b329 + b330 + b331 + b332 + b333 + b334
        + b335 + b336 + b337 + b338 + b339 + b340 + b341 + b342 + b343 + b344
        + b345 + b346 + b347 + b348 + b349 + b350 + b351 + b352 + b353 + b354
        =E= 1;

e177..    b355 + b356 + b357 + b358 + b359 + b360 + b361 + b362 + b363 + b364
        + b365 + b366 + b367 + b368 + b369 + b370 + b371 + b372 + b373 + b374
        + b375 + b376 + b377 + b378 + b379 + b380 + b381 + b382 + b383 + b384
        =E= 1;

e178..    b385 + b386 + b387 + b388 + b389 + b390 + b391 + b392 + b393 + b394
        + b395 + b396 + b397 + b398 + b399 + b400 + b401 + b402 + b403 + b404
        + b405 + b406 + b407 + b408 + b409 + b410 + b411 + b412 + b413 + b414
        =E= 1;

e179..    b415 + b416 + b417 + b418 + b419 + b420 + b421 + b422 + b423 + b424
        + b425 + b426 + b427 + b428 + b429 + b430 + b431 + b432 + b433 + b434
        + b435 + b436 + b437 + b438 + b439 + b440 + b441 + b442 + b443 + b444
        =E= 1;

e180..    b445 + b446 + b447 + b448 + b449 + b450 + b451 + b452 + b453 + b454
        + b455 + b456 + b457 + b458 + b459 + b460 + b461 + b462 + b463 + b464
        + b465 + b466 + b467 + b468 + b469 + b470 + b471 + b472 + b473 + b474
        =E= 1;

e181..    b475 + b476 + b477 + b478 + b479 + b480 + b481 + b482 + b483 + b484
        + b485 + b486 + b487 + b488 + b489 + b490 + b491 + b492 + b493 + b494
        + b495 + b496 + b497 + b498 + b499 + b500 + b501 + b502 + b503 + b504
        =E= 1;

e182..    b505 + b506 + b507 + b508 + b509 + b510 + b511 + b512 + b513 + b514
        + b515 + b516 + b517 + b518 + b519 + b520 + b521 + b522 + b523 + b524
        + b525 + b526 + b527 + b528 + b529 + b530 + b531 + b532 + b533 + b534
        =E= 1;

e183..    b535 + b536 + b537 + b538 + b539 + b540 + b541 + b542 + b543 + b544
        + b545 + b546 + b547 + b548 + b549 + b550 + b551 + b552 + b553 + b554
        + b555 + b556 + b557 + b558 + b559 + b560 + b561 + b562 + b563 + b564
        =E= 1;

e184..    b565 + b566 + b567 + b568 + b569 + b570 + b571 + b572 + b573 + b574
        + b575 + b576 + b577 + b578 + b579 + b580 + b581 + b582 + b583 + b584
        + b585 + b586 + b587 + b588 + b589 + b590 + b591 + b592 + b593 + b594
        =E= 1;

e185..    b595 + b596 + b597 + b598 + b599 + b600 + b601 + b602 + b603 + b604
        + b605 + b606 + b607 + b608 + b609 + b610 + b611 + b612 + b613 + b614
        + b615 + b616 + b617 + b618 + b619 + b620 + b621 + b622 + b623 + b624
        =E= 1;

e186..    b625 + b626 + b627 + b628 + b629 + b630 + b631 + b632 + b633 + b634
        + b635 + b636 + b637 + b638 + b639 + b640 + b641 + b642 + b643 + b644
        + b645 + b646 + b647 + b648 + b649 + b650 + b651 + b652 + b653 + b654
        =E= 1;

e187..    b655 + b656 + b657 + b658 + b659 + b660 + b661 + b662 + b663 + b664
        + b665 + b666 + b667 + b668 + b669 + b670 + b671 + b672 + b673 + b674
        + b675 + b676 + b677 + b678 + b679 + b680 + b681 + b682 + b683 + b684
        =E= 1;

e188..    b685 + b686 + b687 + b688 + b689 + b690 + b691 + b692 + b693 + b694
        + b695 + b696 + b697 + b698 + b699 + b700 + b701 + b702 + b703 + b704
        + b705 + b706 + b707 + b708 + b709 + b710 + b711 + b712 + b713 + b714
        =E= 1;

e189..    b715 + b716 + b717 + b718 + b719 + b720 + b721 + b722 + b723 + b724
        + b725 + b726 + b727 + b728 + b729 + b730 + b731 + b732 + b733 + b734
        + b735 + b736 + b737 + b738 + b739 + b740 + b741 + b742 + b743 + b744
        =E= 1;

e190..    b745 + b746 + b747 + b748 + b749 + b750 + b751 + b752 + b753 + b754
        + b755 + b756 + b757 + b758 + b759 + b760 + b761 + b762 + b763 + b764
        + b765 + b766 + b767 + b768 + b769 + b770 + b771 + b772 + b773 + b774
        =E= 1;

e191..    b775 + b776 + b777 + b778 + b779 + b780 + b781 + b782 + b783 + b784
        + b785 + b786 + b787 + b788 + b789 + b790 + b791 + b792 + b793 + b794
        + b795 + b796 + b797 + b798 + b799 + b800 + b801 + b802 + b803 + b804
        =E= 1;

e192..    b805 + b806 + b807 + b808 + b809 + b810 + b811 + b812 + b813 + b814
        + b815 + b816 + b817 + b818 + b819 + b820 + b821 + b822 + b823 + b824
        + b825 + b826 + b827 + b828 + b829 + b830 + b831 + b832 + b833 + b834
        =E= 1;

e193..    b835 + b836 + b837 + b838 + b839 + b840 + b841 + b842 + b843 + b844
        + b845 + b846 + b847 + b848 + b849 + b850 + b851 + b852 + b853 + b854
        + b855 + b856 + b857 + b858 + b859 + b860 + b861 + b862 + b863 + b864
        =E= 1;

e194..    b865 + b866 + b867 + b868 + b869 + b870 + b871 + b872 + b873 + b874
        + b875 + b876 + b877 + b878 + b879 + b880 + b881 + b882 + b883 + b884
        + b885 + b886 + b887 + b888 + b889 + b890 + b891 + b892 + b893 + b894
        =E= 1;

e195..  - x3 + x4 =E= 0;

e196..  - x3 + x5 =E= 0;

e197..  - x3 + x6 =E= 0;

e198..  - x7 + x8 =E= 0;

e199..  - x7 + x9 =E= 0;

e200..  - x7 + x10 =E= 0;

e201..  - x11 + x12 =E= 0;

e202..  - x13 + x14 =E= 0;

e203..  - x15 + x16 =E= 0;

e204..  - x15 + x17 =E= 0;

e205..  - x15 + x18 =E= 0;

e206..  - x19 + x20 =E= 0;

e207..  - x19 + x21 =E= 0;

e208..  - x19 + x22 =E= 0;

e209..  - x23 + x24 =E= 0;

e210..  - x23 + x25 =E= 0;

e211..  - x23 + x26 =E= 0;

e212.. x45*x30 - x45*x27 - x120 =E= 0;

e213.. (-0.5746957711*x46*x27) - 0.2873478856*x46*x28 + 0.7662610282*x46*x29 + 
       0.5746957711*x46*x36 + 0.2873478856*x46*x37 - 0.7662610282*x46*x38
        - x121 =E= 0;

e214.. 0.5746957711*x47*x30 - 0.2873478856*x47*x31 + 0.7662610282*x47*x32 - 
       0.5746957711*x47*x33 + 0.2873478856*x47*x34 - 0.7662610282*x47*x35
        - x125 =E= 0;

e215.. 0.2873478856*x48*x28 - 0.5746957711*x48*x27 + 0.7662610282*x48*x29 + 
       0.5746957711*x48*x39 - 0.2873478856*x48*x40 - 0.7662610282*x48*x41
        - x122 =E= 0;

e216.. 0.5746957711*x49*x30 + 0.2873478856*x49*x31 + 0.7662610282*x49*x32 - 
       0.5746957711*x49*x42 - 0.2873478856*x49*x43 - 0.7662610282*x49*x44
        - x126 =E= 0;

e217.. 0.9363291776*x50*x32 - 0.3511234416*x50*x31 + 0.3511234416*x50*x37 - 
       0.9363291776*x50*x38 - x127 =E= 0;

e218.. 0.3511234416*x51*x31 + 0.9363291776*x51*x32 - 0.3511234416*x51*x40 - 
       0.9363291776*x51*x41 - x128 =E= 0;

e219.. 0.9363291776*x52*x29 - 0.3511234416*x52*x28 + 0.3511234416*x52*x34 - 
       0.9363291776*x52*x35 - x123 =E= 0;

e220.. 0.3511234416*x53*x28 + 0.9363291776*x53*x29 - 0.3511234416*x53*x43 - 
       0.9363291776*x53*x44 - x124 =E= 0;

e221.. x54*x34 - x54*x43 - x133 =E= 0;

e222.. x55*x37 - x55*x40 - x137 =E= 0;

e223.. x56*x36 - x56*x33 - x129 =E= 0;

e224.. x57*x39 - x57*x42 - x138 =E= 0;

e225.. 0.3450327797*x58*x33 + 0.7590721153*x58*x34 + 0.5520524475*x58*x35
        - x130 =E= 0;

e226.. 0.3450327797*x59*x42 - 0.7590721153*x59*x43 + 0.5520524475*x59*x44
        - x142 =E= 0;

e227.. 0.7590721153*x60*x37 - 0.3450327797*x60*x36 + 0.5520524475*x60*x38
        - x134 =E= 0;

e228.. (-0.3450327797*x61*x39) - 0.7590721153*x61*x40 + 0.5520524475*x61*x41
        - x139 =E= 0;

e229.. 0.7590721153*x62*x36 - 0.3450327797*x62*x37 + 0.5520524475*x62*x38
        - x135 =E= 0;

e230.. (-0.7590721153*x63*x33) - 0.3450327797*x63*x34 + 0.5520524475*x63*x35
        - x131 =E= 0;

e231.. 0.7590721153*x64*x39 + 0.3450327797*x64*x40 + 0.5520524475*x64*x41
        - x140 =E= 0;

e232.. 0.3450327797*x65*x43 - 0.7590721153*x65*x42 + 0.5520524475*x65*x44
        - x143 =E= 0;

e233.. 0.4682929058*x66*x42 + 0.4682929058*x66*x43 + 0.7492686493*x66*x44
        - x144 =E= 0;

e234.. 0.4682929058*x67*x33 - 0.4682929058*x67*x34 + 0.7492686493*x67*x35
        - x132 =E= 0;

e235.. (-0.4682929058*x68*x36) - 0.4682929058*x68*x37 + 0.7492686493*x68*x38
        - x136 =E= 0;

e236.. 0.4682929058*x69*x40 - 0.4682929058*x69*x39 + 0.7492686493*x69*x41
        - x141 =E= 0;

* set non-default bounds
x2.lo = 0.1; x2.up = 3.4;
x3.lo = 0.1; x3.up = 3.4;
x4.lo = 0.1; x4.up = 3.4;
x5.lo = 0.1; x5.up = 3.4;
x6.lo = 0.1; x6.up = 3.4;
x7.lo = 0.1; x7.up = 3.4;
x8.lo = 0.1; x8.up = 3.4;
x9.lo = 0.1; x9.up = 3.4;
x10.lo = 0.1; x10.up = 3.4;
x11.lo = 0.1; x11.up = 3.4;
x12.lo = 0.1; x12.up = 3.4;
x13.lo = 0.1; x13.up = 3.4;
x14.lo = 0.1; x14.up = 3.4;
x15.lo = 0.1; x15.up = 3.4;
x16.lo = 0.1; x16.up = 3.4;
x17.lo = 0.1; x17.up = 3.4;
x18.lo = 0.1; x18.up = 3.4;
x19.lo = 0.1; x19.up = 3.4;
x20.lo = 0.1; x20.up = 3.4;
x21.lo = 0.1; x21.up = 3.4;
x22.lo = 0.1; x22.up = 3.4;
x23.lo = 0.1; x23.up = 3.4;
x24.lo = 0.1; x24.up = 3.4;
x25.lo = 0.1; x25.up = 3.4;
x26.lo = 0.1; x26.up = 3.4;
x27.lo = -0.35; x27.up = 0.35;
x28.lo = -0.35; x28.up = 0.35;
x30.lo = -0.35; x30.up = 0.35;
x31.lo = -0.35; x31.up = 0.35;

* set non-default levels
x2.l = 0.1;
x3.l = 0.1;
x4.l = 0.1;
x5.l = 0.1;
x6.l = 0.1;
x7.l = 0.1;
x8.l = 0.1;
x9.l = 0.1;
x10.l = 0.1;
x11.l = 0.1;
x12.l = 0.1;
x13.l = 0.1;
x14.l = 0.1;
x15.l = 0.1;
x16.l = 0.1;
x17.l = 0.1;
x18.l = 0.1;
x19.l = 0.1;
x20.l = 0.1;
x21.l = 0.1;
x22.l = 0.1;
x23.l = 0.1;
x24.l = 0.1;
x25.l = 0.1;
x26.l = 0.1;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
