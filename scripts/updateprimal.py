#!/usr/bin/env python2

import os;
import sys;
import shutil;
import datetime;
import subprocess;
import ConfigParser;
import StringIO;

import metadata;

BINDIR = os.path.join(metadata.BASEDIR, 'bin');

def updateprimal(dir) :
    data = metadata.read();
    updates = [];
    
    # disable instance check in propcheck
    os.environ['PROPCHECK_SKIPINSTANCE'] = "1";
    
    # pointpolish seems to need GAMS directory in library path
    if 'LD_LIBRARY_PATH' in os.environ :
        os.environ['LD_LIBRARY_PATH'] += ':' + os.path.abspath(os.path.join(metadata.BASEDIR, 'gams'));
    else :
        os.environ['LD_LIBRARY_PATH'] = os.path.abspath(os.path.join(metadata.BASEDIR, 'gams'));
    
    # directory name: check.<testset>.<gamsbinary(can have .)>.<solver>.<queue>.<settings>.sol
    dirsplit = dir.split('.');
    solver = None;
    settings = None;
    if len(dirsplit) >= 4 :
        solver = dirsplit[-4];
    if len(dirsplit) >= 6  and dirsplit[-2] != 'default' :
        settings = dirsplit[-2];
    
    print solver if solver is not None else 'Solver??', settings if settings is not None else '';
    
    for f in sorted(os.listdir(dir)) :
        if f.split('.')[-1] not in ['gdx', 'sol']  :
            print 'Ignoring', f;
            continue;
        
        print 'Processing', f;
        
        m = f.split('.')[0];
        if m not in data :
            print 'Unknown instance', m;
            continue;

        sense = data[m]['objsense'] if 'objsense' in data[m] else 'min';
        bestprimal = data[m]['solobjvalue'] if 'solobjvalue' in data[m] else None;

        gmsfile = os.path.join(metadata.DATADIR, 'gms', m + '.gms');
                
        p = subprocess.Popen([os.path.join(BINDIR, 'propcheck'), gmsfile, os.path.join(dir, f)],
                             stdout = subprocess.PIPE);
        prop = p.communicate()[0];
        if p.returncode != 0 :
            print 'Return code', p.returncode, 'from calling propcheck on', f;
            continue;
        
        prop_str = '[root]\n' + prop;
        prop_fp = StringIO.StringIO(prop_str);
        config = ConfigParser.RawConfigParser();
        config.readfp(prop_fp);
           
        infeas = config.getfloat('root', 'solinfeasibility');
        print '\tInfeasibility  :', infeas;
        
        if infeas > 0.1 :
            # infeasibility too large to be close to feasible
            continue;

        obj = config.getfloat('root', 'solobjvalue');
        print '\tObjective value:', obj, '\tbest:', bestprimal if not None else '--', '['+sense+']';

        sense = 1.0 if sense == 'min' else -1.0;
        if bestprimal is not None and obj is not None and sense * obj > sense * bestprimal - 1e-6 * max(1, abs(bestprimal)) :
            # objective value does not promise improvement
            continue;
            
        # polish point
        rc = subprocess.call([os.path.join(BINDIR, 'pointpolish'), gmsfile, os.path.join(dir, f)]);
        if rc != 0 :
            print 'Return code', rc, 'from calling pointpolish';
            continue;

        # get feasibility and objective value
        p = subprocess.Popen([os.path.join(BINDIR, 'propcheck'), gmsfile, os.path.join(dir, f.split('.')[0] + '.gdx')],
                              stdout = subprocess.PIPE);
        prop = p.communicate()[0];
        if p.returncode != 0 :
            print >> sys.stderr, 'Return code', p.returncode, 'from calling propcheck on', f;
            continue;

        prop_str = '[root]\n' + prop;
        prop_fp = StringIO.StringIO(prop_str);
        config = ConfigParser.RawConfigParser();
        config.readfp(prop_fp);

        infeas = config.getfloat('root', 'solinfeasibility');
        obj = config.getfloat('root', 'solobjvalue');
                
        print '\tInfeasibility  :', infeas;
        print '\tObjective value:', obj;

        if infeas > metadata.FEASTOL :
            print '\t-> too infeasible';
            continue;

        if bestprimal is not None and sense * obj > sense * bestprimal - 1e-6 * max(1, abs(bestprimal)) :
            print '\t-> too unoptimal';
            continue;
                
        print '\t-> new point';

        gdxfile = os.path.join(metadata.DATADIR, 'gdx', m + '.gdx');
        #assert not os.path.exists(gdxfile);
        shutil.copyfile(os.path.join(dir, f.split('.')[0] + '.gdx'), gdxfile);

        # TODO update instead of overwrite (see below)
        infofile = open(os.path.join(metadata.METADIR, m + '.info'), 'w');
        if solver is not None :
            print >> infofile, 'SOLSOURCE = Solution found by', solver, ('running with ' + settings + ' settings') if settings is not None else '';
        infofile.close();

        # update propfile of instance
        propfile = os.path.join(metadata.METADIR, m + '.prop');
        assert os.path.exists(propfile);
        newprop = '';
        for l in open(propfile, 'r') :
            if not l.startswith('SOL') :
                newprop += l;
        newprop += prop;
        print >> open(propfile, 'w'), newprop,;

        updates.append([m, infeas, obj, bestprimal if bestprimal is not None else float('nan')])
    return updates;

if __name__ == '__main__' :
    updates = [];
    for dir in sys.argv[1:] :
        updates += updateprimal(dir);
    for u in updates :
       print '{0:<30s} infeas {1:5g} newobj {2:20f} oldobj {3:20f}'.format(u[0], u[1], u[2], u[3]);
