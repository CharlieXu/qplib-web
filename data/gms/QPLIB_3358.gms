$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        173      146        0       27        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        159      159        0        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        619      407      212        0
*
*  Solve m using QCP minimizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52
          ,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69
          ,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86
          ,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102
          ,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115
          ,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127,x128
          ,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x140,x141
          ,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151,x152,x153,x154
          ,x155,x156,x157,x158,x159;

Positive Variables  x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x26,x27,x28,x29
          ,x30,x31,x32,x33,x34,x35,x36,x37,x52,x53,x55,x79,x81,x93,x95,x109
          ,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122,x123
          ,x124,x125,x126,x127,x128,x129,x130,x131,x132,x133,x134,x135,x136
          ,x137,x138,x139;

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
          ,e169,e170,e171,e172,e173;


e1..  - objvar + x52 =E= 0;

e2..    x52 - x107 =E= -8.523893421;

e3..    x108 - x109 =L= -1.2;

e4..    x110 - x111 =L= -1.2;

e5..  - 0.1666666667*x112 - 0.1666666667*x113 - 0.1666666667*x114
      - 0.1666666667*x115 - 0.1666666667*x116 - 0.1666666667*x117 + x118 =E= 0;

e6..  - 0.1666666667*x119 - 0.1666666667*x120 - 0.1666666667*x121
      - 0.1666666667*x122 - 0.1666666667*x123 - 0.1666666667*x124 + x125 =E= 0;

e7..  - 0.1666666667*x126 - 0.1666666667*x127 - 0.1666666667*x128
      - 0.1666666667*x129 - 0.1666666667*x130 - 0.1666666667*x131 + x132 =E= 0;

e8..  - 0.1666666667*x133 - 0.1666666667*x134 - 0.1666666667*x135
      - 0.1666666667*x136 - 0.1666666667*x137 - 0.1666666667*x138 + x139 =E= 0;

e9..  - x109 + x112 =L= 0;

e10..  - x111 + x119 =L= 0;

e11..  - x109 + x113 =L= 0;

e12..  - x111 + x120 =L= 0;

e13..  - x109 + x114 =L= 0;

e14..  - x111 + x121 =L= 0;

e15..  - x109 + x115 =L= 0;

e16..  - x111 + x122 =L= 0;

e17..  - x109 + x116 =L= 0;

e18..  - x111 + x123 =L= 0;

e19..  - x109 + x117 =L= 0;

e20..  - x111 + x124 =L= 0;

e21..  - x109 + x126 =L= 0;

e22..  - x111 + x133 =L= 0;

e23..  - x109 + x127 =L= 0;

e24..  - x111 + x134 =L= 0;

e25..  - x109 + x128 =L= 0;

e26..  - x111 + x135 =L= 0;

e27..  - x109 + x129 =L= 0;

e28..  - x111 + x136 =L= 0;

e29..  - x109 + x130 =L= 0;

e30..  - x111 + x137 =L= 0;

e31..  - x109 + x131 =L= 0;

e32..  - x111 + x138 =L= 0;

e33..    x112 - x118 + 0.8333333333*x140 + 0.75*x141 =E= 0;

e34..    x113 - x118 - 0.1666666667*x140 + 0.75*x141 =E= 0;

e35..    x114 - x118 - 0.6666666667*x140 + 0.25*x141 =E= 0;

e36..    x115 - x118 - 0.6666666667*x140 - 0.25*x141 =E= 0;

e37..    x116 - x118 - 0.1666666667*x140 - 0.75*x141 =E= 0;

e38..    x117 - x118 + 0.8333333333*x140 - 0.75*x141 =E= 0;

e39..    x126 - x132 + 0.8333333333*x142 + 0.75*x143 =E= 0;

e40..    x127 - x132 - 0.1666666667*x142 + 0.75*x143 =E= 0;

e41..    x128 - x132 - 0.6666666667*x142 + 0.25*x143 =E= 0;

e42..    x129 - x132 - 0.6666666667*x142 - 0.25*x143 =E= 0;

e43..    x130 - x132 - 0.1666666667*x142 - 0.75*x143 =E= 0;

e44..    x131 - x132 + 0.8333333333*x142 - 0.75*x143 =E= 0;

e45..    x119 - x125 - 0.75*x140 + 0.8333333333*x141 =E= 0;

e46..    x120 - x125 - 0.75*x140 - 0.1666666667*x141 =E= 0;

e47..    x121 - x125 - 0.25*x140 - 0.6666666667*x141 =E= 0;

e48..    x122 - x125 + 0.25*x140 - 0.6666666667*x141 =E= 0;

e49..    x123 - x125 + 0.75*x140 - 0.1666666667*x141 =E= 0;

e50..    x124 - x125 + 0.75*x140 + 0.8333333333*x141 =E= 0;

e51..    x133 - x139 - 0.75*x142 + 0.8333333333*x143 =E= 0;

e52..    x134 - x139 - 0.75*x142 - 0.1666666667*x143 =E= 0;

e53..    x135 - x139 - 0.25*x142 - 0.6666666667*x143 =E= 0;

e54..    x136 - x139 + 0.25*x142 - 0.6666666667*x143 =E= 0;

e55..    x137 - x139 + 0.75*x142 - 0.1666666667*x143 =E= 0;

e56..    x138 - x139 + 0.75*x142 + 0.8333333333*x143 =E= 0;

e57..  - x144 + x145 =E= 0;

e58..    x146 + x147 =E= 0;

e59..  - x148 + x149 =E= 0;

e60..  - x150 + x151 =E= 0;

e61..    x152 + x153 =E= 0;

e62..    x154 + x155 =E= 0;

e63..    1.2*x149 + x156 =E= 0;

e64..    1.2*x153 + x157 =E= 0;

e65..    1.2*x151 + x158 =E= 0;

e66..    1.2*x155 + x159 =E= 0;

e67..    x118 - x132 =L= 0;

e68.. -x111*x109 + x107 =E= 0;

e69.. x146*x14 + x53 + x54 - x112 =E= 0;

e70.. x144*x14 + x55 + x56 - x119 =E= 0;

e71.. x146*x15 + x53 + x57 - x113 =E= 0;

e72.. x144*x15 + x55 + x58 - x120 =E= 0;

e73.. x146*x16 + x53 + x59 - x114 =E= 0;

e74.. x144*x16 + x55 + x60 - x121 =E= 0;

e75.. x146*x17 + x53 + x61 - x115 =E= 0;

e76.. x144*x17 + x55 + x62 - x122 =E= 0;

e77.. x146*x18 + x53 + x63 - x116 =E= 0;

e78.. x144*x18 + x55 + x64 - x123 =E= 0;

e79.. x146*x19 + x53 + x65 - x117 =E= 0;

e80.. x144*x19 + x55 + x66 - x124 =E= 0;

e81.. x146*x20 + x53 + x67 - x126 =E= 0;

e82.. x144*x20 + x55 + x68 - x133 =E= 0;

e83.. x146*x21 + x53 + x69 - x127 =E= 0;

e84.. x144*x21 + x55 + x70 - x134 =E= 0;

e85.. x146*x22 + x53 + x71 - x128 =E= 0;

e86.. x144*x22 + x55 + x72 - x135 =E= 0;

e87.. x146*x23 + x53 + x73 - x129 =E= 0;

e88.. x144*x23 + x55 + x74 - x136 =E= 0;

e89.. x146*x24 + x53 + x75 - x130 =E= 0;

e90.. x144*x24 + x55 + x76 - x137 =E= 0;

e91.. x146*x25 + x53 + x77 - x131 =E= 0;

e92.. x144*x25 + x55 + x78 - x138 =E= 0;

e93.. -x145*x2 + x54 =E= 0;

e94.. -x147*x2 + x56 =E= 0;

e95.. -x145*x3 + x57 =E= 0;

e96.. -x147*x3 + x58 =E= 0;

e97.. -x145*x4 + x59 =E= 0;

e98.. -x147*x4 + x60 =E= 0;

e99.. -x145*x5 + x61 =E= 0;

e100.. -x147*x5 + x62 =E= 0;

e101.. -x145*x6 + x63 =E= 0;

e102.. -x147*x6 + x64 =E= 0;

e103.. -x145*x7 + x65 =E= 0;

e104.. -x147*x7 + x66 =E= 0;

e105.. x145*x8 + x67 =E= 0;

e106.. x147*x8 + x68 =E= 0;

e107.. x145*x9 + x69 =E= 0;

e108.. x147*x9 + x70 =E= 0;

e109.. x145*x10 + x71 =E= 0;

e110.. x147*x10 + x72 =E= 0;

e111.. x145*x11 + x73 =E= 0;

e112.. x147*x11 + x74 =E= 0;

e113.. x145*x12 + x75 =E= 0;

e114.. x147*x12 + x76 =E= 0;

e115.. x145*x13 + x77 =E= 0;

e116.. x147*x13 + x78 =E= 0;

e117.. x152*x38 + x79 + x80 - x112 =E= 0;

e118.. x148*x38 + x81 + x82 - x119 =E= 0;

e119.. x152*x39 + x79 + x83 - x113 =E= 0;

e120.. x148*x39 + x81 + x84 - x120 =E= 0;

e121.. x152*x40 + x79 + x85 - x114 =E= 0;

e122.. x148*x40 + x81 + x86 - x121 =E= 0;

e123.. x152*x41 + x79 + x87 - x115 =E= 0;

e124.. x148*x41 + x81 + x88 - x122 =E= 0;

e125.. x152*x42 + x79 + x89 - x116 =E= 0;

e126.. x148*x42 + x81 + x90 - x123 =E= 0;

e127.. x152*x43 + x79 + x91 - x117 =E= 0;

e128.. x148*x43 + x81 + x92 - x124 =E= 0;

e129.. x154*x44 + x93 + x94 - x126 =E= 0;

e130.. x150*x44 + x95 + x96 - x133 =E= 0;

e131.. x154*x45 + x93 + x97 - x127 =E= 0;

e132.. x150*x45 + x95 + x98 - x134 =E= 0;

e133.. x154*x46 + x93 + x99 - x128 =E= 0;

e134.. x150*x46 + x95 + x100 - x135 =E= 0;

e135.. x154*x47 + x93 + x101 - x129 =E= 0;

e136.. x150*x47 + x95 + x102 - x136 =E= 0;

e137.. x154*x48 + x93 + x103 - x130 =E= 0;

e138.. x150*x48 + x95 + x104 - x137 =E= 0;

e139.. x154*x49 + x93 + x105 - x131 =E= 0;

e140.. x150*x49 + x95 + x106 - x138 =E= 0;

e141.. x152*x50 + x79 - x108 + x156 =E= 0;

e142.. x148*x50 + x81 - x110 + x157 =E= 0;

e143.. x154*x51 + x93 - x108 + x158 =E= 0;

e144.. x150*x51 + x95 - x110 + x159 =E= 0;

e145.. -x149*x26 + x80 =E= 0;

e146.. -x153*x26 + x82 =E= 0;

e147.. -x149*x27 + x83 =E= 0;

e148.. -x153*x27 + x84 =E= 0;

e149.. -x149*x28 + x85 =E= 0;

e150.. -x153*x28 + x86 =E= 0;

e151.. -x149*x29 + x87 =E= 0;

e152.. -x153*x29 + x88 =E= 0;

e153.. -x149*x30 + x89 =E= 0;

e154.. -x153*x30 + x90 =E= 0;

e155.. -x149*x31 + x91 =E= 0;

e156.. -x153*x31 + x92 =E= 0;

e157.. -x151*x32 + x94 =E= 0;

e158.. -x155*x32 + x96 =E= 0;

e159.. -x151*x33 + x97 =E= 0;

e160.. -x155*x33 + x98 =E= 0;

e161.. -x151*x34 + x99 =E= 0;

e162.. -x155*x34 + x100 =E= 0;

e163.. -x151*x35 + x101 =E= 0;

e164.. -x155*x35 + x102 =E= 0;

e165.. -x151*x36 + x103 =E= 0;

e166.. -x155*x36 + x104 =E= 0;

e167.. -x151*x37 + x105 =E= 0;

e168.. -x155*x37 + x106 =E= 0;

e169.. sqr(x140) + sqr(x141) =E= 1;

e170.. sqr(x142) + sqr(x143) =E= 1;

e171.. sqr(x144) + sqr(x146) =E= 1;

e172.. sqr(x148) + sqr(x152) =E= 1;

e173.. sqr(x150) + sqr(x154) =E= 1;

* set non-default bounds
x2.up = 8.94427191;
x3.up = 8.94427191;
x4.up = 8.94427191;
x5.up = 8.94427191;
x6.up = 8.94427191;
x7.up = 8.94427191;
x8.up = 8.94427191;
x9.up = 8.94427191;
x10.up = 8.94427191;
x11.up = 8.94427191;
x12.up = 8.94427191;
x13.up = 8.94427191;
x14.lo = -8.94427191; x14.up = 8.94427191;
x15.lo = -8.94427191; x15.up = 8.94427191;
x16.lo = -8.94427191; x16.up = 8.94427191;
x17.lo = -8.94427191; x17.up = 8.94427191;
x18.lo = -8.94427191; x18.up = 8.94427191;
x19.lo = -8.94427191; x19.up = 8.94427191;
x20.lo = -8.94427191; x20.up = 8.94427191;
x21.lo = -8.94427191; x21.up = 8.94427191;
x22.lo = -8.94427191; x22.up = 8.94427191;
x23.lo = -8.94427191; x23.up = 8.94427191;
x24.lo = -8.94427191; x24.up = 8.94427191;
x25.lo = -8.94427191; x25.up = 8.94427191;
x26.up = 8.94427191;
x27.up = 8.94427191;
x28.up = 8.94427191;
x29.up = 8.94427191;
x30.up = 8.94427191;
x31.up = 8.94427191;
x32.up = 8.94427191;
x33.up = 8.94427191;
x34.up = 8.94427191;
x35.up = 8.94427191;
x36.up = 8.94427191;
x37.up = 8.94427191;
x38.lo = -8.94427191; x38.up = 8.94427191;
x39.lo = -8.94427191; x39.up = 8.94427191;
x40.lo = -8.94427191; x40.up = 8.94427191;
x41.lo = -8.94427191; x41.up = 8.94427191;
x42.lo = -8.94427191; x42.up = 8.94427191;
x43.lo = -8.94427191; x43.up = 8.94427191;
x44.lo = -8.94427191; x44.up = 8.94427191;
x45.lo = -8.94427191; x45.up = 8.94427191;
x46.lo = -8.94427191; x46.up = 8.94427191;
x47.lo = -8.94427191; x47.up = 8.94427191;
x48.lo = -8.94427191; x48.up = 8.94427191;
x49.lo = -8.94427191; x49.up = 8.94427191;
x50.lo = -8.94427191; x50.up = 8.94427191;
x51.lo = -8.94427191; x51.up = 8.94427191;
x52.up = 32;
x53.up = 8;
x54.lo = -8.94427191; x54.up = 8.94427191;
x55.up = 4;
x56.lo = -8.94427191; x56.up = 8.94427191;
x57.lo = -8.94427191; x57.up = 8.94427191;
x58.lo = -8.94427191; x58.up = 8.94427191;
x59.lo = -8.94427191; x59.up = 8.94427191;
x60.lo = -8.94427191; x60.up = 8.94427191;
x61.lo = -8.94427191; x61.up = 8.94427191;
x62.lo = -8.94427191; x62.up = 8.94427191;
x63.lo = -8.94427191; x63.up = 8.94427191;
x64.lo = -8.94427191; x64.up = 8.94427191;
x65.lo = -8.94427191; x65.up = 8.94427191;
x66.lo = -8.94427191; x66.up = 8.94427191;
x67.lo = -8.94427191; x67.up = 8.94427191;
x68.lo = -8.94427191; x68.up = 8.94427191;
x69.lo = -8.94427191; x69.up = 8.94427191;
x70.lo = -8.94427191; x70.up = 8.94427191;
x71.lo = -8.94427191; x71.up = 8.94427191;
x72.lo = -8.94427191; x72.up = 8.94427191;
x73.lo = -8.94427191; x73.up = 8.94427191;
x74.lo = -8.94427191; x74.up = 8.94427191;
x75.lo = -8.94427191; x75.up = 8.94427191;
x76.lo = -8.94427191; x76.up = 8.94427191;
x77.lo = -8.94427191; x77.up = 8.94427191;
x78.lo = -8.94427191; x78.up = 8.94427191;
x79.up = 8;
x80.lo = -8.94427191; x80.up = 8.94427191;
x81.up = 4;
x82.lo = -8.94427191; x82.up = 8.94427191;
x83.lo = -8.94427191; x83.up = 8.94427191;
x84.lo = -8.94427191; x84.up = 8.94427191;
x85.lo = -8.94427191; x85.up = 8.94427191;
x86.lo = -8.94427191; x86.up = 8.94427191;
x87.lo = -8.94427191; x87.up = 8.94427191;
x88.lo = -8.94427191; x88.up = 8.94427191;
x89.lo = -8.94427191; x89.up = 8.94427191;
x90.lo = -8.94427191; x90.up = 8.94427191;
x91.lo = -8.94427191; x91.up = 8.94427191;
x92.lo = -8.94427191; x92.up = 8.94427191;
x93.up = 8;
x94.lo = -8.94427191; x94.up = 8.94427191;
x95.up = 4;
x96.lo = -8.94427191; x96.up = 8.94427191;
x97.lo = -8.94427191; x97.up = 8.94427191;
x98.lo = -8.94427191; x98.up = 8.94427191;
x99.lo = -8.94427191; x99.up = 8.94427191;
x100.lo = -8.94427191; x100.up = 8.94427191;
x101.lo = -8.94427191; x101.up = 8.94427191;
x102.lo = -8.94427191; x102.up = 8.94427191;
x103.lo = -8.94427191; x103.up = 8.94427191;
x104.lo = -8.94427191; x104.up = 8.94427191;
x105.lo = -8.94427191; x105.up = 8.94427191;
x106.lo = -8.94427191; x106.up = 8.94427191;
x107.lo = 1.44; x107.up = 32;
x108.lo = 1.2; x108.up = 4;
x109.up = 8;
x110.lo = 1.2; x110.up = 2;
x111.up = 4;
x112.up = 8;
x113.up = 8;
x114.up = 8;
x115.up = 8;
x116.up = 8;
x117.up = 8;
x118.up = 8;
x119.up = 4;
x120.up = 4;
x121.up = 4;
x122.up = 4;
x123.up = 4;
x124.up = 4;
x125.up = 4;
x126.up = 8;
x127.up = 8;
x128.up = 8;
x129.up = 8;
x130.up = 8;
x131.up = 8;
x132.up = 8;
x133.up = 4;
x134.up = 4;
x135.up = 4;
x136.up = 4;
x137.up = 4;
x138.up = 4;
x139.up = 4;
x140.lo = -1; x140.up = 1;
x141.lo = -1; x141.up = 1;
x142.lo = -1; x142.up = 1;
x143.lo = -1; x143.up = 1;
x144.lo = -1; x144.up = 1;
x145.lo = -1; x145.up = 1;
x146.lo = -1; x146.up = 1;
x147.lo = -1; x147.up = 1;
x148.lo = -1; x148.up = 1;
x149.lo = -1; x149.up = 1;
x150.lo = -1; x150.up = 1;
x151.lo = -1; x151.up = 1;
x152.lo = -1; x152.up = 1;
x153.lo = -1; x153.up = 1;
x154.lo = -1; x154.up = 1;
x155.lo = -1; x155.up = 1;
x156.lo = -8.94427191; x156.up = 8.94427191;
x157.lo = -8.94427191; x157.up = 8.94427191;
x158.lo = -8.94427191; x158.up = 8.94427191;
x159.lo = -8.94427191; x159.up = 8.94427191;

* set non-default levels
x107.l = 1.44;
x108.l = 1.2;
x110.l = 1.2;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set QCP $set QCP QCP
Solve m using %QCP% minimizing objvar;
