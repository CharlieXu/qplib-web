$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*         87       31        0       56        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        233       33      200        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        729      657       72        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102
          ,b103,b104,b105,b106,b107,b108,b109,b110,b111,b112,b113,b114,b115
          ,b116,b117,b118,b119,b120,b121,b122,b123,b124,b125,b126,b127,b128
          ,b129,b130,b131,b132,b133,b134,b135,b136,b137,b138,b139,b140,b141
          ,b142,b143,b144,b145,b146,b147,b148,b149,b150,b151,b152,b153,b154
          ,b155,b156,b157,b158,b159,b160,b161,b162,b163,b164,b165,b166,b167
          ,b168,b169,b170,b171,b172,b173,b174,b175,b176,b177,b178,b179,b180
          ,b181,b182,b183,b184,b185,b186,b187,b188,b189,b190,b191,b192,b193
          ,b194,b195,b196,b197,b198,b199,b200,b201,x202,x203,x204,x205,x206
          ,x207,x208,x209,x210,x211,x212,x213,x214,x215,x216,x217,x218,x219
          ,x220,x221,x222,x223,x224,x225,x226,x227,x228,x229,x230,x231,x232
          ,x233;

Positive Variables  x202,x203,x204,x205,x206,x207,x208,x209,x210,x211,x212
          ,x213,x214,x215,x216,x217,x218,x219,x220,x221,x222,x223,x224,x225
          ,x226,x227,x228,x229,x230,x231,x232,x233;

Binary Variables  b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18
          ,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69
          ,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,b85,b86
          ,b87,b88,b89,b90,b91,b92,b93,b94,b95,b96,b97,b98,b99,b100,b101,b102
          ,b103,b104,b105,b106,b107,b108,b109,b110,b111,b112,b113,b114,b115
          ,b116,b117,b118,b119,b120,b121,b122,b123,b124,b125,b126,b127,b128
          ,b129,b130,b131,b132,b133,b134,b135,b136,b137,b138,b139,b140,b141
          ,b142,b143,b144,b145,b146,b147,b148,b149,b150,b151,b152,b153,b154
          ,b155,b156,b157,b158,b159,b160,b161,b162,b163,b164,b165,b166,b167
          ,b168,b169,b170,b171,b172,b173,b174,b175,b176,b177,b178,b179,b180
          ,b181,b182,b183,b184,b185,b186,b187,b188,b189,b190,b191,b192,b193
          ,b194,b195,b196,b197,b198,b199,b200,b201;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36
          ,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e48,e49,e50,e51,e52,e53
          ,e54,e55,e56,e57,e58,e59,e60,e61,e62,e63,e64,e65,e66,e67,e68,e69,e70
          ,e71,e72,e73,e74,e75,e76,e77,e78,e79,e80,e81,e82,e83,e84,e85,e86,e87;


e1..  - objvar + 208.7923896*b2 + 217.2209954*b3 + 219.3289637*b4
      + 335.6517552*b5 + 357.3304545*b6 + 346.2886503*b7 + 266.8313598*b8
      + 456.2706989*b9 + 598.6038238*b10 + 472.7609614*b11 + 440.8950907*b12
      + 587.3914452*b13 + 645.5910647*b14 + 842.2899237*b15 + 121.0852748*b16
      + 827.5932581*b17 + 197.8840408*b18 + 265.6702702*b19 + 277.1940633*b20
      + 300.5153489*b21 + 219.7371177*b22 + 29.76050157*b23 + 340.1661794*b24
      + 283.8567769*b25 + 530.3717126*b26 + 666.3422012*b27 + 688.2626563*b28
      + 749.8841493*b29 + 433.1882328*b30 + 179.889569*b31 + 781.5138942*b32
      + 721.5782419*b33 + 385.3653314*b34 + 397.3107515*b35 + 394.7096184*b36
      + 488.7963813*b37 + 69.12280467*b38 + 353.7744268*b39 + 291.7908849*b40
      + 571.7232733*b41 + 155.2223867*b42 + 99.28992269*b43 + 86.21961874*b44
      + 139.6709246*b45 + 254.8009184*b46 + 272.3997162*b47 + 63.66694629*b48
      + 233.1240688*b49 + 420.4336117*b50 + 392.7435313*b51 + 381.7827431*b52
      + 492.3392589*b53 + 221.7654108*b54 + 471.5098847*b55 + 198.3268111*b56
      + 616.9469472*b57 + 367.6303091*b58 + 460.5971685*b59 + 476.1065431*b60
      + 507.2919949*b61 + 326.7943645*b62 + 129.7919789*b63 + 548.7961384*b64
      + 473.3950387*b65 + 325.4472068*b66 + 490.4697133*b67 + 523.8157897*b68
      + 505.0342575*b69 + 692.4114261*b70 + 200.5562173*b71 + 775.7926466*b72
      + 384.9539012*b73 + 90.66023629*b74 + 141.1234424*b75 + 161.9562137*b76
      + 109.048636*b77 + 478.5055062*b78 + 280.9210069*b79 + 370.5418692*b80
      + 90.08855713*b81 + 298.1873352*b82 + 446.8065473*b83 + 478.6828084*b84
      + 442.7415388*b85 + 691.3859125*b86 + 245.1915257*b87 + 733.0886028*b88
      + 307.3194374*b89 + 337.8889829*b90 + 419.1671562*b91 + 433.2745874*b92
      + 450.4459516*b93 + 325.5628894*b94 + 140.6252975*b95 + 505.7527739*b96
      + 406.5470943*b97 + 222.184701*b98 + 240.7068589*b99 + 241.5748803*b100
      + 291.369743*b101 + 15.26863235*b102 + 176.8097729*b103
      + 203.1896671*b104 + 327.6559197*b105 + 129.8772289*b106
      + 213.8640556*b107 + 228.9045886*b108 + 267.714721*b109
      + 296.1299224*b110 + 120.9975443*b111 + 335.6137507*b112
      + 282.4666583*b113 + 672.8988641*b114 + 756.1872167*b115
      + 765.6648408*b116 + 865.1924652*b117 + 236.611873*b118 + 434.919976*b119
      + 723.1073948*b120 + 901.1395173*b121 + 219.6020485*b122
      + 201.1573873*b123 + 198.0470014*b124 + 323.2788429*b125
      + 375.7404719*b126 + 384.3200114*b127 + 227.9152469*b128
      + 461.2060355*b129 + 136.6975884*b130 + 195.7956722*b131
      + 206.5101395*b132 + 266.9936438*b133 + 266.4288287*b134
      + 172.197877*b135 + 285.213773*b136 + 314.0393532*b137 + 100.5467994*b138
      + 158.8696006*b139 + 169.1771018*b140 + 192.3723623*b141
      + 196.9283908*b142 + 62.85911742*b143 + 238.9068803*b144
      + 194.625573*b145 + 426.2291319*b146 + 514.4953268*b147
      + 528.3820109*b148 + 570.004598*b149 + 306.9637684*b150 + 192.514355*b151
      + 576.4450776*b152 + 547.2741001*b153 + 355.7813288*b154
      + 441.0814159*b155 + 455.9505736*b156 + 472.9253919*b157
      + 345.9020828*b158 + 150.2485542*b159 + 533.1201006*b160
      + 425.4271785*b161 + 312.5019549*b162 + 342.7765312*b163
      + 344.7442064*b164 + 420.0608124*b165 + 52.44432118*b166
      + 248.287531*b167 + 297.0591575*b168 + 474.8545302*b169
      + 304.5727839*b170 + 413.9209616*b171 + 436.177555*b172
      + 418.6662866*b173 + 507.6021518*b174 + 167.1247054*b175
      + 599.9462832*b176 + 318.4324678*b177 + 428.280624*b178
      + 146.0296955*b179 + 90.44036211*b180 + 443.1386765*b181
      + 145.9759617*b182 + 88.86212643*b183 + 397.3435692*b184
      + 142.9168593*b185 + 90.90906388*b186 + 292.4943827*b187
      + 113.9546446*b188 + 75.44055706*b189 + 444.3619337*b190
      + 145.5064022*b191 + 88.31189471*b192 + 277.6585718*b193
      + 112.7368949*b194 + 76.19201069*b195 + 477.617688*b196
      + 153.6750053*b197 + 92.45470405*b198 + 336.3462578*b199
      + 118.9395511*b200 + 75.01724595*b201 + 90113.95173*x202
      + 90113.95173*x203 + 90113.95173*x204 + 90113.95173*x205
      + 90113.95173*x206 + 90113.95173*x207 + 90113.95173*x208
      + 90113.95173*x209 =E= 0;

e2..    1.171932132*b2 + 1.380580128*b10 + 0.642148796*b18 + 1.365957869*b26
      + 0.883196807*b34 + 0.529359847*b42 + 0.944441234*b50 + 0.877264007*b58
      + 1.377561448*b66 + 0.849949624*b74 + 1.272241722*b82 + 0.725429288*b90
      + 0.514827484*b98 + 0.859331887*b106 + 1.257166993*b114
      + 1.166831024*b122 + 0.873786249*b130 + 0.571003843*b138
      + 0.894706799*b146 + 0.757692826*b154 + 0.793024066*b162
      + 0.914251523*b170 - 2.122040405*x210 - 4.244080809*x211
      - 6.366121214*x212 =E= 0;

e3..    1.171932132*b3 + 1.380580128*b11 + 0.642148796*b19 + 1.365957869*b27
      + 0.883196807*b35 + 0.529359847*b43 + 0.944441234*b51 + 0.877264007*b59
      + 1.377561448*b67 + 0.849949624*b75 + 1.272241722*b83 + 0.725429288*b91
      + 0.514827484*b99 + 0.859331887*b107 + 1.257166993*b115
      + 1.166831024*b123 + 0.873786249*b131 + 0.571003843*b139
      + 0.894706799*b147 + 0.757692826*b155 + 0.793024066*b163
      + 0.914251523*b171 - 1.979936388*x213 - 3.959872775*x214
      - 5.939809163*x215 =E= 0;

e4..    1.171932132*b4 + 1.380580128*b12 + 0.642148796*b20 + 1.365957869*b28
      + 0.883196807*b36 + 0.529359847*b44 + 0.944441234*b52 + 0.877264007*b60
      + 1.377561448*b68 + 0.849949624*b76 + 1.272241722*b84 + 0.725429288*b92
      + 0.514827484*b100 + 0.859331887*b108 + 1.257166993*b116
      + 1.166831024*b124 + 0.873786249*b132 + 0.571003843*b140
      + 0.894706799*b148 + 0.757692826*b156 + 0.793024066*b164
      + 0.914251523*b172 - 2.31103048*x216 - 4.62206096*x217 - 6.93309144*x218
      =E= 0;

e5..    1.171932132*b5 + 1.380580128*b13 + 0.642148796*b21 + 1.365957869*b29
      + 0.883196807*b37 + 0.529359847*b45 + 0.944441234*b53 + 0.877264007*b61
      + 1.377561448*b69 + 0.849949624*b77 + 1.272241722*b85 + 0.725429288*b93
      + 0.514827484*b101 + 0.859331887*b109 + 1.257166993*b117
      + 1.166831024*b125 + 0.873786249*b133 + 0.571003843*b141
      + 0.894706799*b149 + 0.757692826*b157 + 0.793024066*b165
      + 0.914251523*b173 - 2.161970351*x219 - 4.323940702*x220
      - 6.485911053*x221 =E= 0;

e6..    1.171932132*b6 + 1.380580128*b14 + 0.642148796*b22 + 1.365957869*b30
      + 0.883196807*b38 + 0.529359847*b46 + 0.944441234*b54 + 0.877264007*b62
      + 1.377561448*b70 + 0.849949624*b78 + 1.272241722*b86 + 0.725429288*b94
      + 0.514827484*b102 + 0.859331887*b110 + 1.257166993*b118
      + 1.166831024*b126 + 0.873786249*b134 + 0.571003843*b142
      + 0.894706799*b150 + 0.757692826*b158 + 0.793024066*b166
      + 0.914251523*b174 - 1.950109723*x222 - 3.900219445*x223
      - 5.850329168*x224 =E= 0;

e7..    1.171932132*b7 + 1.380580128*b15 + 0.642148796*b23 + 1.365957869*b31
      + 0.883196807*b39 + 0.529359847*b47 + 0.944441234*b55 + 0.877264007*b63
      + 1.377561448*b71 + 0.849949624*b79 + 1.272241722*b87 + 0.725429288*b95
      + 0.514827484*b103 + 0.859331887*b111 + 1.257166993*b119
      + 1.166831024*b127 + 0.873786249*b135 + 0.571003843*b143
      + 0.894706799*b151 + 0.757692826*b159 + 0.793024066*b167
      + 0.914251523*b175 - 2.32308593*x225 - 4.64617186*x226 - 6.96925779*x227
      =E= 0;

e8..    1.171932132*b8 + 1.380580128*b16 + 0.642148796*b24 + 1.365957869*b32
      + 0.883196807*b40 + 0.529359847*b48 + 0.944441234*b56 + 0.877264007*b64
      + 1.377561448*b72 + 0.849949624*b80 + 1.272241722*b88 + 0.725429288*b96
      + 0.514827484*b104 + 0.859331887*b112 + 1.257166993*b120
      + 1.166831024*b128 + 0.873786249*b136 + 0.571003843*b144
      + 0.894706799*b152 + 0.757692826*b160 + 0.793024066*b168
      + 0.914251523*b176 - 1.988543584*x228 - 3.977087168*x229
      - 5.965630751*x230 =E= 0;

e9..    1.171932132*b9 + 1.380580128*b17 + 0.642148796*b25 + 1.365957869*b33
      + 0.883196807*b41 + 0.529359847*b49 + 0.944441234*b57 + 0.877264007*b65
      + 1.377561448*b73 + 0.849949624*b81 + 1.272241722*b89 + 0.725429288*b97
      + 0.514827484*b105 + 0.859331887*b113 + 1.257166993*b121
      + 1.166831024*b129 + 0.873786249*b137 + 0.571003843*b145
      + 0.894706799*b153 + 0.757692826*b161 + 0.793024066*b169
      + 0.914251523*b177 - 1.859058786*x231 - 3.718117572*x232
      - 5.577176358*x233 =E= 0;

e10..    b2 + b3 + b4 + b5 + b6 + b7 + b8 + b9 =E= 1;

e11..    b10 + b11 + b12 + b13 + b14 + b15 + b16 + b17 =E= 1;

e12..    b18 + b19 + b20 + b21 + b22 + b23 + b24 + b25 =E= 1;

e13..    b26 + b27 + b28 + b29 + b30 + b31 + b32 + b33 =E= 1;

e14..    b34 + b35 + b36 + b37 + b38 + b39 + b40 + b41 =E= 1;

e15..    b42 + b43 + b44 + b45 + b46 + b47 + b48 + b49 =E= 1;

e16..    b50 + b51 + b52 + b53 + b54 + b55 + b56 + b57 =E= 1;

e17..    b58 + b59 + b60 + b61 + b62 + b63 + b64 + b65 =E= 1;

e18..    b66 + b67 + b68 + b69 + b70 + b71 + b72 + b73 =E= 1;

e19..    b74 + b75 + b76 + b77 + b78 + b79 + b80 + b81 =E= 1;

e20..    b82 + b83 + b84 + b85 + b86 + b87 + b88 + b89 =E= 1;

e21..    b90 + b91 + b92 + b93 + b94 + b95 + b96 + b97 =E= 1;

e22..    b98 + b99 + b100 + b101 + b102 + b103 + b104 + b105 =E= 1;

e23..    b106 + b107 + b108 + b109 + b110 + b111 + b112 + b113 =E= 1;

e24..    b114 + b115 + b116 + b117 + b118 + b119 + b120 + b121 =E= 1;

e25..    b122 + b123 + b124 + b125 + b126 + b127 + b128 + b129 =E= 1;

e26..    b130 + b131 + b132 + b133 + b134 + b135 + b136 + b137 =E= 1;

e27..    b138 + b139 + b140 + b141 + b142 + b143 + b144 + b145 =E= 1;

e28..    b146 + b147 + b148 + b149 + b150 + b151 + b152 + b153 =E= 1;

e29..    b154 + b155 + b156 + b157 + b158 + b159 + b160 + b161 =E= 1;

e30..    b162 + b163 + b164 + b165 + b166 + b167 + b168 + b169 =E= 1;

e31..    b170 + b171 + b172 + b173 + b174 + b175 + b176 + b177 =E= 1;

e32..    b178 + b179 + b180 =L= 1;

e33..    b181 + b182 + b183 =L= 1;

e34..    b184 + b185 + b186 =L= 1;

e35..    b187 + b188 + b189 =L= 1;

e36..    b190 + b191 + b192 =L= 1;

e37..    b193 + b194 + b195 =L= 1;

e38..    b196 + b197 + b198 =L= 1;

e39..    b199 + b200 + b201 =L= 1;

e40..  - b178 + x210 =L= 0;

e41..  - b179 + x211 =L= 0;

e42..  - b180 + x212 =L= 0;

e43..  - b181 + x213 =L= 0;

e44..  - b182 + x214 =L= 0;

e45..  - b183 + x215 =L= 0;

e46..  - b184 + x216 =L= 0;

e47..  - b185 + x217 =L= 0;

e48..  - b186 + x218 =L= 0;

e49..  - b187 + x219 =L= 0;

e50..  - b188 + x220 =L= 0;

e51..  - b189 + x221 =L= 0;

e52..  - b190 + x222 =L= 0;

e53..  - b191 + x223 =L= 0;

e54..  - b192 + x224 =L= 0;

e55..  - b193 + x225 =L= 0;

e56..  - b194 + x226 =L= 0;

e57..  - b195 + x227 =L= 0;

e58..  - b196 + x228 =L= 0;

e59..  - b197 + x229 =L= 0;

e60..  - b198 + x230 =L= 0;

e61..  - b199 + x231 =L= 0;

e62..  - b200 + x232 =L= 0;

e63..  - b201 + x233 =L= 0;

e64.. x210*b178 - x202*b178 + x210*x202 =L= 0;

e65.. x211*b179 - x202*b179 + x211*x202 =L= 0;

e66.. x212*b180 - x202*b180 + x212*x202 =L= 0;

e67.. x213*b181 - x203*b181 + x213*x203 =L= 0;

e68.. x214*b182 - x203*b182 + x214*x203 =L= 0;

e69.. x215*b183 - x203*b183 + x215*x203 =L= 0;

e70.. x216*b184 - x204*b184 + x216*x204 =L= 0;

e71.. x217*b185 - x204*b185 + x217*x204 =L= 0;

e72.. x218*b186 - x204*b186 + x218*x204 =L= 0;

e73.. x219*b187 - x205*b187 + x219*x205 =L= 0;

e74.. x220*b188 - x205*b188 + x220*x205 =L= 0;

e75.. x221*b189 - x205*b189 + x221*x205 =L= 0;

e76.. x222*b190 - x206*b190 + x222*x206 =L= 0;

e77.. x223*b191 - x206*b191 + x223*x206 =L= 0;

e78.. x224*b192 - x206*b192 + x224*x206 =L= 0;

e79.. x225*b193 - x207*b193 + x225*x207 =L= 0;

e80.. x226*b194 - x207*b194 + x226*x207 =L= 0;

e81.. x227*b195 - x207*b195 + x227*x207 =L= 0;

e82.. x228*b196 - x208*b196 + x228*x208 =L= 0;

e83.. x229*b197 - x208*b197 + x229*x208 =L= 0;

e84.. x230*b198 - x208*b198 + x230*x208 =L= 0;

e85.. x231*b199 - x209*b199 + x231*x209 =L= 0;

e86.. x232*b200 - x209*b200 + x232*x209 =L= 0;

e87.. x233*b201 - x209*b201 + x233*x209 =L= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
