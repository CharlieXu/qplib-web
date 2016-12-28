$offlisting
*  
*  Equation counts
*      Total        E        G        L        N        X        C        B
*          2        2        0        0        0        0        0        0
*  
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*         51       51        0        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*  
*  Nonzero counts
*      Total    const       NL      DLL
*        101       51       50        0
*
*  Solve m using QCP minimizing objvar;


Variables  objvar,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18
          ,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35
          ,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51;

Positive Variables  x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17
          ,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34
          ,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51;

Equations  e1,e2;


e1.. 0.39309*x2*x2 - 9.9178*x2*x3 - 9.81*x2*x4 - 3.6136*x2*x5 - 10.0232*x2*x6
      - 5.7558*x2*x7 + 5.5884*x2*x8 + 4.3044*x2*x9 - 3.7034*x2*x10 - 17.6588*x2
     *x11 + 9.7602*x2*x12 - 11.2742*x2*x13 + 18.8146*x2*x14 - 8.4322*x2*x15 - 
     2.8762*x2*x16 - 1.34424*x2*x17 - 16.686*x2*x18 + 6.3178*x2*x19 - 7.7816*x2
     *x20 - 9.67*x2*x21 - 15.1444*x2*x22 - 15.0034*x2*x23 + 3.767*x2*x24 - 
     16.4732*x2*x25 + 11.34*x2*x26 + 19.834*x2*x27 - 6.2614*x2*x28 + 14.8806*x2
     *x29 - 15.9298*x2*x30 - 4.3036*x2*x31 - 10.5894*x2*x32 + 12.193*x2*x33 + 
     11.3142*x2*x34 - 10.1002*x2*x35 + 6.432*x2*x36 - 18.2532*x2*x37 - 3.1332*
     x2*x38 - 4.979*x2*x39 + 8.8848*x2*x40 - 7.3828*x2*x41 + 15.6134*x2*x42 + 
     14.7122*x2*x43 - 11.6524*x2*x44 - 0.014652*x2*x45 - 7.9088*x2*x46 - 
     11.4886*x2*x47 - 14.0428*x2*x48 + 21.45*x2*x49 + 0.05232*x2*x50 - 16.3438*
     x2*x51 + 0.29649*x3*x3 + 9.0438*x3*x4 - 8.1028*x3*x5 - 5.8584*x3*x6 + 
     7.9276*x3*x7 - 6.166*x3*x8 - 0.85136*x3*x9 - 12.9198*x3*x10 + 13.5222*x3*
     x11 + 6.2262*x3*x12 - 11.3934*x3*x13 + 13.795*x3*x14 - 5.3006*x3*x15 - 
     1.86194*x3*x16 - 13.2236*x3*x17 - 2.4308*x3*x18 - 6.6468*x3*x19 - 8.3908*
     x3*x20 - 12.6066*x3*x21 - 9.0362*x3*x22 + 5.389*x3*x23 - 7.1376*x3*x24 + 
     7.7364*x3*x25 - 0.6206*x3*x26 + 0.5364*x3*x27 - 18.6334*x3*x28 + 1.9392*x3
     *x29 - 18.381*x3*x30 + 1.16208*x3*x31 - 18.1004*x3*x32 + 15.304*x3*x33 - 
     16.5498*x3*x34 - 17.9184*x3*x35 + 7.61*x3*x36 - 8.387*x3*x37 - 13.8314*x3*
     x38 - 6.6276*x3*x39 + 0.079852*x3*x40 - 2.558*x3*x41 - 17.8412*x3*x42 - 
     3.8138*x3*x43 - 11.6122*x3*x44 - 14.5282*x3*x45 - 6.5418*x3*x46 + 7.561*x3
     *x47 - 8.8294*x3*x48 + 10.801*x3*x49 - 8.6806*x3*x50 - 7.7654*x3*x51 + 
     1.2856*x4*x4 - 6.7096*x4*x5 - 11.5302*x4*x6 - 10.91*x4*x7 - 4.6962*x4*x8
      - 10.9964*x4*x9 + 17.2336*x4*x10 - 5.578*x4*x11 - 11.7072*x4*x12 + 1.6231
     *x4*x13 - 14.4796*x4*x14 - 0.049094*x4*x15 - 0.40828*x4*x16 + 18.7368*x4*
     x17 + 13.9576*x4*x18 - 8.8356*x4*x19 + 11.0876*x4*x20 + 0.177644*x4*x21 - 
     2.5504*x4*x22 + 12.5614*x4*x23 - 6.153*x4*x24 + 14.318*x4*x25 - 11.259*x4*
     x26 - 12.5342*x4*x27 - 2.8174*x4*x28 + 11.3856*x4*x29 - 1.02156*x4*x30 - 
     3.1622*x4*x31 + 20.716*x4*x32 - 2.2236*x4*x33 - 8.7266*x4*x34 + 19.0864*x4
     *x35 - 2.5608*x4*x36 + 3.3664*x4*x37 - 10.735*x4*x38 - 7.1168*x4*x39 + 
     13.7786*x4*x40 - 14.1752*x4*x41 - 7.3182*x4*x42 - 7.0266*x4*x43 - 11.3436*
     x4*x44 - 6.0736*x4*x45 - 4.095*x4*x46 - 5.011*x4*x47 - 4.4472*x4*x48 + 
     3.8636*x4*x49 - 12.4694*x4*x50 - 12.7386*x4*x51 + 0.23158*x5*x5 - 1.30116*
     x5*x6 - 5.155*x5*x7 - 0.058706*x5*x8 - 19.0154*x5*x9 + 16.8896*x5*x10 + 
     0.4074*x5*x11 - 3.7938*x5*x12 + 7.3318*x5*x13 - 14.332*x5*x14 - 17.847*x5*
     x15 - 5.182*x5*x16 + 8.382*x5*x17 + 4.0988*x5*x18 - 13.493*x5*x19 + 
     1.09756*x5*x20 - 10.098*x5*x21 - 4.476*x5*x22 - 11.094*x5*x23 - 0.4512*x5*
     x24 + 16.2014*x5*x25 - 8.8746*x5*x26 + 13.6112*x5*x27 - 17.078*x5*x28 - 
     16.5542*x5*x29 - 9.5126*x5*x30 + 12.5202*x5*x31 - 15.724*x5*x32 - 6.0318*
     x5*x33 - 4.8412*x5*x34 - 15.0202*x5*x35 + 0.040822*x5*x36 - 16.4174*x5*x37
      + 17.2162*x5*x38 + 0.5987*x5*x39 + 10.0798*x5*x40 - 14.1046*x5*x41 - 
     5.1742*x5*x42 - 4.9402*x5*x43 - 3.2472*x5*x44 - 4.381*x5*x45 + 10.8062*x5*
     x46 - 5.0672*x5*x47 - 13.022*x5*x48 - 15.1166*x5*x49 - 7.809*x5*x50 - 
     10.5136*x5*x51 + 1.7996*x6*x6 - 8.8372*x6*x7 + 0.190416*x6*x8 + 21.966*x6*
     x9 - 16.2166*x6*x10 - 4.1016*x6*x11 - 10.242*x6*x12 - 1.62812*x6*x13 - 
     15.5734*x6*x14 + 1.90988*x6*x15 - 0.69544*x6*x16 - 11.9102*x6*x17 - 
     14.7554*x6*x18 + 6.4038*x6*x19 - 6.3182*x6*x20 - 4.833*x6*x21 - 3.3892*x6*
     x22 - 9.402*x6*x23 + 11.925*x6*x24 - 2.8052*x6*x25 + 11.738*x6*x26 - 
     0.46512*x6*x27 + 16.3158*x6*x28 - 1.38028*x6*x29 - 12.758*x6*x30 + 0.89328
     *x6*x31 + 4.4442*x6*x32 - 14.944*x6*x33 - 3.2968*x6*x34 + 4.8014*x6*x35 + 
     12.2716*x6*x36 - 9.4012*x6*x37 + 19.2288*x6*x38 - 13.3508*x6*x39 + 14.1926
     *x6*x40 + 2.1362*x6*x41 - 4.9834*x6*x42 - 17.0994*x6*x43 + 2.098*x6*x44 - 
     17.3388*x6*x45 - 16.0834*x6*x46 - 4.0932*x6*x47 - 12.5628*x6*x48 - 12.4144
     *x6*x49 - 15.0066*x6*x50 - 14.2826*x6*x51 + 1.9173*x7*x7 - 2.5668*x7*x8 + 
     19.7846*x7*x9 - 12.878*x7*x10 + 1.68128*x7*x11 + 0.0959*x7*x12 - 14.3612*
     x7*x13 - 6.786*x7*x14 - 7.1466*x7*x15 - 0.21172*x7*x16 + 14.824*x7*x17 - 
     16.2812*x7*x18 - 7.7852*x7*x19 + 0.73712*x7*x20 - 4.237*x7*x21 - 1.61492*
     x7*x22 - 4.6414*x7*x23 + 1.3528*x7*x24 - 9.578*x7*x25 - 0.19916*x7*x26 + 
     1.7021*x7*x27 - 16.7082*x7*x28 - 12.3774*x7*x29 + 13.9566*x7*x30 + 13.2992
     *x7*x31 - 16.4806*x7*x32 - 2.6458*x7*x33 - 16.1924*x7*x34 - 5.347*x7*x35
      - 2.6286*x7*x36 - 1.91316*x7*x37 + 17.8366*x7*x38 - 4.4716*x7*x39 - 
     1.3821*x7*x40 + 1.08346*x7*x41 - 14.384*x7*x42 - 13.2354*x7*x43 - 1.47536*
     x7*x44 + 13.7124*x7*x45 - 3.6292*x7*x46 - 14.9126*x7*x47 - 12.0838*x7*x48
      - 4.2398*x7*x49 + 18.5406*x7*x50 - 15.078*x7*x51 + 0.65123*x8*x8 - 8.4508
     *x8*x9 - 6.5972*x8*x10 - 11.053*x8*x11 - 11.2024*x8*x12 + 1.55664*x8*x13
      - 0.100858*x8*x14 - 18.5864*x8*x15 - 17.734*x8*x16 - 2.5806*x8*x17 - 
     13.8936*x8*x18 - 10.7968*x8*x19 - 7.4768*x8*x20 - 16.9708*x8*x21 + 8.4916*
     x8*x22 + 15.8778*x8*x23 - 12.8018*x8*x24 + 0.8211*x8*x25 - 8.6382*x8*x26
      - 6.1768*x8*x27 + 2.1662*x8*x28 - 14.9148*x8*x29 - 12.5742*x8*x30 - 
     16.9376*x8*x31 - 6.3888*x8*x32 - 3.7204*x8*x33 - 8.6418*x8*x34 - 8.933*x8*
     x35 + 1.08796*x8*x36 + 8.3432*x8*x37 - 11.64*x8*x38 - 4.4292*x8*x39 - 
     12.4148*x8*x40 - 6.9922*x8*x41 + 9.7228*x8*x42 + 20.382*x8*x43 - 1.41266*
     x8*x44 - 16.8896*x8*x45 + 11.3898*x8*x46 + 0.194306*x8*x47 - 15.8622*x8*
     x48 - 11.0938*x8*x49 + 13.5198*x8*x50 - 7.5978*x8*x51 + 0.19414*x9*x9 - 
     5.67*x9*x10 - 7.1962*x9*x11 - 9.3486*x9*x12 - 11.0782*x9*x13 - 11.3656*x9*
     x14 - 14.3168*x9*x15 - 3.9364*x9*x16 - 14.8464*x9*x17 - 0.25088*x9*x18 - 
     10.499*x9*x19 + 11.7702*x9*x20 - 13.0962*x9*x21 - 5.546*x9*x22 + 5.6314*x9
     *x23 - 9.2868*x9*x24 - 10.58*x9*x25 - 2.6316*x9*x26 - 5.727*x9*x27 + 4.08*
     x9*x28 - 10.195*x9*x29 - 8.4862*x9*x30 - 6.739*x9*x31 - 6.633*x9*x32 - 
     18.6706*x9*x33 + 11.877*x9*x34 + 17.8796*x9*x35 - 6.5582*x9*x36 + 0.74446*
     x9*x37 + 13.972*x9*x38 + 3.6754*x9*x39 - 7.3948*x9*x40 + 12.5944*x9*x41 - 
     10.5976*x9*x42 - 17.7318*x9*x43 - 8.3454*x9*x44 + 12.5288*x9*x45 - 15.5756
     *x9*x46 - 13.8344*x9*x47 - 14.0544*x9*x48 - 16.3846*x9*x49 - 0.49126*x9*
     x50 + 0.57356*x9*x51 + 0.50338*x10*x10 - 18.3946*x10*x11 - 7.9688*x10*x12
      + 20.882*x10*x13 - 3.349*x10*x14 + 0.65444*x10*x15 - 0.70964*x10*x16 - 
     0.89866*x10*x17 - 6.659*x10*x18 - 3.3084*x10*x19 - 7.8482*x10*x20 + 7.092*
     x10*x21 - 0.9933*x10*x22 - 3.7526*x10*x23 - 17.5368*x10*x24 - 17.2422*x10*
     x25 + 14.6738*x10*x26 - 0.32316*x10*x27 + 15.3186*x10*x28 + 20.858*x10*x29
      - 5.2296*x10*x30 + 19.9712*x10*x31 - 18.8792*x10*x32 - 12.6812*x10*x33 - 
     19.3108*x10*x34 - 17.429*x10*x35 - 1.3568*x10*x36 - 13.4514*x10*x37 - 
     10.6494*x10*x38 - 11.8212*x10*x39 - 4.9068*x10*x40 - 14.2528*x10*x41 - 
     11.2358*x10*x42 + 8.5712*x10*x43 + 5.1742*x10*x44 + 18.2208*x10*x45 - 
     3.4072*x10*x46 - 8.5884*x10*x47 - 6.8518*x10*x48 - 0.30668*x10*x49 - 
     0.28686*x10*x50 - 7.9376*x10*x51 + 0.45825*x11*x11 - 11.1162*x11*x12 + 
     4.2526*x11*x13 - 13.9322*x11*x14 - 14.8808*x11*x15 + 13.3708*x11*x16 - 
     4.7244*x11*x17 + 0.59102*x11*x18 - 4.653*x11*x19 - 5.0166*x11*x20 + 
     16.6562*x11*x21 - 8.7616*x11*x22 + 0.3045*x11*x23 + 6.8196*x11*x24 - 
     2.4522*x11*x25 + 0.28572*x11*x26 - 8.4036*x11*x27 - 4.7768*x11*x28 + 
     3.9596*x11*x29 - 16.5892*x11*x30 - 6.5358*x11*x31 - 8.1532*x11*x32 - 
     6.9316*x11*x33 - 16.7432*x11*x34 + 2.5984*x11*x35 + 16.7142*x11*x36 + 
     0.53164*x11*x37 - 2.0066*x11*x38 - 9.0484*x11*x39 + 18.2826*x11*x40 - 15.2
     *x11*x41 + 16.881*x11*x42 - 18.4496*x11*x43 - 7.4946*x11*x44 - 9.571*x11*
     x45 - 1.16824*x11*x46 - 6.6922*x11*x47 + 4.8946*x11*x48 - 15.607*x11*x49
      - 8.027*x11*x50 - 7.1632*x11*x51 + 0.64774*x12*x12 - 12.5872*x12*x13 - 
     7.0718*x12*x14 - 15.6336*x12*x15 - 13.8596*x12*x16 + 20.328*x12*x17 + 
     7.4548*x12*x18 + 6.6838*x12*x19 - 10.5808*x12*x20 - 6.6682*x12*x21 - 
     12.6706*x12*x22 + 2.7594*x12*x23 + 9.5668*x12*x24 - 14.578*x12*x25 - 
     9.0788*x12*x26 - 3.4586*x12*x27 - 8.4786*x12*x28 - 2.5488*x12*x29 + 15.002
     *x12*x30 - 10.385*x12*x31 - 9.4712*x12*x32 + 6.4402*x12*x33 - 11.6916*x12*
     x34 + 1.01472*x12*x35 - 4.7932*x12*x36 - 7.1098*x12*x37 + 0.104232*x12*x38
      - 9.9634*x12*x39 - 12.3936*x12*x40 + 5.0952*x12*x41 - 4.2566*x12*x42 - 
     7.9488*x12*x43 - 17.7252*x12*x44 - 17.5448*x12*x45 - 4.7682*x12*x46 + 
     3.3156*x12*x47 + 8.3174*x12*x48 - 8.2124*x12*x49 - 7.2094*x12*x50 - 7.2142
     *x12*x51 + 1.2567*x13*x13 - 12.626*x13*x14 - 16.773*x13*x15 - 12.0824*x13*
     x16 - 5.4466*x13*x17 + 9.7298*x13*x18 + 22.156*x13*x19 - 12.8054*x13*x20
      - 5.6706*x13*x21 - 11.9316*x13*x22 - 2.4138*x13*x23 - 6.181*x13*x24 + 
     22.03*x13*x25 + 22.946*x13*x26 - 11.845*x13*x27 - 0.083748*x13*x28 - 
     1.80562*x13*x29 + 3.3236*x13*x30 + 20.134*x13*x31 - 2.08*x13*x32 + 9.5316*
     x13*x33 + 0.123258*x13*x34 - 12.753*x13*x35 - 16.3646*x13*x36 - 3.7696*x13
     *x37 - 5.2028*x13*x38 - 6.5244*x13*x39 - 3.6992*x13*x40 + 16.2722*x13*x41
      - 5.1132*x13*x42 - 11.1214*x13*x43 - 2.3492*x13*x44 - 11.2558*x13*x45 - 
     7.4146*x13*x46 - 5.5996*x13*x47 - 6.0212*x13*x48 - 9.8486*x13*x49 - 
     15.6984*x13*x50 - 6.3152*x13*x51 + 1.9206*x14*x14 - 7.1984*x14*x15 - 9.706
     *x14*x16 + 2.1006*x14*x17 - 15.1804*x14*x18 - 13.561*x14*x19 - 15.2134*x14
     *x20 + 12.6478*x14*x21 + 10.0804*x14*x22 - 10.7894*x14*x23 + 0.23498*x14*
     x24 - 3.3584*x14*x25 + 22.754*x14*x26 + 19.2834*x14*x27 - 12.9542*x14*x28
      + 1.65338*x14*x29 - 2.417*x14*x30 - 2.5388*x14*x31 - 9.0658*x14*x32 - 
     3.5772*x14*x33 - 13.7292*x14*x34 - 13.0026*x14*x35 - 4.0138*x14*x36 + 
     18.1698*x14*x37 - 13.9496*x14*x38 - 3.5932*x14*x39 - 15.2782*x14*x40 - 
     3.0926*x14*x41 - 4.7552*x14*x42 + 15.2784*x14*x43 - 2.8434*x14*x44 - 1.246
     *x14*x45 + 11.8284*x14*x46 - 0.91162*x14*x47 - 7.1348*x14*x48 + 2.2458*x14
     *x49 - 7.0088*x14*x50 + 21.012*x14*x51 + 0.55543*x15*x15 - 14.4604*x15*x16
      - 7.49*x15*x17 - 16.1954*x15*x18 - 17.5006*x15*x19 - 4.5058*x15*x20 - 
     0.74358*x15*x21 - 12.2402*x15*x22 - 12.0942*x15*x23 + 11.1508*x15*x24 - 
     0.64816*x15*x25 + 7.937*x15*x26 + 2.0782*x15*x27 - 13.9592*x15*x28 - 
     1.50728*x15*x29 - 7.798*x15*x30 - 6.0544*x15*x31 - 10.9956*x15*x32 - 
     16.4564*x15*x33 - 14.615*x15*x34 - 5.1138*x15*x35 + 7.253*x15*x36 - 
     10.1506*x15*x37 + 17.8436*x15*x38 + 1.53988*x15*x39 - 13.569*x15*x40 - 
     14.452*x15*x41 - 18.9748*x15*x42 - 8.3792*x15*x43 - 10.3206*x15*x44 - 
     5.1172*x15*x45 + 6.03*x15*x46 - 11.2704*x15*x47 - 0.3023*x15*x48 - 5.4846*
     x15*x49 - 16.8278*x15*x50 + 14.1664*x15*x51 + 0.47846*x16*x16 - 5.084*x16*
     x17 + 8.24*x16*x18 - 7.2014*x16*x19 - 0.78*x16*x20 - 5.7968*x16*x21 + 
     3.3016*x16*x22 - 12.5622*x16*x23 - 8.1258*x16*x24 - 4.3472*x16*x25 + 
     14.6098*x16*x26 - 16.3594*x16*x27 - 11.6044*x16*x28 - 10.8198*x16*x29 - 
     14.5012*x16*x30 + 7.0552*x16*x31 - 14.407*x16*x32 - 9.1316*x16*x33 + 
     1.26762*x16*x34 + 10.7782*x16*x35 - 16.3534*x16*x36 - 9.7186*x16*x37 + 
     17.7428*x16*x38 - 1.83154*x16*x39 - 13.8302*x16*x40 - 5.2244*x16*x41 - 
     3.1596*x16*x42 - 1.34132*x16*x43 + 19.2722*x16*x44 - 7.1866*x16*x45 - 
     14.8708*x16*x46 - 7.4314*x16*x47 - 6.378*x16*x48 - 9.7252*x16*x49 - 6.6074
     *x16*x50 - 17.0832*x16*x51 + 0.80336*x17*x17 + 0.27412*x17*x18 - 13.5636*
     x17*x19 + 8.2716*x17*x20 - 12.9066*x17*x21 - 2.7512*x17*x22 - 14.553*x17*
     x23 + 10.041*x17*x24 - 11.7192*x17*x25 + 4.6402*x17*x26 - 14.1054*x17*x27
      - 6.8712*x17*x28 - 6.5498*x17*x29 + 19.8446*x17*x30 - 15.0106*x17*x31 - 
     16.5936*x17*x32 + 5.2476*x17*x33 - 7.7762*x17*x34 + 17.3908*x17*x35 + 
     20.116*x17*x36 + 9.7986*x17*x37 - 8.3332*x17*x38 - 1.98024*x17*x39 - 
     4.0654*x17*x40 + 1.02298*x17*x41 - 15.8478*x17*x42 - 2.1282*x17*x43 - 
     3.967*x17*x44 - 16.055*x17*x45 - 9.6888*x17*x46 + 8.8292*x17*x47 + 
     0.142746*x17*x48 - 8.9924*x17*x49 - 15.0102*x17*x50 - 4.5272*x17*x51 + 
     0.057462*x18*x18 - 1.82844*x18*x19 - 2.5974*x18*x20 - 13.199*x18*x21 + 
     5.4334*x18*x22 - 2.167*x18*x23 - 5.9352*x18*x24 - 13.492*x18*x25 - 13.535*
     x18*x26 + 16.2704*x18*x27 - 2.9206*x18*x28 - 14.886*x18*x29 - 5.203*x18*
     x30 - 15.4002*x18*x31 - 10.0254*x18*x32 - 3.3292*x18*x33 - 5.0526*x18*x34
      - 13.6126*x18*x35 - 15.3516*x18*x36 + 13.7112*x18*x37 - 13.0386*x18*x38
      + 0.46012*x18*x39 - 18.5664*x18*x40 - 8.4396*x18*x41 - 18.0262*x18*x42 - 
     3.2802*x18*x43 - 11.8418*x18*x44 - 8.3506*x18*x45 + 20.772*x18*x46 + 
     20.954*x18*x47 - 17.7906*x18*x48 - 2.173*x18*x49 + 13.3584*x18*x50 - 
     13.3474*x18*x51 + 0.91901*x19*x19 - 11.8172*x19*x20 - 7.7202*x19*x21 + 
     9.8586*x19*x22 + 8.031*x19*x23 - 3.6854*x19*x24 - 11.5826*x19*x25 - 
     16.1558*x19*x26 - 14.9918*x19*x27 - 9.982*x19*x28 - 6.0774*x19*x29 - 
     3.1508*x19*x30 - 5.1534*x19*x31 + 17.8202*x19*x32 - 12.1522*x19*x33 - 
     1.6088*x19*x34 - 13.8884*x19*x35 - 3.38*x19*x36 - 12.275*x19*x37 - 6.4846*
     x19*x38 + 2.6308*x19*x39 - 8.25*x19*x40 - 6.1202*x19*x41 - 1.64298*x19*x42
      - 0.69452*x19*x43 - 3.962*x19*x44 + 12.7432*x19*x45 - 1.29682*x19*x46 - 
     13.0758*x19*x47 - 8.1284*x19*x48 - 6.8358*x19*x49 + 9.5562*x19*x50 - 
     16.0254*x19*x51 + 1.3429*x20*x20 - 12.6112*x20*x21 - 18.3602*x20*x22 - 
     13.3224*x20*x23 - 11.4104*x20*x24 + 22.986*x20*x25 - 1.6769*x20*x26 - 
     14.0126*x20*x27 + 7.2976*x20*x28 + 0.22042*x20*x29 - 5.7742*x20*x30 - 
     0.8992*x20*x31 + 2.1016*x20*x32 - 3.2606*x20*x33 - 6.2904*x20*x34 - 4.323*
     x20*x35 + 7.2442*x20*x36 - 6.3316*x20*x37 + 1.66328*x20*x38 - 14.363*x20*
     x39 - 9.5988*x20*x40 - 0.073118*x20*x41 - 0.9343*x20*x42 - 5.0236*x20*x43
      - 8.2552*x20*x44 - 4.4606*x20*x45 + 21.548*x20*x46 - 9.4228*x20*x47 - 
     13.9942*x20*x48 - 12.0514*x20*x49 - 1.04404*x20*x50 - 7.9792*x20*x51 + 
     0.32355*x21*x21 - 3.0278*x21*x22 - 13.1238*x21*x23 - 15.195*x21*x24 - 
     16.6836*x21*x25 - 8.8632*x21*x26 + 0.42776*x21*x27 - 16.5202*x21*x28 - 
     18.3858*x21*x29 - 5.274*x21*x30 - 2.7154*x21*x31 - 4.8256*x21*x32 - 
     13.3332*x21*x33 - 1.96116*x21*x34 - 4.4562*x21*x35 + 5.0688*x21*x36 - 
     6.9622*x21*x37 + 1.90166*x21*x38 - 16.436*x21*x39 + 1.7765*x21*x40 - 
     6.9162*x21*x41 - 6.7692*x21*x42 + 15.7778*x21*x43 - 3.5928*x21*x44 + 0.267
     *x21*x45 - 16.4052*x21*x46 + 17.505*x21*x47 - 15.3708*x21*x48 + 5.4676*x21
     *x49 + 8.7772*x21*x50 - 3.2356*x21*x51 + 0.072333*x22*x22 - 16.9906*x22*
     x23 - 8.034*x22*x24 + 20.224*x22*x25 - 3.1154*x22*x26 - 6.0848*x22*x27 - 
     9.4964*x22*x28 + 3.3644*x22*x29 - 18.5622*x22*x30 + 20.798*x22*x31 - 
     15.854*x22*x32 + 18.1956*x22*x33 - 10.56*x22*x34 + 10.0338*x22*x35 + 
     15.1044*x22*x36 - 4.9372*x22*x37 - 13.7508*x22*x38 + 13.2646*x22*x39 - 
     15.9764*x22*x40 - 2.8958*x22*x41 - 1.68728*x22*x42 + 3.2038*x22*x43 - 
     10.9556*x22*x44 - 16.4368*x22*x45 - 8.2696*x22*x46 - 1.5477*x22*x47 - 
     12.1336*x22*x48 - 13.899*x22*x49 + 11.8172*x22*x50 - 4.69*x22*x51 + 1.1459
     *x23*x23 + 14.766*x23*x24 - 13.67*x23*x25 - 4.0108*x23*x26 + 1.4058*x23*
     x27 + 2.2262*x23*x28 - 0.23538*x23*x29 - 13.9236*x23*x30 + 18.2408*x23*x31
      - 17.7672*x23*x32 - 0.3243*x23*x33 - 2.0084*x23*x34 - 4.347*x23*x35 - 
     16.1284*x23*x36 + 8.2832*x23*x37 - 6.0324*x23*x38 - 12.8428*x23*x39 + 
     14.6628*x23*x40 + 0.59978*x23*x41 - 2.673*x23*x42 - 12.6576*x23*x43 - 
     0.37792*x23*x44 - 12.2558*x23*x45 - 8.9556*x23*x46 + 16.6844*x23*x47 - 
     16.6762*x23*x48 - 6.7474*x23*x49 - 2.6904*x23*x50 + 13.3586*x23*x51 + 
     0.49898*x24*x24 - 13.5752*x24*x25 + 9.0054*x24*x26 + 8.3874*x24*x27 - 
     16.0586*x24*x28 + 8.3658*x24*x29 - 14.646*x24*x30 - 11.2784*x24*x31 - 2.63
     *x24*x32 - 10.6144*x24*x33 - 14.2184*x24*x34 - 14.4054*x24*x35 - 16.3336*
     x24*x36 - 15.3268*x24*x37 - 13.2602*x24*x38 - 2.0098*x24*x39 - 2.9308*x24*
     x40 - 12.79*x24*x41 - 9.2302*x24*x42 - 9.0336*x24*x43 - 5.6872*x24*x44 - 
     8.9166*x24*x45 + 5.065*x24*x46 + 0.46774*x24*x47 - 3.3094*x24*x48 - 
     12.2016*x24*x49 + 1.03418*x24*x50 - 14.8622*x24*x51 + 1.7248*x25*x25 - 
     11.4358*x25*x26 - 16.2294*x25*x27 + 5.827*x25*x28 + 19.2142*x25*x29 - 
     8.1314*x25*x30 + 5.8726*x25*x31 + 21.48*x25*x32 + 17.7782*x25*x33 + 
     0.49242*x25*x34 - 1.35566*x25*x35 + 21.398*x25*x36 - 11.3528*x25*x37 - 
     11.3006*x25*x38 + 6.3822*x25*x39 - 7.37*x25*x40 - 14.885*x25*x41 - 13.1566
     *x25*x42 - 10.5438*x25*x43 - 5.275*x25*x44 + 11.5814*x25*x45 + 19.9306*x25
     *x46 - 10.8762*x25*x47 + 21.788*x25*x48 - 0.135926*x25*x49 - 12.8184*x25*
     x50 - 0.65882*x25*x51 + 1.8385*x26*x26 + 19.5754*x26*x27 - 15.6272*x26*x28
      - 7.2338*x26*x29 - 1.59234*x26*x30 - 12.6438*x26*x31 + 16.636*x26*x32 - 
     11.8214*x26*x33 - 1.34122*x26*x34 - 3.0652*x26*x35 - 9.5756*x26*x36 - 
     16.023*x26*x37 - 5.418*x26*x38 + 15.2636*x26*x39 - 10.805*x26*x40 - 6.3886
     *x26*x41 - 9.5626*x26*x42 + 0.3691*x26*x43 + 3.9012*x26*x44 + 16.638*x26*
     x45 + 20.138*x26*x46 - 13.8352*x26*x47 - 4.945*x26*x48 - 4.9694*x26*x49 - 
     13.1914*x26*x50 + 14.263*x26*x51 + 1.5323*x27*x27 + 8.1924*x27*x28 - 
     11.7456*x27*x29 - 7.031*x27*x30 - 13.421*x27*x31 - 18.0512*x27*x32 + 
     8.2554*x27*x33 + 4.5764*x27*x34 - 8.9216*x27*x35 - 0.85598*x27*x36 - 
     16.0062*x27*x37 + 3.1448*x27*x38 - 5.9456*x27*x39 + 11.9856*x27*x40 - 
     12.3298*x27*x41 + 1.68448*x27*x42 - 7.7164*x27*x43 + 20.178*x27*x44 - 2.41
     *x27*x45 + 2.8576*x27*x46 - 1.57032*x27*x47 - 7.02*x27*x48 - 5.5224*x27*
     x49 - 1.4584*x27*x50 - 7.145*x27*x51 + 0.32599*x28*x28 - 15.9004*x28*x29
      - 4.4906*x28*x30 + 0.48276*x28*x31 - 6.175*x28*x32 - 17.8574*x28*x33 + 
     12.899*x28*x34 + 2.3232*x28*x35 - 6.4958*x28*x36 - 1.76758*x28*x37 - 
     4.0734*x28*x38 - 7.0032*x28*x39 - 6.3216*x28*x40 - 8.0866*x28*x41 - 8.8042
     *x28*x42 + 19.124*x28*x43 + 10.1448*x28*x44 - 6.1648*x28*x45 + 19.9628*x28
     *x46 - 11.7884*x28*x47 + 13.259*x28*x48 + 2.0652*x28*x49 - 2.3014*x28*x50
      + 20.466*x28*x51 + 0.64496*x29*x29 - 15.7934*x29*x30 - 0.97118*x29*x31 + 
     4.7692*x29*x32 + 20.9*x29*x33 - 0.64534*x29*x34 - 1.6335*x29*x35 - 10.9912
     *x29*x36 + 7.9694*x29*x37 - 10.0838*x29*x38 - 17.2028*x29*x39 - 2.8876*x29
     *x40 - 1.2674*x29*x41 - 7.8178*x29*x42 + 21.128*x29*x43 - 0.4352*x29*x44
      - 8.9724*x29*x45 - 12.9036*x29*x46 - 6.9446*x29*x47 + 11.4092*x29*x48 + 
     0.109458*x29*x49 + 19.8172*x29*x50 + 20.972*x29*x51 + 0.50669*x30*x30 - 
     10.5594*x30*x31 - 6.3658*x30*x32 - 9.6806*x30*x33 - 19.078*x30*x34 - 
     7.2378*x30*x35 - 13.007*x30*x36 - 3.4646*x30*x37 + 17.3484*x30*x38 - 
     13.6134*x30*x39 - 12.7224*x30*x40 + 3.2966*x30*x41 - 5.4434*x30*x42 - 
     3.8468*x30*x43 + 0.75376*x30*x44 - 7.0284*x30*x45 - 3.2286*x30*x46 - 
     6.2124*x30*x47 + 13.2458*x30*x48 + 0.34646*x30*x49 - 12.5676*x30*x50 - 
     11.2852*x30*x51 + 1.886*x31*x31 - 12.6514*x31*x32 + 9.5044*x31*x33 + 
     0.61564*x31*x34 + 21.802*x31*x35 + 3.5596*x31*x36 + 1.82954*x31*x37 + 
     2.3844*x31*x38 + 6.9154*x31*x39 + 21.834*x31*x40 + 9.3678*x31*x41 - 2.1156
     *x31*x42 + 8.1524*x31*x43 + 19.0598*x31*x44 + 20.112*x31*x45 - 8.035*x31*
     x46 + 12.8624*x31*x47 - 8.3108*x31*x48 - 5.5246*x31*x49 - 11.309*x31*x50
      - 13.904*x31*x51 + 0.38663*x32*x32 - 9.5594*x32*x33 - 1.41214*x32*x34 + 
     1.15666*x32*x35 + 0.61594*x32*x36 - 8.3094*x32*x37 - 11.8986*x32*x38 + 
     17.2394*x32*x39 - 6.1858*x32*x40 - 17.9544*x32*x41 - 6.6768*x32*x42 - 
     13.9292*x32*x43 + 1.30258*x32*x44 - 8.7826*x32*x45 - 7.9276*x32*x46 + 
     9.2202*x32*x47 - 15.0006*x32*x48 - 13.6638*x32*x49 - 13.6182*x32*x50 - 
     9.0438*x32*x51 + 0.76502*x33*x33 - 12.7274*x33*x34 + 8.4022*x33*x35 - 
     6.6568*x33*x36 - 9.2294*x33*x37 - 0.90288*x33*x38 + 1.46168*x33*x39 - 
     12.8126*x33*x40 + 9.2886*x33*x41 - 15.0594*x33*x42 - 14.3418*x33*x43 - 
     9.3364*x33*x44 + 0.79338*x33*x45 - 15.8156*x33*x46 + 21.624*x33*x47 - 
     17.7474*x33*x48 - 13.5222*x33*x49 - 9.5758*x33*x50 - 17.3096*x33*x51 + 
     0.067293*x34*x34 + 11.0804*x34*x35 + 9.4786*x34*x36 + 1.86926*x34*x37 - 
     12.8734*x34*x38 + 2.2688*x34*x39 - 7.8024*x34*x40 + 4.2364*x34*x41 - 
     15.6186*x34*x42 + 12.0112*x34*x43 - 3.4642*x34*x44 - 16.6646*x34*x45 - 
     9.773*x34*x46 + 12.346*x34*x47 + 16.1302*x34*x48 - 10.7348*x34*x49 - 
     9.0848*x34*x50 - 16.9892*x34*x51 + 1.3391*x35*x35 - 8.6164*x35*x36 - 
     8.3296*x35*x37 + 15.0728*x35*x38 + 4.8982*x35*x39 - 9.225*x35*x40 + 5.6902
     *x35*x41 - 15.2578*x35*x42 - 17.6518*x35*x43 + 11.395*x35*x44 + 11.6764*
     x35*x45 + 8.8616*x35*x46 + 21.874*x35*x47 - 0.61954*x35*x48 - 7.772*x35*
     x49 - 13.8168*x35*x50 - 4.284*x35*x51 + 0.48974*x36*x36 - 13.8552*x36*x37
      + 8.1596*x36*x38 - 5.0404*x36*x39 - 5.2648*x36*x40 - 5.3202*x36*x41 - 
     11.0382*x36*x42 + 16.4*x36*x43 - 18.666*x36*x44 - 4.9702*x36*x45 - 11.133*
     x36*x46 + 7.1874*x36*x47 - 9.5016*x36*x48 - 14.1124*x36*x49 + 18.9716*x36*
     x50 - 1.84632*x36*x51 + 1.1213*x37*x37 - 9.2414*x37*x38 - 10.11*x37*x39 - 
     4.0548*x37*x40 - 15.0976*x37*x41 - 0.40378*x37*x42 - 17.9168*x37*x43 + 
     1.69784*x37*x44 + 16.147*x37*x45 - 3.1172*x37*x46 - 13.3588*x37*x47 - 
     0.169384*x37*x48 + 2.6354*x37*x49 + 7.1518*x37*x50 + 10.3328*x37*x51 + 
     1.9132*x38*x38 - 3.2816*x38*x39 - 12.305*x38*x40 + 10.3364*x38*x41 - 
     5.1564*x38*x42 + 0.38442*x38*x43 - 1.6921*x38*x44 + 2.1432*x38*x45 - 
     14.3692*x38*x46 - 13.3356*x38*x47 - 2.1608*x38*x48 - 9.5412*x38*x49 - 
     3.671*x38*x50 + 8.1084*x38*x51 + 1.1605*x39*x39 + 5.2424*x39*x40 - 9.9878*
     x39*x41 - 12.658*x39*x42 - 14.1956*x39*x43 - 17.5192*x39*x44 - 0.16409*x39
     *x45 + 15.6236*x39*x46 + 3.7048*x39*x47 - 13.5306*x39*x48 + 5.719*x39*x49
      - 3.664*x39*x50 + 3.5076*x39*x51 + 0.75274*x40*x40 + 10.5476*x40*x41 - 
     17.9054*x40*x42 + 14.7684*x40*x43 - 3.8832*x40*x44 - 8.9568*x40*x45 + 
     7.8072*x40*x46 - 8.815*x40*x47 - 6.514*x40*x48 + 0.27896*x40*x49 - 14.8456
     *x40*x50 - 15.7062*x40*x51 + 0.41824*x41*x41 - 12.0598*x41*x42 - 16.6042*
     x41*x43 - 8.6858*x41*x44 - 12.2824*x41*x45 + 1.00654*x41*x46 - 5.8148*x41*
     x47 - 17.5614*x41*x48 - 17.0772*x41*x49 + 11.0886*x41*x50 - 5.6866*x41*x51
      + 0.40195*x42*x42 + 0.41946*x42*x43 - 7.2738*x42*x44 + 0.67092*x42*x45 - 
     8.3882*x42*x46 - 13.9154*x42*x47 - 2.5884*x42*x48 - 17.7272*x42*x49 + 
     6.5608*x42*x50 - 12.7056*x42*x51 + 0.56803*x43*x43 - 1.55428*x43*x44 + 
     0.2408*x43*x45 - 0.93722*x43*x46 - 7.658*x43*x47 + 9.5142*x43*x48 - 6.159*
     x43*x49 - 10.484*x43*x50 + 14.8276*x43*x51 + 0.66416*x44*x44 - 11.1576*x44
     *x45 + 14.9326*x44*x46 - 6.9952*x44*x47 + 8.9276*x44*x48 - 11.8032*x44*x49
      + 6.0094*x44*x50 - 15.3546*x44*x51 + 0.34056*x45*x45 - 3.7214*x45*x46 - 
     0.36642*x45*x47 - 12.5634*x45*x48 - 0.114636*x45*x49 - 4.9568*x45*x50 - 
     10.3422*x45*x51 + 1.4187*x46*x46 + 9.4344*x46*x47 + 7.5136*x46*x48 - 
     4.8044*x46*x49 - 5.4696*x46*x50 - 3.8452*x46*x51 + 1.5415*x47*x47 + 
     17.1216*x47*x48 + 18.55*x47*x49 - 10.4548*x47*x50 - 16.7464*x47*x51 + 
     1.1461*x48*x48 - 3.4516*x48*x49 + 21.852*x48*x50 - 15.8962*x48*x51 + 
     1.8661*x49*x49 - 13.4232*x49*x50 + 10.2844*x49*x51 + 1.9382*x50*x50 - 
     5.2066*x50*x51 + 0.63499*x51*x51 - objvar =E= 0;

e2..    x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14
      + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26
      + x27 + x28 + x29 + x30 + x31 + x32 + x33 + x34 + x35 + x36 + x37 + x38
      + x39 + x40 + x41 + x42 + x43 + x44 + x45 + x46 + x47 + x48 + x49 + x50
      + x51 =E= 1;

Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%'

m.tolproj = 0.0;
$if not set QCP $set QCP QCP
Solve m using %QCP% minimizing objvar;
