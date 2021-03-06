$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        468       72       24      372        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        216      144       72        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*       1790     1278      512        0
*
*  Solve m using MIQCP maximizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52
          ,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69
          ,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86
          ,x87,x88,x89,b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102
          ,b103,b104,b105,b106,b107,b108,b109,b110,b111,b112,b113,b114,b115
          ,b116,b117,b118,b119,b120,b121,b122,b123,b124,b125,b126,b127,b128
          ,b129,b130,b131,b132,b133,b134,b135,b136,b137,b138,b139,b140,b141
          ,b142,b143,b144,b145,b146,b147,b148,b149,b150,b151,b152,b153,b154
          ,b155,b156,b157,b158,b159,x160,x161,x162,x163,x164,x165,x166,x167
          ,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177,x178,x179,x180
          ,x181,x182,b183,b184,x185,x186,x187,x188,x189,x190,x191,x192,x193
          ,x194,x195,x196,x197,x198,x199,x200,x201,x202,x203,x204,x205,x206
          ,x207,x208,x209,x210,x211,x212,x213,x214,x215,x216;

Positive Variables  x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17
          ,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34
          ,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51
          ,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68
          ,x69,x70,x71,x72,x73,x78,x79,x80,x81,x86,x87,x88,x89,x160,x161,x162
          ,x163,x164,x165,x166,x167,x168,x169,x170,x171,x172,x173,x174,x175
          ,x176,x177,x178,x179,x180,x181,x182,x193,x194,x195,x196,x197,x198
          ,x199,x200,x209,x210,x211,x212,x213,x214,x215,x216;

Binary Variables  b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102,b103
          ,b104,b105,b106,b107,b108,b109,b110,b111,b112,b113,b114,b115,b116
          ,b117,b118,b119,b120,b121,b122,b123,b124,b125,b126,b127,b128,b129
          ,b130,b131,b132,b133,b134,b135,b136,b137,b138,b139,b140,b141,b142
          ,b143,b144,b145,b146,b147,b148,b149,b150,b151,b152,b153,b154,b155
          ,b156,b157,b158,b159,b183,b184;

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
          ,e325,e326,e327,e328,e329,e330,e331,e332,e333,e334,e335,e336,e337
          ,e338,e339,e340,e341,e342,e343,e344,e345,e346,e347,e348,e349,e350
          ,e351,e352,e353,e354,e355,e356,e357,e358,e359,e360,e361,e362,e363
          ,e364,e365,e366,e367,e368,e369,e370,e371,e372,e373,e374,e375,e376
          ,e377,e378,e379,e380,e381,e382,e383,e384,e385,e386,e387,e388,e389
          ,e390,e391,e392,e393,e394,e395,e396,e397,e398,e399,e400,e401,e402
          ,e403,e404,e405,e406,e407,e408,e409,e410,e411,e412,e413,e414,e415
          ,e416,e417,e418,e419,e420,e421,e422,e423,e424,e425,e426,e427,e428
          ,e429,e430,e431,e432,e433,e434,e435,e436,e437,e438,e439,e440,e441
          ,e442,e443,e444,e445,e446,e447,e448,e449,e450,e451,e452,e453,e454
          ,e455,e456,e457,e458,e459,e460,e461,e462,e463,e464,e465,e466,e467
          ,e468;


e1..  - objvar - 0.45*x2 - 0.45*x3 - 0.45*x4 - 0.67*x5 - 0.67*x6 - 0.67*x7
      - 1.03*x8 - 1.03*x9 - 1.03*x10 - 1.75*x11 - 1.75*x12 - 1.75*x13
      - 1.57*x14 - 1.57*x15 - 1.57*x16 - 1.05*x17 - 1.05*x18 - 1.05*x19
      - 0.13*x20 - 0.13*x21 - 0.13*x22 - 0.47*x23 - 0.47*x24 - 0.47*x25
      - 0.34*x26 - 0.34*x27 - 0.34*x28 + 8.81*x29 + 8.81*x30 + 9.07*x31
      + 9.07*x32 - 0.6*x33 - 0.6*x34 - 0.6*x35 - 0.65*x36 - 0.65*x37 - 0.65*x38
      - 0.75*x39 - 0.75*x40 - 0.75*x41 + 9.52*x42 + 9.52*x43 + 9.52*x44
      + 8.69*x45 + 8.69*x46 - 0.83*x47 - 0.83*x48 - 0.83*x49 - x50 - x51 - x52
      - 0.44*x53 - 0.44*x54 - 0.44*x55 + 8.64*x56 + 8.64*x57 + 8.64*x58
      + 8.83*x59 + 8.83*x60 - 0.87*x61 - 0.87*x62 - 0.87*x63 - 0.4*x64
      - 0.4*x65 - 0.4*x66 - 0.8*x67 - 0.8*x68 - 0.8*x69 + 8.69*x70 + 8.69*x71
      + 9.34*x72 + 9.34*x73 - 0.2*b90 - 0.2*b91 - 0.2*b92 - 0.62*b93 - 0.62*b94
      - 0.62*b95 - 0.35*b96 - 0.35*b97 - 0.35*b98 - 0.76*b99 - 0.76*b100
      - 0.76*b101 - 0.38*b102 - 0.38*b103 - 0.38*b104 - 0.08*b105 - 0.08*b106
      - 0.08*b107 - 0.93*b108 - 0.93*b109 - 0.93*b110 - 0.57*b111 - 0.57*b112
      - 0.57*b113 - 0.01*b114 - 0.01*b115 - 0.01*b116 - 0.16*b117 - 0.16*b118
      - 0.31*b119 - 0.31*b120 - 0.17*b121 - 0.17*b122 - 0.17*b123 - 0.26*b124
      - 0.26*b125 - 0.26*b126 - 0.69*b127 - 0.69*b128 - 0.69*b129 - 0.45*b130
      - 0.45*b131 - 0.45*b132 - 0.23*b133 - 0.23*b134 - 0.15*b135 - 0.15*b136
      - 0.15*b137 - 0.54*b138 - 0.54*b139 - 0.54*b140 - 0.08*b141 - 0.08*b142
      - 0.08*b143 - 0.11*b144 - 0.11*b145 - 0.11*b146 - 0.82*b147 - 0.82*b148
      - 0.82*b149 - 0.08*b150 - 0.08*b151 - 0.08*b152 - 0.26*b153 - 0.26*b154
      - 0.26*b155 - 0.43*b156 - 0.43*b157 - 0.18*b158 - 0.18*b159 =E= 0;

e2..    x2 + x5 + x8 + x160 =E= 1.9;

e3..    x11 + x14 + x17 + x161 =E= 1.8;

e4..  - x11 + x20 + x23 + x26 - x33 - x47 - x61 + x162 =E= 0.3;

e5..  - x2 - x14 - x20 + x33 + x36 + x39 + x42 - x50 - x64 + x163 =E= 1.8;

e6..  - x5 - x17 - x23 - x36 + x47 + x50 + x53 + x56 - x67 + x164 =E= 1.3;

e7..  - x8 - x26 - x39 - x53 + x61 + x64 + x67 + x165 =E= 0.2;

e8..  - x42 - x56 + x166 =E= -0.35;

e9..    x3 + x6 + x9 - x160 + x167 =E= 0.1;

e10..    x4 + x7 + x10 - x167 + x168 =E= 0.7;

e11..    x12 + x15 + x18 - x161 + x169 =E= 0.8;

e12..    x13 + x16 + x19 - x169 + x170 =E= 0.3;

e13..  - x12 + x21 + x24 + x27 + x29 + x31 - x34 - x48 - x62 - x162 + x171
       =E= 0;

e14..  - x13 + x22 + x25 + x28 + x30 + x32 - x35 - x49 - x63 - x171 + x172
       =E= 0;

e15..  - x3 - x15 - x21 + x34 + x37 + x40 + x43 + x45 - x51 - x65 - x163 + x173
       =E= 0;

e16..  - x4 - x16 - x22 + x35 + x38 + x41 + x44 + x46 - x52 - x66 - x173 + x174
       =E= 0;

e17..  - x6 - x18 - x24 - x37 + x48 + x51 + x54 + x57 + x59 - x68 - x164 + x175
       =E= 0;

e18..  - x7 - x19 - x25 - x38 + x49 + x52 + x55 + x58 + x60 - x69 - x175 + x176
       =E= 0;

e19..  - x9 - x27 - x40 - x54 + x62 + x65 + x68 + x70 + x72 - x165 + x177 =E= 0
      ;

e20..  - x10 - x28 - x41 - x55 + x63 + x66 + x69 + x71 + x73 - x177 + x178
       =E= 0;

e21..  - x29 - x43 - x57 - x70 - x166 + x179 =E= -0.44;

e22..  - x30 - x44 - x58 - x71 - x179 + x180 =E= -0.77;

e23..  - x31 - x45 - x59 - x72 + x181 =E= 0.69;

e24..  - x32 - x46 - x60 - x73 - x181 + x182 =E= -0.8;

e25..    x2 - b90 =L= 0;

e26..    x3 - b91 =L= 0;

e27..    x4 - b92 =L= 0;

e28..    x5 - b93 =L= 0;

e29..    x6 - b94 =L= 0;

e30..    x7 - b95 =L= 0;

e31..    x8 - b96 =L= 0;

e32..    x9 - b97 =L= 0;

e33..    x10 - b98 =L= 0;

e34..    x11 - b99 =L= 0;

e35..    x12 - b100 =L= 0;

e36..    x13 - b101 =L= 0;

e37..    x14 - b102 =L= 0;

e38..    x15 - b103 =L= 0;

e39..    x16 - b104 =L= 0;

e40..    x17 - b105 =L= 0;

e41..    x18 - b106 =L= 0;

e42..    x19 - b107 =L= 0;

e43..    x20 - b108 =L= 0;

e44..    x21 - b109 =L= 0;

e45..    x22 - b110 =L= 0;

e46..    x23 - b111 =L= 0;

e47..    x24 - b112 =L= 0;

e48..    x25 - b113 =L= 0;

e49..    x26 - b114 =L= 0;

e50..    x27 - b115 =L= 0;

e51..    x28 - b116 =L= 0;

e52..    x29 - b117 =L= 0;

e53..    x30 - b118 =L= 0;

e54..    x31 - b119 =L= 0;

e55..    x32 - b120 =L= 0;

e56..    x33 - b121 =L= 0;

e57..    x34 - b122 =L= 0;

e58..    x35 - b123 =L= 0;

e59..    x36 - b124 =L= 0;

e60..    x37 - b125 =L= 0;

e61..    x38 - b126 =L= 0;

e62..    x39 - b127 =L= 0;

e63..    x40 - b128 =L= 0;

e64..    x41 - b129 =L= 0;

e65..    x42 - b130 =L= 0;

e66..    x43 - b131 =L= 0;

e67..    x44 - b132 =L= 0;

e68..    x45 - b133 =L= 0;

e69..    x46 - b134 =L= 0;

e70..    x47 - b135 =L= 0;

e71..    x48 - b136 =L= 0;

e72..    x49 - b137 =L= 0;

e73..    x50 - b138 =L= 0;

e74..    x51 - b139 =L= 0;

e75..    x52 - b140 =L= 0;

e76..    x53 - b141 =L= 0;

e77..    x54 - b142 =L= 0;

e78..    x55 - b143 =L= 0;

e79..    x56 - b144 =L= 0;

e80..    x57 - b145 =L= 0;

e81..    x58 - b146 =L= 0;

e82..    x59 - b183 =L= 0;

e83..    x60 - b184 =L= 0;

e84..    x61 - b147 =L= 0;

e85..    x62 - b148 =L= 0;

e86..    x63 - b149 =L= 0;

e87..    x64 - b150 =L= 0;

e88..    x65 - b151 =L= 0;

e89..    x66 - b152 =L= 0;

e90..    x67 - b153 =L= 0;

e91..    x68 - b154 =L= 0;

e92..    x69 - b155 =L= 0;

e93..    x70 - b156 =L= 0;

e94..    x71 - b157 =L= 0;

e95..    x72 - b158 =L= 0;

e96..    x73 - b159 =L= 0;

e97..    0.1*b119 - x185 =L= -0.7;

e98..    0.1*b120 - x186 =L= -0.7;

e99..    0.1*b133 - x187 =L= -0.7;

e100..    0.1*b134 - x188 =L= -0.7;

e101..    0.1*b183 - x189 =L= -0.7;

e102..    0.1*b184 - x190 =L= -0.7;

e103..    0.1*b158 - x191 =L= -0.7;

e104..    0.1*b159 - x192 =L= -0.7;

e105..    0.5*b117 - x193 =L= 0;

e106..    0.5*b118 - x194 =L= 0;

e107..    0.1*b119 - x193 =L= 0;

e108..    0.1*b120 - x194 =L= 0;

e109..    0.5*b131 - x195 =L= 0;

e110..    0.5*b132 - x196 =L= 0;

e111..    0.1*b133 - x195 =L= 0;

e112..    0.1*b134 - x196 =L= 0;

e113..    0.5*b145 - x197 =L= 0;

e114..    0.5*b146 - x198 =L= 0;

e115..    0.1*b183 - x197 =L= 0;

e116..    0.1*b184 - x198 =L= 0;

e117..    0.5*b156 - x199 =L= 0;

e118..    0.5*b157 - x200 =L= 0;

e119..    0.1*b158 - x199 =L= 0;

e120..    0.1*b159 - x200 =L= 0;

e121..    0.05*b117 - x201 =L= -0.66;

e122..    0.05*b118 - x202 =L= -0.66;

e123..    0.13*b119 - x201 =L= -0.66;

e124..    0.13*b120 - x202 =L= -0.66;

e125..    0.05*b131 - x203 =L= -0.66;

e126..    0.05*b132 - x204 =L= -0.66;

e127..    0.13*b133 - x203 =L= -0.66;

e128..    0.13*b134 - x204 =L= -0.66;

e129..    0.05*b145 - x205 =L= -0.66;

e130..    0.05*b146 - x206 =L= -0.66;

e131..    0.13*b183 - x205 =L= -0.66;

e132..    0.13*b184 - x206 =L= -0.66;

e133..    0.05*b156 - x207 =L= -0.66;

e134..    0.05*b157 - x208 =L= -0.66;

e135..    0.13*b158 - x207 =L= -0.66;

e136..    0.13*b159 - x208 =L= -0.66;

e137..    0.48*b117 - x209 =L= 0;

e138..    0.48*b118 - x210 =L= 0;

e139..    0.09*b119 - x209 =L= 0;

e140..    0.09*b120 - x210 =L= 0;

e141..    0.48*b131 - x211 =L= 0;

e142..    0.48*b132 - x212 =L= 0;

e143..    0.09*b133 - x211 =L= 0;

e144..    0.09*b134 - x212 =L= 0;

e145..    0.48*b145 - x213 =L= 0;

e146..    0.48*b146 - x214 =L= 0;

e147..    0.09*b183 - x213 =L= 0;

e148..    0.09*b184 - x214 =L= 0;

e149..    0.48*b156 - x215 =L= 0;

e150..    0.48*b157 - x216 =L= 0;

e151..    0.09*b158 - x215 =L= 0;

e152..    0.09*b159 - x216 =L= 0;

e153..  - 0.2*b119 - x193 =G= -0.9;

e154..  - 0.2*b120 - x194 =G= -0.9;

e155..  - 0.2*b133 - x195 =G= -0.9;

e156..  - 0.2*b134 - x196 =G= -0.9;

e157..  - 0.2*b183 - x197 =G= -0.9;

e158..  - 0.2*b184 - x198 =G= -0.9;

e159..  - 0.2*b158 - x199 =G= -0.9;

e160..  - 0.2*b159 - x200 =G= -0.9;

e161..  - 0.05*b117 - x201 =G= -1;

e162..  - 0.05*b118 - x202 =G= -1;

e163..  - 0.05*b131 - x203 =G= -1;

e164..  - 0.05*b132 - x204 =G= -1;

e165..  - 0.05*b145 - x205 =G= -1;

e166..  - 0.05*b146 - x206 =G= -1;

e167..  - 0.05*b156 - x207 =G= -1;

e168..  - 0.05*b157 - x208 =G= -1;

e169..  - 0.12*b119 - x209 =G= -0.92;

e170..  - 0.12*b120 - x210 =G= -0.92;

e171..  - 0.12*b133 - x211 =G= -0.92;

e172..  - 0.12*b134 - x212 =G= -0.92;

e173..  - 0.12*b183 - x213 =G= -0.92;

e174..  - 0.12*b184 - x214 =G= -0.92;

e175..  - 0.12*b158 - x215 =G= -0.92;

e176..  - 0.12*b159 - x216 =G= -0.92;

e177..    b99 + b108 =L= 1;

e178..    b100 + b109 =L= 1;

e179..    b101 + b110 =L= 1;

e180..    b99 + b111 =L= 1;

e181..    b100 + b112 =L= 1;

e182..    b101 + b113 =L= 1;

e183..    b99 + b114 =L= 1;

e184..    b100 + b115 =L= 1;

e185..    b101 + b116 =L= 1;

e186..    b100 + b117 =L= 1;

e187..    b101 + b118 =L= 1;

e188..    b100 + b119 =L= 1;

e189..    b101 + b120 =L= 1;

e190..    b108 + b121 =L= 1;

e191..    b109 + b122 =L= 1;

e192..    b110 + b123 =L= 1;

e193..    b111 + b121 =L= 1;

e194..    b112 + b122 =L= 1;

e195..    b113 + b123 =L= 1;

e196..    b114 + b121 =L= 1;

e197..    b115 + b122 =L= 1;

e198..    b116 + b123 =L= 1;

e199..    b117 + b122 =L= 1;

e200..    b118 + b123 =L= 1;

e201..    b119 + b122 =L= 1;

e202..    b120 + b123 =L= 1;

e203..    b108 + b135 =L= 1;

e204..    b109 + b136 =L= 1;

e205..    b110 + b137 =L= 1;

e206..    b111 + b135 =L= 1;

e207..    b112 + b136 =L= 1;

e208..    b113 + b137 =L= 1;

e209..    b114 + b135 =L= 1;

e210..    b115 + b136 =L= 1;

e211..    b116 + b137 =L= 1;

e212..    b117 + b136 =L= 1;

e213..    b118 + b137 =L= 1;

e214..    b119 + b136 =L= 1;

e215..    b120 + b137 =L= 1;

e216..    b108 + b147 =L= 1;

e217..    b109 + b148 =L= 1;

e218..    b110 + b149 =L= 1;

e219..    b111 + b147 =L= 1;

e220..    b112 + b148 =L= 1;

e221..    b113 + b149 =L= 1;

e222..    b114 + b147 =L= 1;

e223..    b115 + b148 =L= 1;

e224..    b116 + b149 =L= 1;

e225..    b117 + b148 =L= 1;

e226..    b118 + b149 =L= 1;

e227..    b119 + b148 =L= 1;

e228..    b120 + b149 =L= 1;

e229..    b90 + b121 =L= 1;

e230..    b91 + b122 =L= 1;

e231..    b92 + b123 =L= 1;

e232..    b90 + b124 =L= 1;

e233..    b91 + b125 =L= 1;

e234..    b92 + b126 =L= 1;

e235..    b90 + b127 =L= 1;

e236..    b91 + b128 =L= 1;

e237..    b92 + b129 =L= 1;

e238..    b90 + b130 =L= 1;

e239..    b91 + b131 =L= 1;

e240..    b92 + b132 =L= 1;

e241..    b91 + b133 =L= 1;

e242..    b92 + b134 =L= 1;

e243..    b102 + b121 =L= 1;

e244..    b103 + b122 =L= 1;

e245..    b104 + b123 =L= 1;

e246..    b102 + b124 =L= 1;

e247..    b103 + b125 =L= 1;

e248..    b104 + b126 =L= 1;

e249..    b102 + b127 =L= 1;

e250..    b103 + b128 =L= 1;

e251..    b104 + b129 =L= 1;

e252..    b102 + b130 =L= 1;

e253..    b103 + b131 =L= 1;

e254..    b104 + b132 =L= 1;

e255..    b103 + b133 =L= 1;

e256..    b104 + b134 =L= 1;

e257..    b108 + b121 =L= 1;

e258..    b109 + b122 =L= 1;

e259..    b110 + b123 =L= 1;

e260..    b108 + b124 =L= 1;

e261..    b109 + b125 =L= 1;

e262..    b110 + b126 =L= 1;

e263..    b108 + b127 =L= 1;

e264..    b109 + b128 =L= 1;

e265..    b110 + b129 =L= 1;

e266..    b108 + b130 =L= 1;

e267..    b109 + b131 =L= 1;

e268..    b110 + b132 =L= 1;

e269..    b109 + b133 =L= 1;

e270..    b110 + b134 =L= 1;

e271..    b121 + b138 =L= 1;

e272..    b122 + b139 =L= 1;

e273..    b123 + b140 =L= 1;

e274..    b124 + b138 =L= 1;

e275..    b125 + b139 =L= 1;

e276..    b126 + b140 =L= 1;

e277..    b127 + b138 =L= 1;

e278..    b128 + b139 =L= 1;

e279..    b129 + b140 =L= 1;

e280..    b130 + b138 =L= 1;

e281..    b131 + b139 =L= 1;

e282..    b132 + b140 =L= 1;

e283..    b133 + b139 =L= 1;

e284..    b134 + b140 =L= 1;

e285..    b121 + b150 =L= 1;

e286..    b122 + b151 =L= 1;

e287..    b123 + b152 =L= 1;

e288..    b124 + b150 =L= 1;

e289..    b125 + b151 =L= 1;

e290..    b126 + b152 =L= 1;

e291..    b127 + b150 =L= 1;

e292..    b128 + b151 =L= 1;

e293..    b129 + b152 =L= 1;

e294..    b130 + b150 =L= 1;

e295..    b131 + b151 =L= 1;

e296..    b132 + b152 =L= 1;

e297..    b133 + b151 =L= 1;

e298..    b134 + b152 =L= 1;

e299..    b93 + b135 =L= 1;

e300..    b94 + b136 =L= 1;

e301..    b95 + b137 =L= 1;

e302..    b93 + b138 =L= 1;

e303..    b94 + b139 =L= 1;

e304..    b95 + b140 =L= 1;

e305..    b93 + b141 =L= 1;

e306..    b94 + b142 =L= 1;

e307..    b95 + b143 =L= 1;

e308..    b93 + b144 =L= 1;

e309..    b94 + b145 =L= 1;

e310..    b95 + b146 =L= 1;

e311..    b94 + b183 =L= 1;

e312..    b95 + b184 =L= 1;

e313..    b105 + b135 =L= 1;

e314..    b106 + b136 =L= 1;

e315..    b107 + b137 =L= 1;

e316..    b105 + b138 =L= 1;

e317..    b106 + b139 =L= 1;

e318..    b107 + b140 =L= 1;

e319..    b105 + b141 =L= 1;

e320..    b106 + b142 =L= 1;

e321..    b107 + b143 =L= 1;

e322..    b105 + b144 =L= 1;

e323..    b106 + b145 =L= 1;

e324..    b107 + b146 =L= 1;

e325..    b106 + b183 =L= 1;

e326..    b107 + b184 =L= 1;

e327..    b111 + b135 =L= 1;

e328..    b112 + b136 =L= 1;

e329..    b113 + b137 =L= 1;

e330..    b111 + b138 =L= 1;

e331..    b112 + b139 =L= 1;

e332..    b113 + b140 =L= 1;

e333..    b111 + b141 =L= 1;

e334..    b112 + b142 =L= 1;

e335..    b113 + b143 =L= 1;

e336..    b111 + b144 =L= 1;

e337..    b112 + b145 =L= 1;

e338..    b113 + b146 =L= 1;

e339..    b112 + b183 =L= 1;

e340..    b113 + b184 =L= 1;

e341..    b124 + b135 =L= 1;

e342..    b125 + b136 =L= 1;

e343..    b126 + b137 =L= 1;

e344..    b124 + b138 =L= 1;

e345..    b125 + b139 =L= 1;

e346..    b126 + b140 =L= 1;

e347..    b124 + b141 =L= 1;

e348..    b125 + b142 =L= 1;

e349..    b126 + b143 =L= 1;

e350..    b124 + b144 =L= 1;

e351..    b125 + b145 =L= 1;

e352..    b126 + b146 =L= 1;

e353..    b125 + b183 =L= 1;

e354..    b126 + b184 =L= 1;

e355..    b135 + b153 =L= 1;

e356..    b136 + b154 =L= 1;

e357..    b137 + b155 =L= 1;

e358..    b138 + b153 =L= 1;

e359..    b139 + b154 =L= 1;

e360..    b140 + b155 =L= 1;

e361..    b141 + b153 =L= 1;

e362..    b142 + b154 =L= 1;

e363..    b143 + b155 =L= 1;

e364..    b144 + b153 =L= 1;

e365..    b145 + b154 =L= 1;

e366..    b146 + b155 =L= 1;

e367..    b154 + b183 =L= 1;

e368..    b155 + b184 =L= 1;

e369..    b96 + b147 =L= 1;

e370..    b97 + b148 =L= 1;

e371..    b98 + b149 =L= 1;

e372..    b96 + b150 =L= 1;

e373..    b97 + b151 =L= 1;

e374..    b98 + b152 =L= 1;

e375..    b96 + b153 =L= 1;

e376..    b97 + b154 =L= 1;

e377..    b98 + b155 =L= 1;

e378..    b97 + b156 =L= 1;

e379..    b98 + b157 =L= 1;

e380..    b97 + b158 =L= 1;

e381..    b98 + b159 =L= 1;

e382..    b114 + b147 =L= 1;

e383..    b115 + b148 =L= 1;

e384..    b116 + b149 =L= 1;

e385..    b114 + b150 =L= 1;

e386..    b115 + b151 =L= 1;

e387..    b116 + b152 =L= 1;

e388..    b114 + b153 =L= 1;

e389..    b115 + b154 =L= 1;

e390..    b116 + b155 =L= 1;

e391..    b115 + b156 =L= 1;

e392..    b116 + b157 =L= 1;

e393..    b115 + b158 =L= 1;

e394..    b116 + b159 =L= 1;

e395..    b127 + b147 =L= 1;

e396..    b128 + b148 =L= 1;

e397..    b129 + b149 =L= 1;

e398..    b127 + b150 =L= 1;

e399..    b128 + b151 =L= 1;

e400..    b129 + b152 =L= 1;

e401..    b127 + b153 =L= 1;

e402..    b128 + b154 =L= 1;

e403..    b129 + b155 =L= 1;

e404..    b128 + b156 =L= 1;

e405..    b129 + b157 =L= 1;

e406..    b128 + b158 =L= 1;

e407..    b129 + b159 =L= 1;

e408..    b141 + b147 =L= 1;

e409..    b142 + b148 =L= 1;

e410..    b143 + b149 =L= 1;

e411..    b141 + b150 =L= 1;

e412..    b142 + b151 =L= 1;

e413..    b143 + b152 =L= 1;

e414..    b141 + b153 =L= 1;

e415..    b142 + b154 =L= 1;

e416..    b143 + b155 =L= 1;

e417..    b142 + b156 =L= 1;

e418..    b143 + b157 =L= 1;

e419..    b142 + b158 =L= 1;

e420..    b143 + b159 =L= 1;

e421.. x185*x162 - 0.9*x11 + 0.7*x20 + 0.7*x23 + 0.7*x26 - 0.8*x33 - 0.7*x47
        - 0.7*x61 =E= 0.21;

e422.. x187*x163 - 0.7*x2 - 0.9*x14 - 0.7*x20 + 0.8*x33 + 0.8*x36 + 0.8*x39
        + 0.8*x42 - 0.7*x50 - 0.7*x64 =E= 1.44;

e423.. x189*x164 - 0.7*x5 - 0.9*x17 - 0.7*x23 - 0.8*x36 + 0.7*x47 + 0.7*x50
        + 0.7*x53 + 0.7*x56 - 0.7*x67 =E= 0.91;

e424.. x191*x165 - 0.7*x8 - 0.7*x26 - 0.8*x39 - 0.7*x53 + 0.7*x61 + 0.7*x64
        + 0.7*x67 =E= 0.14;

e425.. x193*x162 - 0.01*x11 - 0.9*x33 - 0.8*x47 - 0.3*x61 =E= 0;

e426.. x195*x163 - 0.2*x2 - 0.01*x14 + 0.9*x33 + 0.9*x36 + 0.9*x39 + 0.9*x42
        - 0.8*x50 - 0.3*x64 =E= 1.62;

e427.. x197*x164 - 0.2*x5 - 0.01*x17 - 0.9*x36 + 0.8*x47 + 0.8*x50 + 0.8*x53
        + 0.8*x56 - 0.3*x67 =E= 1.04;

e428.. x199*x165 - 0.2*x8 - 0.9*x39 - 0.8*x53 + 0.3*x61 + 0.3*x64 + 0.3*x67
        =E= 0.06;

e429.. x201*x162 - 0.88*x11 + 0.68*x20 + 0.68*x23 + 0.68*x26 - 0.81*x33
        - 0.71*x47 - 0.66*x61 =E= 0.204;

e430.. x203*x163 - 0.69*x2 - 0.88*x14 - 0.68*x20 + 0.81*x33 + 0.81*x36
        + 0.81*x39 + 0.81*x42 - 0.71*x50 - 0.66*x64 =E= 1.458;

e431.. x205*x164 - 0.69*x5 - 0.88*x17 - 0.68*x23 - 0.81*x36 + 0.71*x47
        + 0.71*x50 + 0.71*x53 + 0.71*x56 - 0.66*x67 =E= 0.923;

e432.. x207*x165 - 0.69*x8 - 0.68*x26 - 0.81*x39 - 0.71*x53 + 0.66*x61
        + 0.66*x64 + 0.66*x67 =E= 0.132;

e433.. x209*x162 + 0.01*x20 + 0.01*x23 + 0.01*x26 - 0.9*x33 - 0.8*x47 - 0.4*x61
        =E= 0.003;

e434.. x211*x163 - 0.18*x2 - 0.01*x20 + 0.9*x33 + 0.9*x36 + 0.9*x39 + 0.9*x42
        - 0.8*x50 - 0.4*x64 =E= 1.62;

e435.. x213*x164 - 0.18*x5 - 0.01*x23 - 0.9*x36 + 0.8*x47 + 0.8*x50 + 0.8*x53
        + 0.8*x56 - 0.4*x67 =E= 1.04;

e436.. x215*x165 - 0.18*x8 - 0.01*x26 - 0.9*x39 - 0.8*x53 + 0.4*x61 + 0.4*x64
        + 0.4*x67 =E= 0.08;

e437.. x185*x21 + x185*x24 + x185*x27 + x185*x29 + x185*x31 - x187*x34 - x189*
       x48 - x191*x62 - x185*x162 + x186*x171 - 0.9*x12 =E= 0;

e438.. x186*x22 + x186*x25 + x186*x28 + x186*x30 + x186*x32 - x188*x35 - x190*
       x49 - x192*x63 + x172*x74 - x186*x171 - 0.9*x13 =E= 0;

e439.. x187*x34 - x185*x21 + x187*x37 + x187*x40 + x187*x43 + x187*x45 - x189*
       x51 - x191*x65 - x187*x163 + x188*x173 - 0.7*x3 - 0.9*x15 =E= 0;

e440.. x188*x35 - x186*x22 + x188*x38 + x188*x41 + x188*x44 + x188*x46 - x190*
       x52 - x192*x66 + x174*x75 - x188*x173 - 0.7*x4 - 0.9*x16 =E= 0;

e441.. (-x185*x24) - x187*x37 + x189*x48 + x189*x51 + x189*x54 + x189*x57 + 
       x189*x59 - x191*x68 - x189*x164 + x190*x175 - 0.7*x6 - 0.9*x18 =E= 0;

e442.. (-x186*x25) - x188*x38 + x190*x49 + x190*x52 + x190*x55 + x190*x58 + 
       x190*x60 - x192*x69 + x176*x76 - x190*x175 - 0.7*x7 - 0.9*x19 =E= 0;

e443.. (-x185*x27) - x187*x40 - x189*x54 + x191*x62 + x191*x65 + x191*x68 + 
       x191*x70 + x191*x72 - x191*x165 + x192*x177 - 0.7*x9 =E= 0;

e444.. (-x186*x28) - x188*x41 - x190*x55 + x192*x63 + x192*x66 + x192*x69 + 
       x192*x71 + x192*x73 + x178*x77 - x192*x177 - 0.7*x10 =E= 0;

e445.. x193*x21 + x193*x24 + x193*x27 + x193*x29 + x193*x31 - x195*x34 - x197*
       x48 - x199*x62 - x193*x162 + x194*x171 - 0.01*x12 =E= 0;

e446.. x194*x22 + x194*x25 + x194*x28 + x194*x30 + x194*x32 - x196*x35 - x198*
       x49 - x200*x63 + x172*x78 - x194*x171 - 0.01*x13 =E= 0;

e447.. x195*x34 - x193*x21 + x195*x37 + x195*x40 + x195*x43 + x195*x45 - x197*
       x51 - x199*x65 - x195*x163 + x196*x173 - 0.2*x3 - 0.01*x15 =E= 0;

e448.. x196*x35 - x194*x22 + x196*x38 + x196*x41 + x196*x44 + x196*x46 - x198*
       x52 - x200*x66 + x174*x79 - x196*x173 - 0.2*x4 - 0.01*x16 =E= 0;

e449.. (-x193*x24) - x195*x37 + x197*x48 + x197*x51 + x197*x54 + x197*x57 + 
       x197*x59 - x199*x68 - x197*x164 + x198*x175 - 0.2*x6 - 0.01*x18 =E= 0;

e450.. (-x194*x25) - x196*x38 + x198*x49 + x198*x52 + x198*x55 + x198*x58 + 
       x198*x60 - x200*x69 + x176*x80 - x198*x175 - 0.2*x7 - 0.01*x19 =E= 0;

e451.. (-x193*x27) - x195*x40 - x197*x54 + x199*x62 + x199*x65 + x199*x68 + 
       x199*x70 + x199*x72 - x199*x165 + x200*x177 - 0.2*x9 =E= 0;

e452.. (-x194*x28) - x196*x41 - x198*x55 + x200*x63 + x200*x66 + x200*x69 + 
       x200*x71 + x200*x73 + x178*x81 - x200*x177 - 0.2*x10 =E= 0;

e453.. x201*x21 + x201*x24 + x201*x27 + x201*x29 + x201*x31 - x203*x34 - x205*
       x48 - x207*x62 - x201*x162 + x202*x171 - 0.88*x12 =E= 0;

e454.. x202*x22 + x202*x25 + x202*x28 + x202*x30 + x202*x32 - x204*x35 - x206*
       x49 - x208*x63 + x172*x82 - x202*x171 - 0.88*x13 =E= 0;

e455.. x203*x34 - x201*x21 + x203*x37 + x203*x40 + x203*x43 + x203*x45 - x205*
       x51 - x207*x65 - x203*x163 + x204*x173 - 0.69*x3 - 0.88*x15 =E= 0;

e456.. x204*x35 - x202*x22 + x204*x38 + x204*x41 + x204*x44 + x204*x46 - x206*
       x52 - x208*x66 + x174*x83 - x204*x173 - 0.69*x4 - 0.88*x16 =E= 0;

e457.. (-x201*x24) - x203*x37 + x205*x48 + x205*x51 + x205*x54 + x205*x57 + 
       x205*x59 - x207*x68 - x205*x164 + x206*x175 - 0.69*x6 - 0.88*x18 =E= 0;

e458.. (-x202*x25) - x204*x38 + x206*x49 + x206*x52 + x206*x55 + x206*x58 + 
       x206*x60 - x208*x69 + x176*x84 - x206*x175 - 0.69*x7 - 0.88*x19 =E= 0;

e459.. (-x201*x27) - x203*x40 - x205*x54 + x207*x62 + x207*x65 + x207*x68 + 
       x207*x70 + x207*x72 - x207*x165 + x208*x177 - 0.69*x9 =E= 0;

e460.. (-x202*x28) - x204*x41 - x206*x55 + x208*x63 + x208*x66 + x208*x69 + 
       x208*x71 + x208*x73 + x178*x85 - x208*x177 - 0.69*x10 =E= 0;

e461.. x211*x34 - x209*x21 + x211*x37 + x211*x40 + x211*x43 + x211*x45 - x213*
       x51 - x215*x65 - x211*x163 + x212*x173 - 0.18*x3 =E= 0;

e462.. x212*x35 - x210*x22 + x212*x38 + x212*x41 + x212*x44 + x212*x46 - x214*
       x52 - x216*x66 + x174*x87 - x212*x173 - 0.18*x4 =E= 0;

e463.. (-x209*x24) - x211*x37 + x213*x48 + x213*x51 + x213*x54 + x213*x57 + 
       x213*x59 - x215*x68 - x213*x164 + x214*x175 - 0.18*x6 =E= 0;

e464.. (-x210*x25) - x212*x38 + x214*x49 + x214*x52 + x214*x55 + x214*x58 + 
       x214*x60 - x216*x69 + x176*x88 - x214*x175 - 0.18*x7 =E= 0;

e465.. (-x209*x27) - x211*x40 - x213*x54 + x215*x62 + x215*x65 + x215*x68 + 
       x215*x70 + x215*x72 - x215*x165 + x216*x177 - 0.18*x9 =E= 0;

e466.. (-x210*x28) - x212*x41 - x214*x55 + x216*x63 + x216*x66 + x216*x69 + 
       x216*x71 + x216*x73 + x178*x89 - x216*x177 - 0.18*x10 =E= 0;

e467.. x209*x21 + x209*x24 + x209*x27 + x209*x29 + x209*x31 - x211*x34 - x213*
       x48 - x215*x62 - x209*x162 + x210*x171 =E= 0;

e468.. x210*x22 + x210*x25 + x210*x28 + x210*x30 + x210*x32 - x212*x35 - x214*
       x49 - x216*x63 + x172*x86 - x210*x171 =E= 0;

* set non-default bounds
x2.up = 1;
x3.up = 1;
x4.up = 1;
x5.up = 1;
x6.up = 1;
x7.up = 1;
x8.up = 1;
x9.up = 1;
x10.up = 1;
x11.up = 1;
x12.up = 1;
x13.up = 1;
x14.up = 1;
x15.up = 1;
x16.up = 1;
x17.up = 1;
x18.up = 1;
x19.up = 1;
x20.up = 1;
x21.up = 1;
x22.up = 1;
x23.up = 1;
x24.up = 1;
x25.up = 1;
x26.up = 1;
x27.up = 1;
x28.up = 1;
x29.up = 1;
x30.up = 1;
x31.up = 1;
x32.up = 1;
x33.up = 1;
x34.up = 1;
x35.up = 1;
x36.up = 1;
x37.up = 1;
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
x50.up = 1;
x51.up = 1;
x52.up = 1;
x53.up = 1;
x54.up = 1;
x55.up = 1;
x56.up = 1;
x57.up = 1;
x58.up = 1;
x59.up = 1;
x60.up = 1;
x61.up = 1;
x62.up = 1;
x63.up = 1;
x64.up = 1;
x65.up = 1;
x66.up = 1;
x67.up = 1;
x68.up = 1;
x69.up = 1;
x70.up = 1;
x71.up = 1;
x72.up = 1;
x73.up = 1;
x74.lo = 0.7; x74.up = 1;
x75.lo = 0.7; x75.up = 1;
x76.lo = 0.7; x76.up = 1;
x77.lo = 0.7; x77.up = 1;
x78.up = 0.9;
x79.up = 0.9;
x80.up = 0.9;
x81.up = 0.9;
x82.lo = 0.66; x82.up = 1;
x83.lo = 0.66; x83.up = 1;
x84.lo = 0.66; x84.up = 1;
x85.lo = 0.66; x85.up = 1;
x86.up = 0.92;
x87.up = 0.92;
x88.up = 0.92;
x89.up = 0.92;
x160.up = 2;
x161.up = 2;
x162.up = 2;
x163.up = 2;
x164.up = 2;
x165.up = 2;
x166.up = 2;
x167.up = 2;
x168.up = 2;
x169.up = 2;
x170.up = 2;
x171.up = 2;
x172.up = 2;
x173.up = 2;
x174.up = 2;
x175.up = 2;
x176.up = 2;
x177.up = 2;
x178.up = 2;
x179.up = 2;
x180.up = 2;
x181.up = 2;
x182.up = 2;
x185.lo = 0.7; x185.up = 1;
x186.lo = 0.7; x186.up = 1;
x187.lo = 0.7; x187.up = 1;
x188.lo = 0.7; x188.up = 1;
x189.lo = 0.7; x189.up = 1;
x190.lo = 0.7; x190.up = 1;
x191.lo = 0.7; x191.up = 1;
x192.lo = 0.7; x192.up = 1;
x193.up = 0.9;
x194.up = 0.9;
x195.up = 0.9;
x196.up = 0.9;
x197.up = 0.9;
x198.up = 0.9;
x199.up = 0.9;
x200.up = 0.9;
x201.lo = 0.66; x201.up = 1;
x202.lo = 0.66; x202.up = 1;
x203.lo = 0.66; x203.up = 1;
x204.lo = 0.66; x204.up = 1;
x205.lo = 0.66; x205.up = 1;
x206.lo = 0.66; x206.up = 1;
x207.lo = 0.66; x207.up = 1;
x208.lo = 0.66; x208.up = 1;
x209.up = 0.92;
x210.up = 0.92;
x211.up = 0.92;
x212.up = 0.92;
x213.up = 0.92;
x214.up = 0.92;
x215.up = 0.92;
x216.up = 0.92;

* set non-default levels
x74.l = 0.7;
x75.l = 0.7;
x76.l = 0.7;
x77.l = 0.7;
x82.l = 0.66;
x83.l = 0.66;
x84.l = 0.66;
x85.l = 0.66;
x185.l = 0.7;
x186.l = 0.7;
x187.l = 0.7;
x188.l = 0.7;
x189.l = 0.7;
x190.l = 0.7;
x191.l = 0.7;
x192.l = 0.7;
x201.l = 0.66;
x202.l = 0.66;
x203.l = 0.66;
x204.l = 0.66;
x205.l = 0.66;
x206.l = 0.66;
x207.l = 0.66;
x208.l = 0.66;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% maximizing objvar;
