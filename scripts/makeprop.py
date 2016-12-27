#!/usr/bin/python2

import os;
import subprocess;

DATADIR = os.path.join(os.path.dirname(__file__), '..', 'data');
BINDIR = os.path.join(os.path.dirname(__file__), '..', 'bin');

pointfiles = os.listdir(os.path.join(DATADIR, 'gdx'));

points = {};
for p in pointfiles :
    if p.split('.')[-1] != 'gdx' :
        continue;
    instance = p.split('.')[0] + '.gms';
    p = os.path.join(DATADIR, 'gdx', p);
    if instance not in points :
        points[instance] = [p]
    else :
        points[instance].append(p);

instances = os.listdir(os.path.join(DATADIR, 'gms'));

for f in sorted(instances) :

    s = f.split('.');
    assert(len(s) == 2);
    
    propfilename = os.path.join(DATADIR, 'meta', s[0] + '.prop')
    missingprop = False;
    if not os.path.exists(propfilename) :
        missingprop = True;
    elif f in points :
        for p in points[f] :
            pfilename = os.path.basename(p).replace('.gdx', '.prop');
            if not os.path.exists(os.path.join(DATADIR, 'meta', pfilename)) :
                missingprop = True;
    if not missingprop :
        continue;

    print f, (len(points[f]) if f in points else 0), 'points';
        
    p = subprocess.Popen([os.path.join(BINDIR, 'propcheck'), os.path.join(DATADIR, 'gms', f)] + (points[f] if f in points else []),
                         stdout = subprocess.PIPE);
    prop = p.communicate()[0];
    if p.returncode != 0 :
        print 'Return code', p.returncode, 'from calling propcheck on', f;
        continue;
        
    propfile = open(propfilename, 'w');
    
    for line in prop.splitlines() :
        if line[:4] == "### " :
            point = line[4:];
            propfile.close();
            propfile = open(os.path.join(DATADIR, 'meta', point + '.prop'), 'w');
            
        else :
            print >> propfile, line;

    if os.path.exists(s[0] + '.jac.png') :
        if os.path.exists(os.path.join(DATADIR, 'png', s[0] + '.jac.png')) :
            os.remove(os.path.join(DATADIR, 'png', s[0] + '.jac.png'));
        os.rename(s[0] + '.jac.png', os.path.join(DATADIR, 'png', s[0] + '.jac.png'));
    elif os.path.exists(s[0] + '.jac.ppm') :
        if os.path.exists(os.path.join(DATADIR, 'png', s[0] + '.jac.png')) :
            os.remove(os.path.join(DATADIR, 'png', s[0] + '.jac.png'));
        subprocess.call(['convert', s[0] + '.jac.ppm', os.path.join(DATADIR, 'png', s[0] + '.jac.png')])
        os.remove(s[0] + '.jac.ppm');
        #shutil.move(s[0] + '.jac.ppm', os.path.join(DATADIR, 'ppm'));

    if os.path.exists(s[0] + '.hess.png') :
        if os.path.exists(os.path.join(DATADIR, 'png', s[0] + '.hess.png')) :
            os.remove(os.path.join(DATADIR, 'png', s[0] + '.hess.png'));
        os.rename(s[0] + '.hess.png', os.path.join(DATADIR, 'png', s[0] + '.hess.png'));
    elif os.path.exists(s[0] + '.hess.pbm') :
        if os.path.exists(os.path.join(DATADIR, 'png', s[0] + '.hess.png')) :
            os.remove(os.path.join(DATADIR, 'png', s[0] + '.hess.png'));
        subprocess.call(['convert', s[0] + '.hess.pbm', os.path.join(DATADIR, 'png', s[0] + '.hess.png')])
        os.remove(s[0] + '.hess.pbm');
            
    propfile.close();
