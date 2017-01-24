#!/usr/bin/env python2
#
# replaces same-variable-products by squares, e.g., x5*x5 by sqr(x5)

import sys;
import re;

pattern = re.compile(r'[xib][0-9]+\*');

for line in sys.stdin :

   pos = 0;
   while True:
      match = pattern.search(line, pos);
      if match is None :
         break;
      start = match.start(0);
      var = match.group(0)[:-1];
      #print var, 'at', match.start(0), 'to', match.end(0);
      #print line[match.start(0):match.end(0)+len(var)]
      if line[match.end(0):match.end(0)+len(var)] == var and not re.match(r'[0-9]', line[match.end(0)+len(var)]) :
         line = line[:match.start(0)] + 'sqr(' + var + ')' + line[match.end(0)+len(var):];
         #line = line.replace(line[match.start(0):match.end(0)+len(var)], 'sqr(' + var + ')');
      pos = match.start(0) + len(var);
   
   print line,
