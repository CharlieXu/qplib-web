#!/usr/bin/python2
# -*- coding: utf-8 -*-
#
# This script writes detailed.txt for the qplib paper

import os;
import datetime;
import sys;
import pandas;

import metadata;
import bibtohtml;

def writedetails() :
   data = metadata.read();
   
   df = metadata.todataframe(data);
   
   for name, attribs in df.iterrows() :
      print name[6:], '&',;
      
      print attribs['probtype'], '&',;
      
      if attribs['objquadhardevfrac'] > 0 :
         print '{0:.1f}'.format(max(0.1,100*attribs['objquadhardevfrac'])), '&',;
      elif attribs['nobjquadnz'] > 0 :
         print '0.0 &',;
      else :
         print '&',;
      if attribs['nobjquadnz'] > 0 :
         print '{0:.1f}'.format(max(0.1,100.0*attribs['objquaddensity'])), '&',;
      else :
         print '&',;
      
      print attribs['nbinvars'], '&',;
      print attribs['nintvars'], '&',;
      print attribs['nvars'] - attribs['nbinvars'] - attribs['nintvars'], '&',;
      
      print attribs['nlincons'], '&',;
      print attribs['nquadcons'] - attribs['nconvexnlcons'], '&',;
      print attribs['nconvexnlcons'], '&',;
      print 2*attribs['nboundedvars'] + attribs['nsingleboundedvars'],;
   
      print '\\\\';


if __name__ == '__main__' :
    writedetails();
