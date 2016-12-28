$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*          1        1        0        0        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        277        1      276        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        277        1      276        0
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
          ,b272,b273,b274,b275,b276,b277;

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
          ,b272,b273,b274,b275,b276,b277;

Equations  e1;


e1.. (-2*b2*b37) - 2*b2*b123 + 4*b123 + 2*b2*b124 + 2*b124 + 2*b2*b137 - 2*b137
      + 2*b3*b28 - 2*b3*b141 + 2*b141 + 2*b3*b218 + 2*b218 - 2*b3*b240 + 2*b240
      + 2*b4*b5 - 2*b4*b96 + 2*b96 + 2*b4*b247 + 2*b247 - 2*b4*b248 + 4*b248 - 
     2*b5*b14 - 2*b5*b97 + 2*b97 + 2*b5*b275 + 2*b275 + 2*b6*b7 + 2*b6*b52 - 2*
     b6*b106 + 2*b106 - 2*b6*b167 + 2*b167 + 2*b7*b36 - 2*b7*b99 + 2*b99 - 2*b7
     *b101 + 2*b101 - 2*b8*b19 + 2*b8*b96 + 2*b8*b220 - 2*b220 - 2*b8*b244 + 2*
     b244 + 2*b9*b10 - 2*b9*b11 + 2*b9*b42 - 2*b9*b109 + 2*b109 + 2*b10*b31 - 2
     *b10*b98 + 2*b98 - 2*b10*b99 + 2*b11*b51 + 2*b11*b53 - 2*b11*b103 + 2*b103
      + 2*b12*b13 - 2*b12*b135 + 2*b135 + 2*b12*b153 - 2*b153 - 2*b12*b170 + 2*
     b170 - 2*b13*b42 - 2*b13*b52 + 2*b13*b209 - 2*b209 - 2*b14*b28 + 2*b14*
     b242 - 2*b242 + 2*b14*b273 + 2*b273 + 2*b15*b23 - 2*b15*b133 + 4*b133 + 2*
     b15*b148 - 2*b148 - 2*b15*b252 + 2*b252 + 2*b16*b17 - 2*b16*b122 + 4*b122
      - 2*b16*b152 + 2*b152 + 2*b16*b171 - 4*b171 - 2*b17*b42 + 2*b17*b45 - 2*
     b17*b102 + 2*b102 - 2*b18*b153 + 2*b18*b171 + 2*b18*b191 + 2*b191 - 2*b18*
     b212 + 4*b212 + 2*b19*b64 + 2*b19*b179 + 2*b179 - 2*b19*b269 + 4*b269 - 2*
     b20*b141 - 2*b20*b244 + 2*b20*b245 + 2*b245 + 2*b20*b270 - 2*b270 + 2*b21*
     b164 - 4*b164 - 2*b21*b204 + 2*b204 + 2*b21*b224 - 2*b224 - 2*b21*b252 - 2
     *b22*b33 - 2*b22*b98 + 2*b22*b150 + 2*b150 + 2*b22*b163 - 2*b163 - 2*b23*
     b98 + 2*b23*b228 + 2*b228 - 2*b23*b255 + 4*b255 + 2*b24*b25 - 2*b24*b26 - 
     2*b24*b136 + 4*b136 + 2*b24*b190 - 4*b190 - 2*b25*b100 + 2*b100 - 2*b25*
     b102 + 2*b25*b232 + 2*b232 - 2*b26*b109 + 2*b26*b134 - 2*b134 + 2*b26*b257
      + 2*b257 + 2*b27*b55 - 2*b27*b135 + 2*b27*b190 - 2*b27*b236 + 4*b236 + 2*
     b28*b78 - 2*b28*b176 + 4*b176 - 2*b29*b30 - 2*b29*b148 + 2*b29*b184 - 4*
     b184 + 2*b29*b250 - 2*b250 + 2*b30*b225 - 2*b225 + 2*b31*b100 - 2*b31*b206
      + 4*b206 - 2*b31*b229 + 2*b229 + 2*b32*b47 - 2*b32*b122 + 2*b32*b210 - 2*
     b210 - 2*b32*b263 + 4*b263 + 2*b33*b34 - 2*b33*b35 + 2*b33*b205 - 4*b205
      - 2*b34*b162 + 4*b162 + 2*b35*b251 - 4*b251 + 2*b36*b102 - 2*b36*b186 + 2
     *b186 - 2*b36*b207 + 2*b207 + 2*b37*b48 - 2*b37*b193 + 4*b193 + 2*b37*b235
      - 2*b235 + 2*b38*b84 - 2*b38*b157 + 4*b157 - 2*b38*b217 + 4*b217 + 2*b38*
     b270 + 2*b39*b40 - 2*b39*b41 - 2*b39*b132 + 2*b132 + 2*b39*b226 - 2*b226
      - 2*b40*b147 + 4*b147 + 2*b41*b163 + 2*b42*b43 + 2*b43*b167 - 2*b43*b168
      + 2*b168 - 2*b43*b188 + 2*b188 + 2*b44*b45 - 2*b44*b115 + 2*b115 - 2*b44*
     b123 + 2*b44*b262 + 2*b262 - 2*b45*b90 - 2*b45*b208 + 2*b208 + 2*b46*b76
      + 2*b46*b104 + 2*b104 - 2*b46*b123 - 2*b46*b262 - 2*b47*b104 - 2*b47*b154
      - 2*b154 + 2*b47*b237 + 2*b237 - 2*b48*b104 + 2*b48*b113 + 2*b113 - 2*b48
     *b118 + 4*b118 + 2*b49*b80 - 2*b49*b140 + 4*b140 - 2*b49*b195 + 4*b195 + 2
     *b49*b242 + 2*b50*b79 - 2*b50*b147 - 2*b51*b89 + 2*b51*b252 - 2*b51*b254
      + 4*b254 + 2*b52*b53 - 2*b52*b170 - 2*b53*b151 + 2*b151 - 2*b53*b169 + 2*
     b169 + 2*b54*b73 + 2*b54*b105 + 2*b105 - 2*b54*b124 - 2*b54*b234 + 2*b234
      - 2*b55*b105 - 2*b55*b172 - 2*b172 + 2*b55*b213 + 2*b213 + 2*b56*b77 - 2*
     b56*b127 + 4*b127 - 2*b56*b175 + 4*b175 + 2*b56*b220 + 2*b57*b106 - 2*b57*
     b133 + 2*b57*b188 - 2*b57*b254 + 2*b58*b107 + 2*b107 - 2*b58*b116 + 4*b116
      + 2*b58*b154 - 2*b58*b211 + 2*b211 - 2*b59*b63 - 2*b59*b157 + 2*b59*b197
      - 2*b197 + 2*b59*b271 + 2*b271 + 2*b60*b68 - 2*b60*b114 + 2*b114 + 2*b60*
     b129 + 2*b129 - 2*b60*b143 + 4*b143 - 2*b61*b85 - 2*b61*b89 + 2*b61*b205
      + 2*b61*b250 - 2*b62*b66 + 2*b62*b110 + 2*b110 - 2*b62*b112 + 4*b112 + 2*
     b62*b172 + 2*b63*b64 - 2*b63*b111 + 2*b111 + 2*b63*b266 + 2*b266 - 2*b64*
     b140 - 2*b64*b141 - 2*b65*b87 - 2*b65*b92 + 2*b65*b184 + 2*b65*b224 + 2*
     b66*b90 + 2*b66*b190 - 2*b66*b191 + 2*b67*b71 - 2*b67*b128 + 4*b128 + 2*
     b67*b130 + 2*b130 - 2*b67*b144 + 4*b144 - 2*b68*b130 - 2*b69*b133 - 2*b69*
     b169 + 2*b69*b186 + 2*b69*b256 + 2*b256 - 2*b70*b122 + 2*b70*b153 + 2*b70*
     b208 - 2*b70*b259 + 4*b259 + 2*b71*b74 - 2*b71*b75 - 2*b71*b119 + 2*b119
      + 2*b72*b168 - 2*b72*b206 + 2*b72*b229 - 2*b72*b257 + 2*b73*b135 - 2*b73*
     b136 - 2*b73*b235 + 2*b74*b77 - 2*b74*b128 - 2*b74*b271 + 2*b75*b80 + 2*
     b75*b141 - 2*b75*b142 + 4*b142 + 2*b76*b214 + 2*b214 - 2*b76*b263 - 2*b76*
     b265 + 2*b265 - 2*b77*b241 + 4*b241 - 2*b77*b243 + 2*b243 + 2*b78*b84 - 2*
     b78*b128 - 2*b78*b158 + 4*b158 + 2*b79*b132 - 2*b79*b146 + 2*b146 - 2*b79*
     b149 + 4*b149 - 2*b80*b219 + 4*b219 - 2*b80*b221 + 2*b221 + 2*b81*b169 - 2
     *b81*b188 - 2*b81*b231 - 2*b231 + 2*b81*b260 - 4*b260 + 2*b82*b154 + 2*b82
     *b260 - 2*b82*b261 + 2*b261 - 2*b82*b262 + 2*b83*b95 + 2*b83*b174 + 2*b174
      - 2*b83*b237 - 2*b83*b264 + 2*b264 - 2*b84*b196 + 4*b196 - 2*b84*b198 + 2
     *b198 + 2*b85*b163 + 2*b86*b172 + 2*b86*b231 - 2*b86*b232 - 2*b86*b234 + 2
     *b87*b251 + 2*b88*b89 + 2*b88*b184 - 2*b88*b186 - 2*b88*b206 + 2*b89*b251
      + 2*b90*b209 - 2*b90*b211 + 2*b91*b92 + 2*b91*b205 - 2*b91*b206 - 2*b91*
     b227 + 4*b227 + 2*b92*b225 - 2*b92*b253 + 2*b253 + 2*b93*b94 - 2*b93*b223
      + 2*b223 + 2*b94*b274 + 2*b274 - 2*b94*b275 - 2*b94*b277 + 2*b277 + 2*b95
     *b240 - 2*b95*b265 - 2*b95*b268 + 4*b268 - 2*b96*b97 - 2*b96*b200 + 2*b200
      - 2*b97*b178 + 4*b178 + 2*b97*b197 + 2*b98*b164 - 2*b99*b132 + 2*b99*b184
      - 2*b100*b228 - 2*b100*b258 + 2*b258 - 2*b101*b149 - 2*b101*b167 + 2*b101
     *b205 - 2*b102*b255 - 2*b103*b165 + 4*b165 - 2*b103*b167 + 2*b103*b226 - 2
     *b104*b117 + 2*b117 - 2*b105*b117 - 2*b105*b125 + 4*b125 - 2*b106*b152 - 2
     *b106*b170 - 2*b107*b125 - 2*b107*b138 + 4*b138 - 2*b107*b191 - 2*b108*
     b120 + 2*b108 + 2*b120 - 2*b108*b248 - 2*b109*b152 + 2*b109*b187 - 2*b187
      - 2*b110*b138 - 2*b110*b155 + 4*b155 - 2*b110*b212 + 2*b111*b117 - 2*b111
     *b127 - 2*b111*b138 - 2*b112*b155 - 2*b112*b173 + 4*b173 - 2*b112*b236 - 2
     *b113*b127 - 2*b113*b140 - 2*b113*b155 - 2*b114*b144 - 2*b115*b135 + 2*
     b115*b230 + 2*b230 - 2*b115*b258 - 2*b116*b173 - 2*b116*b192 + 4*b192 - 2*
     b116*b263 - 2*b117*b126 + 4*b126 - 2*b118*b140 - 2*b118*b157 - 2*b118*b173
      + 2*b119*b120 - 2*b119*b142 - 2*b119*b160 + 4*b160 - 2*b120*b121 + 2*b121
      - 2*b120*b159 + 4*b159 - 2*b121*b160 - 2*b122*b123 - 2*b124*b192 - 2*b124
     *b214 - 2*b125*b139 + 4*b139 - 2*b125*b266 - 2*b126*b157 - 2*b126*b175 - 2
     *b126*b192 - 2*b127*b176 - 2*b128*b129 - 2*b129*b158 - 2*b129*b182 + 4*
     b182 - 2*b130*b131 + 2*b131 - 2*b130*b181 + 4*b181 - 2*b131*b182 - 2*b132*
     b150 - 2*b133*b150 - 2*b134*b136 + 2*b134*b171 + 2*b134*b189 + 2*b189 - 2*
     b136*b137 + 2*b137*b233 - 2*b233 + 2*b137*b235 - 2*b138*b156 + 2*b156 - 2*
     b139*b175 - 2*b139*b195 - 2*b139*b214 - 2*b142*b143 - 2*b142*b179 - 2*b143
     *b180 + 4*b180 - 2*b143*b202 + 4*b202 - 2*b144*b145 + 2*b145 - 2*b144*b201
      + 4*b201 - 2*b145*b202 - 2*b146*b162 - 2*b147*b149 - 2*b147*b252 + 2*b148
     *b166 + 2*b166 + 2*b148*b251 - 2*b149*b166 - 2*b150*b151 - 2*b151*b166 + 2
     *b151*b187 + 2*b152*b260 + 2*b153*b154 - 2*b155*b174 - 2*b156*b195 - 2*
     b156*b217 + 2*b156*b265 - 2*b158*b159 - 2*b158*b198 - 2*b159*b199 + 4*b199
      - 2*b159*b223 - 2*b160*b161 + 2*b161 - 2*b160*b274 - 2*b161*b223 - 2*b162
     *b165 - 2*b162*b226 - 2*b163*b165 + 2*b164*b185 + 2*b185 + 2*b164*b225 - 2
     *b165*b185 - 2*b166*b168 - 2*b168*b185 - 2*b169*b258 + 2*b170*b231 + 2*
     b171*b172 - 2*b173*b194 + 2*b194 - 2*b174*b217 - 2*b174*b239 + 4*b239 - 2*
     b175*b177 + 4*b177 - 2*b176*b178 - 2*b176*b268 - 2*b177*b178 - 2*b177*b239
      - 2*b177*b270 - 2*b178*b179 - 2*b179*b180 - 2*b180*b181 - 2*b180*b221 - 2
     *b181*b222 + 4*b222 - 2*b181*b247 - 2*b182*b183 + 2*b183 - 2*b182*b246 + 2
     *b246 - 2*b183*b247 - 2*b185*b186 + 2*b187*b207 - 2*b187*b227 - 2*b188*
     b189 - 2*b189*b207 - 2*b189*b209 + 2*b190*b260 - 2*b191*b213 - 2*b192*b216
      + 4*b216 - 2*b193*b213 - 2*b193*b216 - 2*b193*b266 + 2*b194*b215 + 2*b215
      - 2*b194*b239 - 2*b194*b267 + 4*b267 - 2*b195*b196 - 2*b196*b242 - 2*b196
     *b267 + 2*b197*b198 - 2*b197*b241 - 2*b198*b199 - 2*b199*b201 - 2*b199*
     b243 + 2*b200*b223 - 2*b200*b244 - 2*b200*b276 + 4*b276 - 2*b201*b245 - 2*
     b201*b276 - 2*b202*b203 + 2*b203 - 2*b202*b275 - 2*b203*b276 - 2*b204*b225
      - 2*b207*b208 - 2*b208*b229 + 2*b209*b233 + 2*b210*b211 + 2*b210*b231 - 2
     *b210*b261 - 2*b211*b212 - 2*b212*b237 - 2*b213*b215 - 2*b214*b238 + 4*
     b238 - 2*b215*b237 - 2*b215*b238 - 2*b216*b218 - 2*b216*b267 - 2*b217*b219
      - 2*b218*b219 - 2*b218*b238 - 2*b219*b220 + 2*b220*b221 - 2*b221*b222 - 2
     *b222*b272 + 2*b272 - 2*b222*b274 + 2*b226*b253 - 2*b227*b228 - 2*b227*
     b253 - 2*b228*b256 - 2*b229*b230 - 2*b230*b232 - 2*b230*b256 - 2*b232*b233
      + 2*b233*b234 - 2*b234*b236 + 2*b235*b264 - 2*b236*b264 - 2*b238*b240 - 2
     *b239*b241 - 2*b240*b241 + 2*b242*b243 - 2*b243*b245 + 2*b244*b246 - 2*
     b245*b246 - 2*b246*b248 - 2*b247*b249 + 2*b249 - 2*b248*b249 - 2*b253*b254
      - 2*b254*b255 - 2*b255*b257 - 2*b256*b259 - 2*b257*b259 + 2*b258*b261 - 2
     *b259*b261 - 2*b262*b263 - 2*b264*b265 - 2*b266*b268 - 2*b267*b269 - 2*
     b268*b269 - 2*b269*b271 + 2*b270*b272 - 2*b271*b272 - 2*b272*b273 - 2*b273
     *b274 - 2*b273*b275 - 2*b276*b277 - objvar =E= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% maximizing objvar;
