$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*         33        2        0       31        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*         61       31       30        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        151      121       30        0
*
*  Solve m using MIQCP minimizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,b32,b33,b34,b35
          ,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,b51,b52
          ,b53,b54,b55,b56,b57,b58,b59,b60,b61;

Positive Variables  x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17
          ,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31;

Binary Variables  b32,b33,b34,b35,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46
          ,b47,b48,b49,b50,b51,b52,b53,b54,b55,b56,b57,b58,b59,b60,b61;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33;


e1.. 26.4414*x2*x2 + 31.8776*x2*x3 + 34.2334*x2*x4 + 32.261*x2*x5 + 34.5232*x2*
     x6 + 37.1318*x2*x7 + 27.5326*x2*x8 + 32.9178*x2*x9 + 29.9458*x2*x10 + 
     35.2648*x2*x11 + 29.8428*x2*x12 + 14.47452*x2*x13 + 31.8688*x2*x14 + 
     25.5858*x2*x15 + 29.7152*x2*x16 + 41.7352*x2*x17 + 34.8416*x2*x18 + 8320.7
     *x2*x19 + 5388.42*x2*x20 + 5083.5*x2*x21 + 8382.5*x2*x22 + 8117.14*x2*x23
      + 8309.6*x2*x24 + 8409.98*x2*x25 + 7871.86*x2*x26 + 6816.86*x2*x27 + 
     8170.36*x2*x28 + 8090.94*x2*x29 + 8130.26*x2*x30 + 8130.36*x2*x31 + 
     22.0241*x3*x3 + 29.9002*x3*x4 + 39.3944*x3*x5 + 26.9506*x3*x6 + 29.231*x3*
     x7 + 23.4114*x3*x8 + 22.9796*x3*x9 + 29.5198*x3*x10 + 31.7528*x3*x11 + 
     30.5358*x3*x12 + 32.2672*x3*x13 + 29.1982*x3*x14 + 32.3038*x3*x15 + 
     30.0074*x3*x16 + 27.417*x3*x17 + 29.333*x3*x18 + 8322.86*x3*x19 + 5396.8*
     x3*x20 + 5092.02*x3*x21 + 8389.04*x3*x22 + 8117.14*x3*x23 + 8309.2*x3*x24
      + 8397.86*x3*x25 + 7873.6*x3*x26 + 6817.3*x3*x27 + 8173.16*x3*x28 + 
     8095.94*x3*x29 + 8131.76*x3*x30 + 8126.96*x3*x31 + 16.3118*x4*x4 + 31.2434
     *x4*x5 + 30.1208*x4*x6 + 27.994*x4*x7 + 30.737*x4*x8 + 30.0892*x4*x9 + 
     30.5646*x4*x10 + 30.509*x4*x11 + 29.3786*x4*x12 + 27.1568*x4*x13 + 31.6718
     *x4*x14 + 30.978*x4*x15 + 30.2282*x4*x16 + 33.5678*x4*x17 + 33.0392*x4*x18
      + 8321.18*x4*x19 + 5396.72*x4*x20 + 5085.76*x4*x21 + 8381.94*x4*x22 + 
     8117.14*x4*x23 + 8308.94*x4*x24 + 8410.84*x4*x25 + 7874.54*x4*x26 + 
     6820.88*x4*x27 + 8172.46*x4*x28 + 8093.72*x4*x29 + 8130.56*x4*x30 + 
     8126.84*x4*x31 + 25.5309*x5*x5 + 25.9898*x5*x6 + 27.3908*x5*x7 + 33.5668*
     x5*x8 + 29.642*x5*x9 + 31.985*x5*x10 + 32.1882*x5*x11 + 25.8068*x5*x12 + 
     31.8534*x5*x13 + 30.4702*x5*x14 + 33.1082*x5*x15 + 26.096*x5*x16 + 25.577*
     x5*x17 + 31.3224*x5*x18 + 8324.12*x5*x19 + 5397.76*x5*x20 + 5084.56*x5*x21
      + 8385.4*x5*x22 + 8117.14*x5*x23 + 8310.3*x5*x24 + 8387*x5*x25 + 7872.5*
     x5*x26 + 6816.12*x5*x27 + 8171.74*x5*x28 + 8092.22*x5*x29 + 8130.66*x5*x30
      + 8134.7*x5*x31 + 23.4963*x6*x6 + 34.542*x6*x7 + 44.8138*x6*x8 + 26.6146*
     x6*x9 + 24.2472*x6*x10 + 32.4088*x6*x11 + 33.3554*x6*x12 + 23.5842*x6*x13
      + 29.9674*x6*x14 + 25.189*x6*x15 + 29.5992*x6*x16 + 40.8414*x6*x17 + 
     29.6818*x6*x18 + 8320.02*x6*x19 + 5386.36*x6*x20 + 5078.76*x6*x21 + 
     8375.68*x6*x22 + 8117.14*x6*x23 + 8307.76*x6*x24 + 8412.56*x6*x25 + 
     7872.76*x6*x26 + 6814.86*x6*x27 + 8168.56*x6*x28 + 8093.46*x6*x29 + 
     8131.58*x6*x30 + 8124.6*x6*x31 + 30.1236*x7*x7 + 25.123*x7*x8 + 35.3596*x7
     *x9 + 35.6262*x7*x10 + 30.3534*x7*x11 + 34.5902*x7*x12 + 22.439*x7*x13 + 
     27.6916*x7*x14 + 25.4104*x7*x15 + 18.33206*x7*x16 + 34.2058*x7*x17 + 
     33.5522*x7*x18 + 8321.06*x7*x19 + 5392.64*x7*x20 + 5077.68*x7*x21 + 8382.1
     *x7*x22 + 8117.16*x7*x23 + 8305.02*x7*x24 + 8401.16*x7*x25 + 7869.96*x7*
     x26 + 6805.54*x7*x27 + 8163.3*x7*x28 + 8091.16*x7*x29 + 8128.72*x7*x30 + 
     8112.58*x7*x31 + 35.6533*x8*x8 + 40.488*x8*x9 + 24.9396*x8*x10 + 29.2916*
     x8*x11 + 27.1116*x8*x12 + 37.2278*x8*x13 + 22.4802*x8*x14 + 32.2382*x8*x15
      + 20.5754*x8*x16 + 31.2806*x8*x17 + 29.495*x8*x18 + 8321.26*x8*x19 + 
     5391.26*x8*x20 + 5073.18*x8*x21 + 8368.34*x8*x22 + 8117.14*x8*x23 + 
     8307.24*x8*x24 + 8403.6*x8*x25 + 7873.98*x8*x26 + 6818.14*x8*x27 + 8167.7*
     x8*x28 + 8089.98*x8*x29 + 8133*x8*x30 + 8134.7*x8*x31 + 35.0777*x9*x9 + 
     40.9214*x9*x10 + 28.6906*x9*x11 + 28.6508*x9*x12 + 29.3594*x9*x13 + 
     25.7026*x9*x14 + 26.2662*x9*x15 + 15.20968*x9*x16 + 23.9418*x9*x17 + 
     32.741*x9*x18 + 8322.66*x9*x19 + 5405.4*x9*x20 + 5061.54*x9*x21 + 8369.84*
     x9*x22 + 8117.14*x9*x23 + 8306.5*x9*x24 + 8417*x9*x25 + 7877.68*x9*x26 + 
     6817.08*x9*x27 + 8168.94*x9*x28 + 8093.42*x9*x29 + 8129.78*x9*x30 + 
     8127.12*x9*x31 + 31.9607*x10*x10 + 19.92378*x10*x11 + 33.5336*x10*x12 + 
     33.465*x10*x13 + 35.0802*x10*x14 + 35.0612*x10*x15 + 29.7026*x10*x17 + 
     26.8764*x10*x18 + 8321.72*x10*x19 + 5421.66*x10*x20 + 5080.32*x10*x21 + 
     8381.42*x10*x22 + 8117.12*x10*x23 + 8308.5*x10*x24 + 8417.88*x10*x25 + 
     7871.7*x10*x26 + 6814.52*x10*x27 + 8168.74*x10*x28 + 8100.38*x10*x29 + 
     8130.22*x10*x30 + 8122.34*x10*x31 + 20.1257*x11*x11 + 30.861*x11*x12 + 
     24.2044*x11*x13 + 30.3362*x11*x14 + 25.174*x11*x15 + 36.1454*x11*x16 + 
     35.6652*x11*x17 + 30.2324*x11*x18 + 8320.52*x11*x19 + 5385.7*x11*x20 + 
     5082.12*x11*x21 + 8382.5*x11*x22 + 8117.14*x11*x23 + 8308.4*x11*x24 + 
     8403.74*x11*x25 + 7876.4*x11*x26 + 6820.34*x11*x27 + 8173.3*x11*x28 + 
     8090.22*x11*x29 + 8129.54*x11*x30 + 8124.98*x11*x31 + 18.3645*x12*x12 + 
     30.8412*x12*x13 + 33.4266*x12*x14 + 23.0976*x12*x15 + 21.218*x12*x16 + 
     35.4894*x12*x17 + 29.6194*x12*x18 + 8319.34*x12*x19 + 5396.24*x12*x20 + 
     5081.36*x12*x21 + 8384.12*x12*x22 + 8117.14*x12*x23 + 8307.22*x12*x24 + 
     8411.18*x12*x25 + 7875.26*x12*x26 + 6822.32*x12*x27 + 8171.88*x12*x28 + 
     8095.86*x12*x29 + 8131.04*x12*x30 + 8119.94*x12*x31 + 28.757*x13*x13 + 
     23.403*x13*x14 + 36.9292*x13*x15 + 18.74142*x13*x16 + 14.9144*x13*x17 + 
     26.3782*x13*x18 + 8318.98*x13*x19 + 5411.32*x13*x20 + 5088.22*x13*x21 + 
     8381.86*x13*x22 + 8117.16*x13*x23 + 8307.38*x13*x24 + 8407.48*x13*x25 + 
     7874.62*x13*x26 + 6821.04*x13*x27 + 8176.04*x13*x28 + 8095.48*x13*x29 + 
     8134.18*x13*x30 + 8124.04*x13*x31 + 24.7185*x14*x14 + 16.44096*x14*x15 + 
     24.8258*x14*x16 + 37.9924*x14*x17 + 38.1424*x14*x18 + 8319.42*x14*x19 + 
     5397.54*x14*x20 + 5082.36*x14*x21 + 8381.64*x14*x22 + 8117.12*x14*x23 + 
     8311.64*x14*x24 + 8404.86*x14*x25 + 7877.36*x14*x26 + 6825.42*x14*x27 + 
     8174.28*x14*x28 + 8093.88*x14*x29 + 8130.72*x14*x30 + 8122.72*x14*x31 + 
     28.4836*x15*x15 + 35.0394*x15*x16 + 22.7462*x15*x17 + 21.448*x15*x18 + 
     8323.58*x15*x19 + 5411.12*x15*x20 + 5096.58*x15*x21 + 8382.68*x15*x22 + 
     8117.14*x15*x23 + 8307.82*x15*x24 + 8418.42*x15*x25 + 7869.78*x15*x26 + 
     6804.66*x15*x27 + 8169.82*x15*x28 + 8095.46*x15*x29 + 8130.96*x15*x30 + 
     8122.96*x15*x31 + 51.4822*x16*x16 + 21.1406*x16*x17 + 23.5732*x16*x18 + 
     8323.82*x16*x19 + 5395.76*x16*x20 + 5101*x16*x21 + 8369.8*x16*x22 + 
     8117.14*x16*x23 + 8311.28*x16*x24 + 8431.86*x16*x25 + 7876.06*x16*x26 + 
     6819.28*x16*x27 + 8172.42*x16*x28 + 8087.98*x16*x29 + 8132.9*x16*x30 + 
     8132.62*x16*x31 + 26.8095*x17*x17 + 31.5364*x17*x18 + 8318.82*x17*x19 + 
     5383.72*x17*x20 + 5079.92*x17*x21 + 8384.88*x17*x22 + 8117.14*x17*x23 + 
     8307.42*x17*x24 + 8407.7*x17*x25 + 7873.84*x17*x26 + 6822.88*x17*x27 + 
     8170*x17*x28 + 8093.32*x17*x29 + 8129.56*x17*x30 + 8118.7*x17*x31 + 
     25.6128*x18*x18 + 8320.14*x18*x19 + 5383.62*x18*x20 + 5082.58*x18*x21 + 
     8385.26*x18*x22 + 8117.14*x18*x23 + 8309.82*x18*x24 + 8398.9*x18*x25 + 
     7876.48*x18*x26 + 6818.38*x18*x27 + 8174.48*x18*x28 + 8092.52*x18*x29 + 
     8127.9*x18*x30 + 8125.68*x18*x31 + 3883.84*x19*x19 + 8215.38*x19*x20 + 
     8176.4*x19*x21 + 7718.38*x19*x22 + 8118.3*x19*x23 + 8096.52*x19*x24 + 
     8083.22*x19*x25 + 8186.64*x19*x26 + 8269.56*x19*x27 + 8261.4*x19*x28 + 
     8098.14*x19*x29 + 8177.34*x19*x30 + 8125.16*x19*x31 + 3282.11*x20*x20 + 
     7214.14*x20*x21 + 8366.94*x20*x22 + 8117.46*x20*x23 + 8255.68*x20*x24 + 
     8126.42*x20*x25 + 8115.1*x20*x26 + 7744.02*x20*x27 + 8114.26*x20*x28 + 
     8036*x20*x29 + 8028.92*x20*x30 + 7825.92*x20*x31 + 3017.64*x21*x21 + 
     8205.88*x21*x22 + 8118.62*x21*x23 + 8148.48*x21*x24 + 8308.04*x21*x25 + 
     7894.36*x21*x26 + 7498.9*x21*x27 + 8223.16*x21*x28 + 8096.04*x21*x29 + 
     8121.44*x21*x30 + 8080.6*x21*x31 + 3690.22*x22*x22 + 8118.82*x22*x23 + 
     8247.3*x22*x24 + 7949.64*x22*x25 + 8103.4*x22*x26 + 8290.14*x22*x27 + 
     8349.2*x22*x28 + 8152.04*x22*x29 + 8152.82*x22*x30 + 8203.68*x22*x31 + 
     4058.96*x23*x23 + 8117.66*x23*x24 + 8119.28*x23*x25 + 8118.12*x23*x26 + 
     8117.38*x23*x27 + 8117.28*x23*x28 + 8117.82*x23*x29 + 8117.92*x23*x30 + 
     8117.92*x23*x31 + 3995.68*x24*x24 + 8252.62*x24*x25 + 8175.22*x24*x26 + 
     8108.28*x24*x27 + 8093.28*x24*x28 + 8111.8*x24*x29 + 8161.34*x24*x30 + 
     8158.9*x24*x31 + 3741.05*x25*x25 + 8086.5*x25*x26 + 8304.56*x25*x27 + 
     8205.82*x25*x28 + 8139.52*x25*x29 + 8077.64*x25*x30 + 8040.3*x25*x31 + 
     4015.67*x26*x26 + 8097.72*x26*x27 + 8087.92*x26*x28 + 8118.78*x26*x29 + 
     8097.48*x26*x30 + 8097.36*x26*x31 + 3654.48*x27*x27 + 8055.12*x27*x28 + 
     8170.42*x27*x29 + 8056.84*x27*x30 + 8365.58*x27*x31 + 3944.96*x28*x28 + 
     8080.56*x28*x29 + 8069.68*x28*x30 + 8047.32*x28*x31 + 4043.1*x29*x29 + 
     8108.72*x29*x30 + 8035.24*x29*x31 + 4035.74*x30*x30 + 8086.48*x30*x31 + 
     3930.03*x31*x31 - objvar =E= 0;

e2..    x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14
      + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26
      + x27 + x28 + x29 + x30 + x31 =E= 1;

e3..    b32 + b33 + b34 + b35 + b36 + b37 + b38 + b39 + b40 + b41 + b42 + b43
      + b44 + b45 + b46 + b47 + b48 + b49 + b50 + b51 + b52 + b53 + b54 + b55
      + b56 + b57 + b58 + b59 + b60 + b61 =L= 5;

e4..    x2 - b32 =L= 0;

e5..    x3 - b33 =L= 0;

e6..    x4 - b34 =L= 0;

e7..    x5 - b35 =L= 0;

e8..    x6 - b36 =L= 0;

e9..    x7 - b37 =L= 0;

e10..    x8 - b38 =L= 0;

e11..    x9 - b39 =L= 0;

e12..    x10 - b40 =L= 0;

e13..    x11 - b41 =L= 0;

e14..    x12 - b42 =L= 0;

e15..    x13 - b43 =L= 0;

e16..    x14 - b44 =L= 0;

e17..    x15 - b45 =L= 0;

e18..    x16 - b46 =L= 0;

e19..    x17 - b47 =L= 0;

e20..    x18 - b48 =L= 0;

e21..    x19 - b49 =L= 0;

e22..    x20 - b50 =L= 0;

e23..    x21 - b51 =L= 0;

e24..    x22 - b52 =L= 0;

e25..    x23 - b53 =L= 0;

e26..    x24 - b54 =L= 0;

e27..    x25 - b55 =L= 0;

e28..    x26 - b56 =L= 0;

e29..    x27 - b57 =L= 0;

e30..    x28 - b58 =L= 0;

e31..    x29 - b59 =L= 0;

e32..    x30 - b60 =L= 0;

e33..    x31 - b61 =L= 0;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set MIQCP $set MIQCP MIQCP
Solve m using %MIQCP% minimizing objvar;
