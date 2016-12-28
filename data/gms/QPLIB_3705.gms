$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*          1        1        0        0        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        379        1      378        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        379        1      378        0
*
*  Solve m using MIQCP maximizing objvar;


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
          ,b376,b377,b378,b379;

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
          ,b376,b377,b378,b379;

Equations  e1;


e1.. 2*b2*b167 - 2*b2*b47 + 2*b167 + 2*b2*b176 - 2*b176 - 2*b2*b177 + 4*b177 + 
     2*b3*b27 - 2*b3*b180 + 2*b180 + 2*b3*b308 + 2*b308 - 2*b3*b339 + 4*b339 - 
     2*b4*b5 + 2*b4*b259 - 2*b259 + 2*b4*b311 - 2*b311 - 2*b4*b344 + 2*b344 + 2
     *b5*b11 + 2*b5*b233 - 2*b233 - 2*b5*b234 + 4*b234 - 2*b6*b35 - 2*b6*b187
      + 2*b187 + 2*b6*b203 - 2*b203 + 2*b6*b204 - 2*b204 - 2*b7*b136 + 2*b136
      - 2*b7*b180 + 2*b7*b310 - 2*b310 + 2*b7*b343 + 2*b343 - 2*b8*b42 - 2*b8*
     b173 + 2*b173 + 2*b8*b188 - 2*b188 + 2*b8*b221 - 2*b221 + 2*b9*b10 + 2*b9*
     b70 - 2*b9*b267 + 2*b267 - 2*b9*b297 + 2*b297 - 2*b10*b138 + 2*b138 - 2*
     b10*b140 + 2*b140 + 2*b10*b296 + 2*b296 + 2*b11*b259 - 2*b11*b375 + 4*b375
      - 2*b11*b378 + 4*b378 - 2*b12*b13 - 2*b12*b143 + 2*b143 + 2*b12*b174 + 2*
     b174 + 2*b12*b350 + 2*b350 - 2*b13*b28 + 2*b13*b88 + 2*b13*b89 + 2*b14*b15
      - 2*b14*b243 + 2*b243 - 2*b14*b271 + 2*b271 + 2*b14*b357 - 2*b357 - 2*b15
     *b137 + 2*b137 - 2*b15*b138 + 2*b15*b325 + 2*b325 + 2*b16*b17 - 2*b16*b192
      + 2*b192 + 2*b16*b210 - 2*b210 - 2*b16*b273 + 2*b273 - 2*b17*b53 + 2*b17*
     b63 - 2*b17*b357 + 2*b18*b82 + 2*b18*b101 - 2*b18*b341 - 2*b341 - 2*b18*
     b373 + 4*b373 + 2*b19*b20 - 2*b19*b136 + 2*b19*b217 + 2*b217 - 2*b19*b314
      + 4*b314 + 2*b20*b341 - 2*b20*b342 + 2*b342 - 2*b20*b345 + 4*b345 + 2*b21
     *b22 - 2*b21*b139 + 2*b139 - 2*b21*b190 + 4*b190 + 2*b21*b354 - 2*b354 - 2
     *b22*b52 - 2*b22*b80 + 2*b22*b322 + 2*b322 - 2*b23*b24 + 2*b23*b54 - 2*b23
     *b245 + 2*b245 + 2*b23*b354 + 2*b24*b69 - 2*b24*b144 + 4*b144 + 2*b24*b324
      - 2*b324 - 2*b25*b175 + 4*b175 + 2*b25*b226 - 4*b226 - 2*b25*b246 + 2*
     b246 + 2*b25*b326 - 2*b326 - 2*b26*b210 + 2*b26*b226 + 2*b26*b250 + 2*b250
      - 2*b26*b275 + 4*b275 + 2*b27*b93 - 2*b27*b231 + 4*b231 - 2*b27*b311 + 2*
     b28*b29 + 2*b28*b289 - 2*b289 - 2*b28*b290 + 4*b290 - 2*b29*b67 - 2*b29*
     b88 + 2*b29*b204 - 2*b30*b60 - 2*b30*b75 + 2*b30*b137 + 2*b30*b353 + 2*
     b353 - 2*b31*b193 + 4*b193 - 2*b31*b225 + 2*b225 + 2*b31*b248 - 4*b248 + 2
     *b31*b359 - 2*b359 + 2*b32*b64 - 2*b32*b192 + 2*b32*b248 - 2*b32*b302 + 4*
     b302 - 2*b33*b34 + 2*b33*b36 + 2*b33*b316 - 4*b316 - 2*b33*b319 + 2*b319
      - 2*b34*b79 + 2*b34*b95 + 2*b34*b263 - 2*b263 + 2*b35*b36 + 2*b35*b68 - 2
     *b35*b291 + 2*b291 - 2*b36*b74 - 2*b36*b263 - 2*b37*b68 + 2*b37*b69 + 2*
     b37*b138 - 2*b37*b143 + 2*b38*b76 + 2*b38*b165 + 2*b165 - 2*b38*b246 - 2*
     b38*b325 + 2*b39*b55 - 2*b39*b175 + 2*b39*b274 - 4*b274 - 2*b39*b333 + 4*
     b333 - 2*b40*b41 + 2*b40*b43 + 2*b40*b347 - 2*b347 - 2*b40*b350 - 2*b41*
     b73 + 2*b41*b240 - 2*b240 + 2*b41*b315 - 2*b315 + 2*b42*b43 + 2*b42*b61 - 
     2*b42*b264 + 2*b264 - 2*b43*b240 - 2*b43*b241 + 2*b241 + 2*b44*b60 - 2*b44
     *b61 + 2*b44*b140 - 2*b44*b144 - 2*b45*b273 - 2*b45*b296 + 2*b45*b324 + 2*
     b45*b359 - 2*b46*b193 + 2*b46*b299 - 2*b299 + 2*b46*b301 - 2*b301 - 2*b46*
     b365 + 4*b365 + 2*b47*b56 - 2*b47*b252 + 4*b252 + 2*b47*b301 + 2*b48*b49
      - 2*b48*b232 + 4*b232 + 2*b48*b342 - 2*b48*b375 + 2*b49*b121 - 2*b49*b214
      + 4*b214 - 2*b49*b280 + 4*b280 + 2*b50*b73 - 2*b50*b173 - 2*b50*b201 + 2*
     b201 + 2*b50*b221 - 2*b51*b66 + 2*b51*b109 - 2*b51*b221 + 2*b51*b346 - 2*
     b346 + 2*b52*b139 + 2*b52*b241 - 2*b52*b351 + 4*b351 - 2*b53*b270 + 2*b270
      + 2*b53*b295 - 2*b295 + 2*b53*b326 + 2*b54*b85 - 2*b54*b207 + 2*b207 - 2*
     b54*b326 - 2*b55*b99 - 2*b55*b142 + 2*b142 + 2*b55*b303 + 2*b303 - 2*b56*
     b142 + 2*b56*b168 + 2*b168 - 2*b56*b178 + 2*b178 + 2*b57*b117 - 2*b57*b196
      + 4*b196 - 2*b57*b254 + 4*b254 + 2*b57*b310 + 2*b58*b66 - 2*b58*b186 + 2*
     b186 - 2*b58*b187 + 2*b58*b203 + 2*b59*b112 + 2*b59*b114 - 2*b59*b186 - 2*
     b59*b203 + 2*b60*b74 - 2*b60*b320 + 4*b320 + 2*b61*b222 + 2*b222 - 2*b61*
     b265 + 2*b265 + 2*b62*b63 - 2*b62*b166 + 2*b166 - 2*b62*b177 + 2*b62*b363
      + 2*b363 - 2*b63*b104 - 2*b63*b131 - 2*b64*b145 + 2*b145 - 2*b64*b227 - 2
     *b227 + 2*b64*b276 + 2*b276 + 2*b65*b111 - 2*b65*b179 + 4*b179 - 2*b65*
     b230 + 4*b230 + 2*b65*b282 - 2*b282 - 2*b67*b113 + 2*b67*b132 + 2*b67*b143
      + 2*b68*b89 - 2*b68*b242 + 2*b242 - 2*b69*b116 - 2*b69*b355 + 4*b355 - 2*
     b70*b269 + 2*b269 - 2*b70*b273 + 2*b70*b327 + 2*b327 + 2*b71*b99 + 2*b71*
     b146 + 2*b146 - 2*b71*b167 - 2*b71*b331 + 2*b331 + 2*b72*b107 - 2*b72*b169
      + 4*b169 - 2*b72*b214 + 2*b72*b256 - 2*b256 - 2*b74*b108 + 2*b74*b130 + 2
     *b75*b97 + 2*b75*b204 - 2*b75*b223 + 2*b223 - 2*b76*b206 + 2*b206 - 2*b76*
     b355 + 2*b76*b358 + 2*b358 + 2*b77*b149 + 2*b149 - 2*b77*b160 + 4*b160 + 2
     *b77*b227 - 2*b77*b300 + 2*b300 - 2*b78*b162 + 2*b162 - 2*b78*b196 + 2*b78
     *b233 + 2*b78*b374 + 2*b374 + 2*b79*b347 + 2*b80*b103 + 2*b80*b188 - 2*b80
     *b205 + 2*b205 - 2*b81*b86 + 2*b81*b152 + 2*b152 - 2*b81*b156 + 4*b156 + 2
     *b81*b249 - 2*b249 + 2*b82*b162 - 2*b82*b179 - 2*b82*b180 - 2*b83*b289 + 2
     *b83*b316 - 2*b84*b125 + 2*b84*b316 + 2*b85*b206 - 2*b85*b271 - 2*b85*b294
      + 4*b294 + 2*b86*b131 + 2*b86*b274 - 2*b86*b275 - 2*b87*b129 + 2*b87*b289
      + 2*b88*b289 - 2*b88*b290 - 2*b89*b318 + 2*b318 - 2*b89*b321 + 2*b321 + 2
     *b90*b224 + 2*b224 - 2*b90*b268 + 4*b268 - 2*b90*b297 + 2*b90*b357 - 2*b91
     *b193 + 2*b91*b226 + 2*b91*b247 - 2*b247 - 2*b91*b360 + 2*b360 - 2*b92*b93
      + 2*b92*b94 - 2*b92*b170 + 2*b170 + 2*b92*b181 - 2*b181 + 2*b93*b117 - 2*
     b93*b236 + 4*b236 + 2*b94*b163 + 2*b163 - 2*b94*b171 + 4*b171 - 2*b94*b182
      + 2*b182 - 2*b95*b290 + 2*b96*b97 - 2*b96*b222 + 2*b96*b263 - 2*b96*b317
      + 2*b317 - 2*b97*b113 - 2*b97*b352 + 2*b352 + 2*b98*b110 - 2*b98*b175 + 2
     *b98*b210 - 2*b98*b327 + 2*b99*b210 - 2*b99*b211 + 4*b211 + 2*b100*b107 + 
     2*b100*b182 - 2*b100*b197 + 4*b197 - 2*b100*b374 + 2*b101*b121 - 2*b101*
     b182 - 2*b101*b258 + 4*b258 + 2*b102*b103 + 2*b102*b240 - 2*b102*b241 - 2*
     b102*b348 + 2*b348 - 2*b103*b108 - 2*b103*b174 - 2*b104*b127 + 2*b104*b166
      + 2*b104*b297 + 2*b105*b192 - 2*b105*b193 - 2*b105*b301 + 2*b105*b364 - 2
     *b364 + 2*b106*b364 - 2*b106*b365 + 2*b106*b367 + 2*b367 - 2*b106*b368 + 2
     *b368 - 2*b107*b340 + 4*b340 - 2*b107*b342 + 2*b108*b109 + 2*b108*b173 - 2
     *b109*b220 + 4*b220 - 2*b109*b349 + 2*b349 + 2*b110*b271 - 2*b110*b272 + 4
     *b272 - 2*b110*b298 - 2*b298 + 2*b111*b181 - 2*b111*b309 + 4*b309 - 2*b111
     *b312 + 2*b312 - 2*b112*b220 + 2*b113*b114 + 2*b113*b187 - 2*b114*b202 + 4
     *b202 - 2*b114*b318 + 2*b115*b116 + 2*b115*b189 + 2*b189 - 2*b115*b190 - 2
     *b115*b206 - 2*b116*b130 + 2*b116*b352 - 2*b117*b281 + 4*b281 - 2*b117*
     b283 + 2*b283 + 2*b118*b119 + 2*b118*b205 - 2*b118*b206 - 2*b118*b224 - 2*
     b119*b132 + 2*b119*b321 - 2*b119*b353 + 2*b120*b123 + 2*b120*b209 - 2*b209
      - 2*b120*b358 - 2*b120*b361 - 2*b361 - 2*b121*b255 + 4*b255 - 2*b121*b257
      + 2*b257 + 2*b122*b223 - 2*b122*b224 - 2*b122*b244 + 2*b244 + 2*b122*b292
      - 2*b292 + 2*b123*b324 - 2*b123*b325 - 2*b123*b327 + 2*b124*b227 + 2*b124
     *b361 - 2*b124*b362 + 2*b362 - 2*b124*b363 + 2*b125*b240 + 2*b125*b346 - 2
     *b125*b348 + 2*b126*b242 - 2*b126*b244 + 2*b126*b266 - 2*b266 - 2*b126*
     b268 + 2*b127*b247 + 2*b127*b295 - 2*b127*b296 + 2*b128*b249 + 2*b128*b328
      - 2*b328 - 2*b128*b329 + 2*b329 - 2*b128*b331 + 2*b129*b263 + 2*b129*b315
      - 2*b129*b317 + 2*b130*b266 - 2*b130*b351 + 2*b131*b298 - 2*b131*b300 + 2
     *b132*b292 - 2*b132*b320 + 2*b133*b134 - 2*b133*b314 - 2*b134*b135 + 2*
     b134*b377 + 2*b377 - 2*b134*b378 + 2*b135*b379 + 2*b379 + 2*b136*b341 - 2*
     b136*b344 - 2*b137*b265 - 2*b137*b354 - 2*b138*b242 - 2*b139*b141 + 4*b141
      - 2*b139*b143 - 2*b140*b223 - 2*b140*b267 - 2*b141*b205 - 2*b141*b243 - 2
     *b141*b267 - 2*b142*b194 + 2*b194 + 2*b142*b332 - 2*b332 - 2*b144*b189 - 2
     *b144*b243 - 2*b145*b194 - 2*b145*b212 + 2*b212 + 2*b145*b364 - 2*b146*
     b212 - 2*b146*b228 + 2*b228 - 2*b146*b250 - 2*b147*b150 + 2*b147 + 2*b150
      - 2*b147*b379 + 2*b148*b191 + 2*b148 + 2*b191 - 2*b148*b225 - 2*b148*b356
      + 2*b356 - 2*b148*b359 - 2*b149*b228 - 2*b149*b251 + 4*b251 - 2*b149*b275
      - 2*b150*b151 + 2*b151 + 2*b150*b198 + 2*b198 - 2*b150*b216 + 4*b216 - 2*
     b151*b154 + 2*b154 - 2*b152*b251 - 2*b152*b277 + 4*b277 - 2*b152*b302 - 2*
     b153*b162 + 2*b153 - 2*b153*b169 + 2*b153*b228 - 2*b153*b277 - 2*b154*b155
      + 2*b155 + 2*b154*b183 + 2*b183 - 2*b154*b237 + 4*b237 - 2*b155*b158 + 2*
     b158 - 2*b156*b277 - 2*b156*b304 + 4*b304 - 2*b156*b333 - 2*b157*b169 + 2*
     b157 - 2*b157*b179 + 2*b157*b212 - 2*b157*b304 - 2*b158*b159 + 2*b159 + 2*
     b158*b170 - 2*b158*b260 + 4*b260 - 2*b159*b163 - 2*b160*b304 - 2*b160*b335
      + 4*b335 - 2*b160*b365 - 2*b161*b179 + 2*b161 + 2*b161*b194 - 2*b161*b196
      - 2*b161*b335 - 2*b162*b369 + 4*b369 - 2*b163*b164 + 2*b164 - 2*b163*b285
      + 4*b285 - 2*b164*b171 - 2*b165*b166 - 2*b165*b208 + 2*b208 - 2*b165*b272
      - 2*b166*b192 - 2*b167*b335 - 2*b167*b367 - 2*b168*b196 - 2*b168*b214 - 2
     *b168*b367 - 2*b169*b231 - 2*b170*b184 + 4*b184 - 2*b170*b197 - 2*b171*
     b172 + 2*b172 - 2*b171*b377 - 2*b172*b184 - 2*b173*b220 - 2*b174*b189 - 2*
     b174*b265 - 2*b175*b177 - 2*b176*b211 + 2*b176*b330 - 2*b330 + 2*b176*b332
      - 2*b177*b332 - 2*b178*b214 - 2*b178*b230 + 2*b178*b368 + 2*b180*b181 - 2
     *b181*b215 + 4*b215 - 2*b182*b183 - 2*b183*b199 + 4*b199 - 2*b183*b215 - 2
     *b184*b185 + 2*b185 - 2*b184*b345 - 2*b185*b199 - 2*b187*b202 + 2*b188*
     b319 - 2*b188*b352 - 2*b189*b264 - 2*b190*b191 - 2*b190*b269 - 2*b191*b245
      - 2*b191*b323 + 4*b323 - 2*b194*b195 + 2*b195 - 2*b195*b230 - 2*b195*b254
      + 2*b195*b336 + 2*b336 - 2*b197*b198 - 2*b197*b235 + 2*b235 - 2*b198*b217
      - 2*b198*b236 - 2*b199*b200 + 2*b200 - 2*b199*b378 - 2*b200*b217 - 2*b201
     *b202 - 2*b202*b288 + 2*b288 + 2*b203*b318 - 2*b204*b321 - 2*b205*b291 - 2
     *b207*b208 + 2*b207*b209 - 2*b207*b245 - 2*b208*b211 + 2*b208*b274 - 2*
     b209*b211 + 2*b209*b248 - 2*b212*b213 + 2*b213 - 2*b213*b254 - 2*b213*b280
      + 2*b213*b305 + 2*b305 - 2*b215*b216 - 2*b215*b257 - 2*b216*b238 + 2*b238
      - 2*b216*b258 - 2*b217*b218 + 2*b218 - 2*b218*b238 - 2*b219*b220 + 2*b219
      - 2*b219*b347 + 2*b221*b349 - 2*b222*b291 - 2*b222*b349 - 2*b223*b321 - 2
     *b224*b324 - 2*b225*b271 + 2*b225*b361 + 2*b226*b227 - 2*b228*b229 + 2*
     b229 + 2*b229*b278 + 2*b278 - 2*b229*b280 - 2*b229*b307 + 4*b307 - 2*b230*
     b232 - 2*b231*b234 - 2*b231*b372 + 4*b372 - 2*b232*b234 - 2*b232*b307 + 2*
     b233*b235 - 2*b233*b340 - 2*b234*b235 - 2*b235*b284 + 4*b284 - 2*b236*b237
      - 2*b236*b283 - 2*b237*b261 + 2*b261 - 2*b237*b284 - 2*b238*b239 + 2*b239
      + 2*b238*b259 - 2*b239*b261 - 2*b241*b264 - 2*b242*b352 + 2*b243*b295 + 2
     *b244*b269 - 2*b244*b295 + 2*b245*b247 - 2*b246*b297 + 2*b246*b328 - 2*
     b247*b328 + 2*b248*b249 - 2*b249*b250 - 2*b250*b276 - 2*b251*b253 + 4*b253
      - 2*b251*b369 - 2*b252*b253 - 2*b252*b276 - 2*b252*b369 - 2*b253*b307 - 2
     *b253*b338 + 4*b338 - 2*b254*b255 - 2*b255*b310 - 2*b255*b338 + 2*b256*
     b257 - 2*b256*b309 + 2*b256*b341 - 2*b257*b313 + 4*b313 - 2*b258*b260 - 2*
     b258*b312 - 2*b259*b286 + 4*b286 - 2*b260*b286 - 2*b260*b313 - 2*b261*b262
      + 2*b262 + 2*b261*b344 - 2*b262*b286 + 2*b264*b266 + 2*b265*b293 + 2*b293
      - 2*b266*b293 + 2*b267*b270 - 2*b268*b270 - 2*b268*b293 - 2*b269*b272 - 2
     *b270*b272 + 2*b273*b298 + 2*b274*b361 - 2*b275*b303 - 2*b276*b278 - 2*
     b277*b279 + 4*b279 - 2*b278*b279 - 2*b278*b303 - 2*b279*b338 - 2*b279*b371
      + 4*b371 - 2*b280*b281 - 2*b281*b282 - 2*b281*b371 + 2*b282*b283 + 2*b282
     *b311 - 2*b283*b343 - 2*b284*b285 - 2*b284*b342 - 2*b285*b314 - 2*b285*
     b343 - 2*b286*b287 + 2*b287 - 2*b287*b314 - 2*b288*b290 + 2*b291*b292 - 2*
     b292*b322 - 2*b293*b294 - 2*b294*b296 - 2*b294*b322 + 2*b298*b330 + 2*b299
     *b300 + 2*b299*b328 - 2*b299*b362 - 2*b300*b302 + 2*b301*b334 + 2*b334 - 2
     *b302*b334 - 2*b303*b305 - 2*b304*b306 + 4*b306 - 2*b305*b306 - 2*b305*
     b334 - 2*b306*b308 - 2*b306*b371 - 2*b307*b309 - 2*b308*b309 - 2*b308*b337
      + 4*b337 + 2*b310*b312 + 2*b311*b376 + 2*b376 - 2*b312*b376 - 2*b313*b375
      - 2*b313*b377 + 2*b316*b317 - 2*b317*b319 - 2*b318*b320 - 2*b319*b320 - 2
     *b322*b323 - 2*b323*b325 - 2*b323*b353 + 2*b326*b329 - 2*b327*b329 - 2*
     b329*b330 + 2*b330*b331 - 2*b331*b333 + 2*b332*b366 + 2*b366 - 2*b333*b366
      - 2*b334*b336 - 2*b335*b337 - 2*b336*b337 - 2*b336*b366 - 2*b337*b339 - 2
     *b338*b340 - 2*b339*b340 - 2*b339*b370 + 4*b370 - 2*b343*b345 - 2*b344*
     b379 - 2*b345*b379 + 2*b347*b348 - 2*b348*b350 - 2*b349*b351 - 2*b350*b351
      - 2*b353*b355 + 2*b354*b356 - 2*b355*b356 - 2*b356*b358 + 2*b357*b360 - 2
     *b358*b360 + 2*b359*b362 - 2*b360*b362 - 2*b363*b364 - 2*b363*b365 - 2*
     b366*b368 - 2*b367*b370 - 2*b368*b370 - 2*b369*b372 - 2*b370*b372 - 2*b371
     *b373 - 2*b372*b373 - 2*b373*b374 - 2*b374*b375 - 2*b376*b377 - 2*b376*
     b378 - objvar =E= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% maximizing objvar;
