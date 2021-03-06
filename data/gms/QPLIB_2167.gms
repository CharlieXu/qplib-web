$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        184      123        0       61        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        193      132       61        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        863      741      122        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,x63,x64,x65,x66,x67,x68,x69
          ,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86
          ,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102
          ,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115
          ,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127,x128
          ,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x140,x141
          ,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151,x152,x153,x154
          ,x155,x156,x157,x158,x159,x160,x161,x162,x163,x164,x165,x166,x167
          ,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177,x178,x179,x180
          ,x181,x182,x183,x184,x185,x186,x187,x188,x189,x190,x191,x192,x193;

Positive Variables  x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x83,x84,x85
          ,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101
          ,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114
          ,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127
          ,x128,x129,x130,x131,x132;

Binary Variables  b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62;

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
          ,e182,e183,e184;


e1..  - objvar + b2 + b3 + b4 + b5 + b6 + b7 + b8 + b9 + b10 + b11 + b12 + b13
      + b14 + b15 + b16 + b17 + b18 + b19 + b20 + b21 + b22 + b23 + b24 + b25
      + b26 + b27 + b28 + b29 + b30 + b31 + b32 + b33 + b34 + b35 + b36 + b37
      + b38 + b39 + b40 + b41 + b42 + b43 + b44 + b45 + b46 + b47 + b48 + b49
      + b50 + b51 + b52 + b53 + b54 + b55 + b56 + b57 + b58 + b59 + b60 + b61
      + b62 =E= 0;

e2..  - 71*x63 - 0.26*x64 - 9*x65 - 4.6*x66 - 14*x67 - x68 - x69 + x70 - x71
      =L= -1;

e3..  - 72*x63 - 0.38*x64 - 6*x65 - 4.1*x66 - 14*x67 - 1.7*x68 - 0.588*x69
      + x70 - x72 =L= -1;

e4..  - 55*x63 - 0.26*x64 - 4*x65 - 3.42*x66 - 14*x67 - x68 - x69 + x70 - x73
      =L= -1;

e5..  - 60*x63 - 0.253*x64 - 12.062*x65 - 4.603*x66 - 16*x67 - 1.45*x68
      - 0.788*x69 + x70 - x74 =L= -1;

e6..    57*x63 + 0.16*x64 + 22*x65 + 5.75*x66 + 18*x67 + 2.25*x68 + 0.571*x69
      - x70 - x75 =L= -1;

e7..  - 68*x63 - 0.26*x64 - 5*x65 - 4.31*x66 - 12*x67 - x68 - 0.857*x69 + x70
      - x76 =L= -1;

e8..  - 62*x63 - 0.23*x64 - 31*x65 - 5.43*x66 - 22.5*x67 - 1.875*x68
      - 0.857*x69 + x70 - x77 =L= -1;

e9..  - 60*x63 - 0.33*x64 - 8*x65 - 5.25*x66 - 14*x67 - x68 - x69 + x70 - x78
      =L= -1;

e10..  - 46*x63 - 0.34*x64 - 5.09*x66 - 16*x67 - 1.14*x68 - 1.003*x69 + x70
       - x79 =L= -1;

e11..  - 54*x63 - 0.14*x64 - 13*x65 - 4.49*x66 - 15.5*x67 - 1.19*x68 - 0.93*x69
       + x70 - x80 =L= -1;

e12..    77*x63 + 0.13*x64 + 16*x65 + 4.23*x66 + 18*x67 + 1.8*x68 + 0.714*x69
       - x70 - x81 =L= -1;

e13..  - 62*x63 - 0.45*x64 - 9*x65 - 3.6*x66 - 16*x67 - 1.14*x68 - 1.003*x69
       + x70 - x82 - x83 =L= -1;

e14..  - 73*x63 - 0.33*x64 - 6*x65 - 4*x66 - 14*x67 - x68 - x69 + x70 - x84
       =L= -1;

e15..  - 60*x63 - 0.15*x64 - 10*x65 - 3.73*x66 - 14*x67 - x68 - x69 + x70 - x85
       =L= -1;

e16..    62*x63 + 0.12*x64 + 23*x65 + 5.8*x66 + 11.67*x67 + 2.33*x68
       + 0.358*x69 - x70 - x86 =L= -1;

e17..  - 55*x63 - 0.25*x64 - 12.063*x65 - 4.29*x66 - 14*x67 - x68 - x69 + x70
       - x82 - x87 =L= -1;

e18..    69*x63 + 0.26*x64 + 11*x65 + 4.65*x66 + 18*x67 + 1.64*x68 + 0.784*x69
       - x70 + x82 - x88 =L= -1;

e19..    62.529*x63 + 0.07*x64 + 20*x65 + 5.2*x66 + 24*x67 + 2*x68 + 0.857*x69
       - x70 + x82 - x89 =L= -1;

e20..    66*x63 + 0.09*x64 + 17*x65 + 5.819*x66 + 8*x67 + 1.333*x68 + 0.429*x69
       - x70 - x90 =L= -1;

e21..    66*x63 + 0.22*x64 + 15*x65 + 5.4*x66 + 27*x67 + 2.25*x68 + 0.857*x69
       - x70 + x82 - x91 =L= -1;

e22..    69*x63 + 0.15*x64 + 12*x65 + 5.39*x66 + 19.5*x67 + 1.625*x68
       + 0.857*x69 - x70 - x92 =L= -1;

e23..    85*x63 + 0.18*x64 + 19*x65 + 5.46*x66 + 13.83*x67 + 1.38*x68
       + 0.71*x69 - x70 + x82 - x93 =L= -1;

e24..    73*x63 + 0.23*x64 + 12.733*x65 + 6.06*x66 + 7.5*x67 + 1.5*x68
       + 0.36*x69 - x70 - x94 =L= -1;

e25..    71*x63 + 0.17*x64 + 4.65*x66 + 8*x67 + x68 + 0.57*x69 - x70 - x95
       =L= -1;

e26..  - 55*x63 - 0.21*x64 - 4.2*x65 - 4.16*x66 - 14*x67 - 1.56*x68 - 0.64*x69
       + x70 - x82 - x96 =L= -1;

e27..  - 61*x63 - 0.61*x64 - 13.1*x65 - 4.07*x66 - 13*x67 - 1.625*x68
       - 0.571*x69 + x70 - x97 =L= -1;

e28..  - 54*x63 - 0.35*x64 - 9.3*x65 - 3.63*x66 - 11*x67 - 1.222*x68 - 0.64*x69
       + x70 - x98 =L= -1;

e29..  - 70*x63 - 0.27*x64 - 4.7*x65 - 4.49*x66 - 22*x67 - 2*x68 - 0.786*x69
       + x70 - x82 - x99 =L= -1;

e30..  - 79*x63 - 0.15*x64 - 17.5*x65 - 4.27*x66 - 13*x67 - 1.3*x68 - 0.714*x69
       + x70 - x100 =L= -1;

e31..    59*x63 + 0.03*x64 + 21.3*x65 + 6.29*x66 + 17*x67 + 1.31*x68
       + 0.928*x69 - x70 - x101 =L= -1;

e32..  - 58*x63 - 0.3*x64 - 9.4*x65 - 3.49*x66 - 14*x67 - x68 - x69 + x70
       - x102 =L= -1;

e33..    60*x63 + 0.01*x64 + 24.6*x65 + 5.65*x66 + 39*x67 + 3*x68 + 0.928*x69
       - x70 - x103 =L= -1;

e34..  - 66*x63 - 0.29*x64 - 15.6*x65 - 6.15*x66 - 14*x67 - x68 - x69 + x70
       - x104 =L= -1;

e35..  - 63*x63 - 0.15*x64 - 13*x65 - 4.57*x66 - 13*x67 - 1.08*x68 - 0.857*x69
       + x70 - x105 =L= -1;

e36..  - 57*x63 - 0.13*x64 - 18.6*x65 - 4.37*x66 - 12.33*x67 - 1.37*x68
       - 0.642*x69 + x70 - x106 =L= -1;

e37..  - 70*x63 - 0.1*x64 - 9.8*x65 - 5.3*x66 - 23*x67 - 2.3*x68 - 0.714*x69
       + x70 - x107 =L= -1;

e38..  - 79*x63 - 0.17*x64 - 11.9*x65 - 5.15*x66 - 10.5*x67 - 1.05*x68
       - 0.714*x69 + x70 - x108 =L= -1;

e39..  - 72*x63 - 0.187*x64 - 12*x65 - 5.02*x66 - 13*x67 - 1.18*x68 - 0.785*x69
       + x70 - x109 =L= -1;

e40..  - 51*x63 - 0.16*x64 - 13.2*x65 - 5.26*x66 - 11*x67 - x68 - 0.786*x69
       + x70 - x110 =L= -1;

e41..  - 70*x63 - 0.25*x64 - 9.7*x65 - 5.57*x66 - 5.5*x67 - 1.1*x68 - 0.357*x69
       + x70 - x82 - x111 =L= -1;

e42..  - 65*x63 - 0.36*x64 - 8.8*x65 - 5.78*x66 - 12*x67 - x68 - 0.857*x69
       + x70 - x112 =L= -1;

e43..  - 78*x63 - 0.06*x64 - 16.1*x65 - 5.62*x66 - 13.67*x67 - 1.367*x68
       - 0.714*x69 + x70 - x113 =L= -1;

e44..    86*x63 + 0.225*x64 + 12.2*x65 + 5.2*x66 + 24*x67 + 2.18*x68
       + 0.786*x69 - x70 - x114 =L= -1;

e45..  - 56*x63 - 0.25*x64 - 11*x65 - 4.72*x66 - 11*x67 - x68 - 0.785*x69 + x70
       - x115 =L= -1;

e46..  - 60*x63 - 0.12*x64 - 10.2*x65 - 4.31*x66 - 15*x67 - 1.67*x68 - 0.64*x69
       + x70 - x116 =L= -1;

e47..  - 59*x63 - 0.29*x64 - 7.5*x65 - 4.75*x66 - 13*x67 - 1.08*x68 - 0.857*x69
       + x70 - x117 =L= -1;

e48..  - 54*x63 - 0.217*x64 - 17.9*x65 - 4.54*x66 - 16.5*x67 - 1.18*x68 - x69
       + x70 - x118 =L= -1;

e49..  - 64*x63 - 0.2*x64 - 7.1*x65 - 4.58*x66 - 14*x67 - x68 - x69 + x70
       - x119 =L= -1;

e50..  - 54*x63 - 0.07*x64 - 16.8*x65 - 4.16*x66 - 18*x67 - 1.5*x68 - 0.857*x69
       + x70 - x82 - x120 =L= -1;

e51..    78*x63 + 0.05*x64 + 10*x65 + 4.44*x66 + 15*x67 + 1.36*x68 + 0.786*x69
       - x70 - x121 =L= -1;

e52..  - 55*x63 - 0.28*x64 - 5.5*x65 - 4.48*x66 - 22*x67 - 1.83*x68 - 0.857*x69
       + x70 - x122 =L= -1;

e53..  - 59*x63 - 0.344*x64 - 9.1*x65 - 4.04*x66 - 9*x67 - x68 - 0.643*x69
       + x70 - x123 =L= -1;

e54..    74*x63 + 0.2*x64 + 4.8*x65 + 4.56*x66 + 12.5*x67 + 1.04*x68
       + 0.857*x69 - x70 - x124 =L= -1;

e55..    65*x63 + 0.16*x64 + 8.5*x65 + 5.47*x66 + 16*x67 + 1.45*x68 + 0.786*x69
       - x70 + x82 - x125 =L= -1;

e56..    58*x63 + 0.17*x64 + 28.9*x65 + 6.73*x66 + 26.08*x67 + 2.01*x68
       + 0.928*x69 - x70 - x126 =L= -1;

e57..  - 70*x63 - 0.38*x64 - 4.55*x66 - 10*x67 - x68 - 0.714*x69 + x70 - x127
       =L= -1;

e58..    63*x63 + 0.3*x64 + 6.9*x65 + 3.52*x66 + 18.16*x67 + 1.51*x68
       + 0.857*x69 - x70 - x128 =L= -1;

e59..  - 59*x63 - 0.17*x64 - 14.3*x65 - 5.49*x66 - 13.5*x67 - 1.5*x68
       - 0.643*x69 + x70 - x129 =L= -1;

e60..  - 57*x63 - 0.228*x64 - 9.7*x65 - 4.29*x66 - 11*x67 - x68 - 0.786*x69
       + x70 - x130 =L= -1;

e61..    78*x63 + 0.23*x64 + 40*x65 + 6.23*x66 + 14*x67 + 1.4*x68 + 0.714*x69
       - x70 - x131 =L= -1;

e62..    62*x63 + 0.26*x64 + 7.6*x65 + 4.42*x66 + 14*x67 + x68 + x69 - x70
       - x132 =L= -1;

e63..  - b2 - x133 =E= -1;

e64..  - b3 - x134 =E= -1;

e65..  - b4 - x135 =E= -1;

e66..  - b5 - x136 =E= -1;

e67..  - b6 - x137 =E= -1;

e68..  - b7 - x138 =E= -1;

e69..  - b8 - x139 =E= -1;

e70..  - b9 - x140 =E= -1;

e71..  - b10 - x141 =E= -1;

e72..  - b11 - x142 =E= -1;

e73..  - b12 - x143 =E= -1;

e74..  - b13 - x144 =E= -1;

e75..  - b14 - x145 =E= -1;

e76..  - b15 - x146 =E= -1;

e77..  - b16 - x147 =E= -1;

e78..  - b17 - x148 =E= -1;

e79..  - b18 - x149 =E= -1;

e80..  - b19 - x150 =E= -1;

e81..  - b20 - x151 =E= -1;

e82..  - b21 - x152 =E= -1;

e83..  - b22 - x153 =E= -1;

e84..  - b23 - x154 =E= -1;

e85..  - b24 - x155 =E= -1;

e86..  - b25 - x156 =E= -1;

e87..  - b26 - x157 =E= -1;

e88..  - b27 - x158 =E= -1;

e89..  - b28 - x159 =E= -1;

e90..  - b29 - x160 =E= -1;

e91..  - b30 - x161 =E= -1;

e92..  - b31 - x162 =E= -1;

e93..  - b32 - x163 =E= -1;

e94..  - b33 - x164 =E= -1;

e95..  - b34 - x165 =E= -1;

e96..  - b35 - x166 =E= -1;

e97..  - b36 - x167 =E= -1;

e98..  - b37 - x168 =E= -1;

e99..  - b38 - x169 =E= -1;

e100..  - b39 - x170 =E= -1;

e101..  - b40 - x171 =E= -1;

e102..  - b41 - x172 =E= -1;

e103..  - b42 - x173 =E= -1;

e104..  - b43 - x174 =E= -1;

e105..  - b44 - x175 =E= -1;

e106..  - b45 - x176 =E= -1;

e107..  - b46 - x177 =E= -1;

e108..  - b47 - x178 =E= -1;

e109..  - b48 - x179 =E= -1;

e110..  - b49 - x180 =E= -1;

e111..  - b50 - x181 =E= -1;

e112..  - b51 - x182 =E= -1;

e113..  - b52 - x183 =E= -1;

e114..  - b53 - x184 =E= -1;

e115..  - b54 - x185 =E= -1;

e116..  - b55 - x186 =E= -1;

e117..  - b56 - x187 =E= -1;

e118..  - b57 - x188 =E= -1;

e119..  - b58 - x189 =E= -1;

e120..  - b59 - x190 =E= -1;

e121..  - b60 - x191 =E= -1;

e122..  - b61 - x192 =E= -1;

e123..  - b62 - x193 =E= -1;

e124.. x133*x71 =E= 0;

e125.. x134*x72 =E= 0;

e126.. x135*x73 =E= 0;

e127.. x136*x74 =E= 0;

e128.. x137*x75 =E= 0;

e129.. x138*x76 =E= 0;

e130.. x139*x77 =E= 0;

e131.. x140*x78 =E= 0;

e132.. x141*x79 =E= 0;

e133.. x142*x80 =E= 0;

e134.. x143*x81 =E= 0;

e135.. x144*x83 =E= 0;

e136.. x145*x84 =E= 0;

e137.. x146*x85 =E= 0;

e138.. x147*x86 =E= 0;

e139.. x148*x87 =E= 0;

e140.. x149*x88 =E= 0;

e141.. x150*x89 =E= 0;

e142.. x151*x90 =E= 0;

e143.. x152*x91 =E= 0;

e144.. x153*x92 =E= 0;

e145.. x154*x93 =E= 0;

e146.. x155*x94 =E= 0;

e147.. x156*x95 =E= 0;

e148.. x157*x96 =E= 0;

e149.. x158*x97 =E= 0;

e150.. x159*x98 =E= 0;

e151.. x160*x99 =E= 0;

e152.. x161*x100 =E= 0;

e153.. x162*x101 =E= 0;

e154.. x163*x102 =E= 0;

e155.. x164*x103 =E= 0;

e156.. x165*x104 =E= 0;

e157.. x166*x105 =E= 0;

e158.. x167*x106 =E= 0;

e159.. x168*x107 =E= 0;

e160.. x169*x108 =E= 0;

e161.. x170*x109 =E= 0;

e162.. x171*x110 =E= 0;

e163.. x172*x111 =E= 0;

e164.. x173*x112 =E= 0;

e165.. x174*x113 =E= 0;

e166.. x175*x114 =E= 0;

e167.. x176*x115 =E= 0;

e168.. x177*x116 =E= 0;

e169.. x178*x117 =E= 0;

e170.. x179*x118 =E= 0;

e171.. x180*x119 =E= 0;

e172.. x181*x120 =E= 0;

e173.. x182*x121 =E= 0;

e174.. x183*x122 =E= 0;

e175.. x184*x123 =E= 0;

e176.. x185*x124 =E= 0;

e177.. x186*x125 =E= 0;

e178.. x187*x126 =E= 0;

e179.. x188*x127 =E= 0;

e180.. x189*x128 =E= 0;

e181.. x190*x129 =E= 0;

e182.. x191*x130 =E= 0;

e183.. x192*x131 =E= 0;

e184.. x193*x132 =E= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
