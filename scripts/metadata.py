#!/usr/bin/python2

import os;
import sys;
import datetime;
import StringIO;
import ConfigParser;
try :
    import pandas as pd;
    _havepandas = True;
except ImportError :
    _havepandas = False;

FEASTOL = 1e-6;
OPTTOL = 1e-9;
GAPTOL = 1e-6;
ZEROGAPTOL = 1e-9;
TRUSTTHRESHOLD = 3;

BASEDIR = os.path.join(os.path.dirname(__file__), '..');
DATADIR = os.path.join(BASEDIR, 'data');
METADIR = os.path.join(DATADIR, 'meta');

INSTANCEINFOATTRS = {
    'source' : str,
    'descr' : str,
    'application' : str,
    'references': lambda x: x.split(),
    'formats' : lambda x: set(x.split()),
    'adddate' : lambda x : datetime.datetime.strptime(x, '%Y-%m-%d'),
    'removedate' : lambda x : datetime.datetime.strptime(x, '%Y-%m-%d'),
    'removereason' : str,
    'objcurvature' : str,
    'conscurvature' : str
    }

INSTANCEPROPATTRS = {
    'nvars' : int,
    'ncons' : int,
    'nbinvars' : int,
    'nintvars' : int,
    'nsemi' : int,
    'nnlvars' : int,
    'nnlbinvars' : int,
    'nnlintvars' : int,
    'nnlsemi' : int,
    'nsos1' : int,
    'nsos2' : int,
    'objtype' : str,
    'nlincons' : int,
    'nquadcons' : int,
    'npolynomcons' : int,
    'nsignomcons' : int,
    'ngennlcons' : int,
    'nloperands' : lambda x: set(x.split()),
    'nobjnz' : int,
    'nobjnlnz' : int,
    'njacobiannz' : int,
    'njacobiannlnz' : int,
    'nlaghessiannz' : int,
    'nlaghessiandiagnz' : int,
    'objsense' : str,
    'objcurvature' : str,
    'conscurvature' : str,
    'minobjcoef' : float,
    'minobjcoefvar' : str,
    'maxobjcoef' : float,
    'maxobjcoefvar' : str,
    'minjaccoef' : float,
    'minjaccoefvar' : str,
    'minjaccoefequ' : str,
    'maxjaccoef' : float,
    'maxjaccoefvar' : str,
    'maxjaccoefequ' : str,
    'minscale' : float,
    'minscalevar' : str,
    'minscaleequ' : str,
    'maxscale' : float,
    'maxscalevar' : str,
    'maxscaleequ' : str,
    'nlaghessianblocks' : int,
    'laghessianminblocksize' : int,
    'laghessianmaxblocksize' : int,
    'laghessianavgblocksize' : float
    }

INSTANCEFORMATS = (['ams', 'gms', 'lp', 'mod', 'nl', 'osil', 'pip']);

# TODO allow references for points
POINTINFOATTRS = {
    'descr' : str,
    'formats' : str,
    'adddate' : lambda x : datetime.datetime.strptime(x, '%Y-%m-%d'),
    #'removedate' : lambda x : datetime.datetime.strptime(x, '%Y-%m-%d')
    }

POINTPROPATTRS = {
    'objvalue' : float,
    'infeasibility' : float,
    'infeasscaled' : float,
    'minobjcoef' : float,
    'minobjcoefvar' : str,
    'maxobjcoef' : float,
    'maxobjcoefvar' : str,
    'minjaccoef' : float,
    'minjaccoefvar' : str,
    'minjaccoefequ' : str,
    'maxjaccoef' : float,
    'maxjaccoefvar' : str,
    'maxjaccoefequ' : str,
    'minscale' : float,
    'minscalevar' : str,
    'minscaleequ' : str,
    'maxscale' : float,
    'maxscalevar' : str,
    'maxscaleequ' : str
    }

POINTFORMATS = (['gdx', 'sol'])

SOURCELINKS = { }

def readinfo() :
    '''Reads .info files about instances and points from meta directory'''
    data = {};
    
    ls = os.listdir(METADIR);
    for f in ls :
        
        s = f.split('.');
        
        if len(s) < 2 :
            print 'skipping ' + f;
            continue;
        
        if s[-1] != 'info' and s[-1] != 'db':
            if s[-1] != 'prop' :
                print 'skipping ' + f;
            continue;

        assert len(s) in [2,3];

        modelname = s[0];
        
        pointname = None;
        if len(s) >= 3 :
            pointname = s[1];
            
        config = ConfigParser.RawConfigParser()
            
        info_str = '[root]\n' + open(os.path.join(METADIR, f), 'r').read();
        info_fp = StringIO.StringIO(info_str);
        config.readfp(info_fp);

        #config.write(sys.stdout);

        if modelname not in data :
            # first time we encounter this model
            data[modelname] = { 'points' : {}, 'dualbounds' : {} };

        if pointname is None :
            # read a model info file
            for optname, optvalue in config.items('root') :
                
                # skip empty entries
                if len(optvalue) == 0 :
                    continue;
                
                if optname not in INSTANCEINFOATTRS :
                    print >> sys.stderr, f + ':', 'Attribute', optname, 'not known for model instances, ignoring.';
                    continue;
                    
                data[modelname][optname] = INSTANCEINFOATTRS[optname](optvalue);
                
        else :
            # read a point info file
            data[modelname]['points'][pointname] = {};
            for optname, optvalue in config.items('root') :
                
                # skip empty entries
                if len(optvalue) == 0 :
                    continue;
                    
                if optname not in POINTINFOATTRS :
                    print >> sys.stderr, f + ':', 'Attribute', optname, 'not known for solution point, ignoring.';
                    continue;
                    
                data[modelname]['points'][pointname][optname] = POINTINFOATTRS[optname](optvalue);
                
    return data;

def readinfo_dummy() :
    '''Creates empty data entries for models (and points) that have a prop file'''
    data = {};
    
    ls = os.listdir(METADIR);
    for f in ls :
        
        s = f.split('.');
        
        if len(s) < 2 :
            print 'skipping ' + f;
            continue;
        
        if s[-1] != 'prop' :
            print 'skipping ' + f;
            continue;

        assert len(s) in [2,3];

        modelname = s[0];
        
        pointname = None;
        if len(s) >= 3 :
            pointname = s[1];
            
        config = ConfigParser.RawConfigParser()
            
        info_str = '[root]';
        info_fp = StringIO.StringIO(info_str);
        config.readfp(info_fp);

        #config.write(sys.stdout);

        if modelname not in data :
            # first time we encounter this model
            data[modelname] = { 'points' : {}, 'dualbounds' : {} };

        if pointname is None :
            # read a model info file
            for optname, optvalue in config.items('root') :
                
                # skip empty entries
                if len(optvalue) == 0 :
                    continue;
                
                if optname not in INSTANCEINFOATTRS :
                    print >> sys.stderr, f + ':', 'Attribute', optname, 'not known for model instances, ignoring.';
                    continue;
                    
                data[modelname][optname] = INSTANCEINFOATTRS[optname](optvalue);
                
        else :
            # read a point info file
            data[modelname]['points'][pointname] = {};
            for optname, optvalue in config.items('root') :
                
                # skip empty entries
                if len(optvalue) == 0 :
                    continue;
                    
                if optname not in POINTINFOATTRS :
                    print >> sys.stderr, f + ':', 'Attribute', optname, 'not known for solution point, ignoring.';
                    continue;
                    
                data[modelname]['points'][pointname][optname] = POINTINFOATTRS[optname](optvalue);
                
    return data;


def checkformats(data) :
    '''Checks in which formats model instances and solution points are available.'''
    
    for m, mattribs in data.iteritems() :
        mattribs['formats'] = set();
        for f in INSTANCEFORMATS :
            if os.access(os.path.join(DATADIR, f, m + '.' + f), os.R_OK) :
                mattribs['formats'].add(f);
                
        for p, pattribs in mattribs['points'].iteritems() :
            pattribs['formats'] = set();
            for f in POINTFORMATS :
                if os.access(os.path.join(DATADIR, f, m + '.' + p + '.' + f), os.R_OK) :
                    pattribs['formats'].add(f);
                        
def readprop(data) :
    '''Reads property files about instances and points.'''
    
    for m, mattribs in data.iteritems() :
        if not os.access(os.path.join(METADIR, m + '.prop'), os.R_OK) :
            # do not have .prop file
            continue;
            
        config = ConfigParser.RawConfigParser()
            
        info_str = '[root]\n' + open(os.path.join(METADIR, m + '.prop'), 'r').read();
        info_fp = StringIO.StringIO(info_str);
        config.readfp(info_fp);
        
        for optname, optvalue in config.items('root') :
            
            if optname not in INSTANCEPROPATTRS :
                print >> sys.stderr, m + '.prop :', 'Attribute', optname, 'not known for instance properties, ignoring.';
                continue;
            
            # store only if not already set, e.g., from .info file
            if optname not in mattribs :
                mattribs[optname] = INSTANCEPROPATTRS[optname](optvalue);

        for p, pattribs in mattribs['points'].iteritems() :
            
            if not os.access(os.path.join(METADIR, m + '.' + p + '.prop'), os.R_OK) :
                # do not have .prop file
                continue;
                
            config = ConfigParser.RawConfigParser()
                
            info_str = '[root]\n' + open(os.path.join(METADIR, m + '.' + p + '.prop'), 'r').read();
            info_fp = StringIO.StringIO(info_str);
            config.readfp(info_fp);
            
            for optname, optvalue in config.items('root') :
                
                if optname not in POINTPROPATTRS :
                    print >> sys.stderr, m + '.' + p + '.prop :', 'Attribute', optname, 'not known for point properties, ignoring.';
                    continue;
                
                # store only if not already set, e.g., from .info file
                if optname not in pattribs :
                    pattribs[optname] = POINTPROPATTRS[optname](optvalue);
                
        # so we can include it easily into the model html page
        mattribs['probtype'] = getprobtype(mattribs);

def readdualbounds(data) :
    '''Reads dual bound files of instances.'''
    
    for m, mattribs in data.iteritems() :
        if not os.access(os.path.join(METADIR, m + '.db'), os.R_OK) :
            # do not have .prop file
            continue;
            
        config = ConfigParser.RawConfigParser()
            
        #info_str = open(os.path.join(METADIR, m + '.prop'), 'r').read();
        #info_fp = StringIO.StringIO(info_str);
        #config.readfp(info_fp);
        config.readfp(open(os.path.join(METADIR, m + '.db'), 'r'));
        
        for solver in config.sections() :

            if not config.has_option(solver, 'dualbound') :
                continue;
            
            #print m, solver, config.getfloat(solver, 'dualbound');
            mattribs['dualbounds'][solver] = {};
            mattribs['dualbounds'][solver]['bound'] = config.getfloat(solver, 'dualbound');
            if config.has_option(solver, 'date') :
                mattribs['dualbounds'][solver]['date'] = datetime.datetime.strptime(config.get(solver, 'date'), '%Y-%m-%d');


def removePoints(data, mininfeas) :
    '''Removes points from meta data that have an (absolute) infeasibility of at least a certain value.'''
    for m, mattribs in data.iteritems() :
        for p in mattribs['points'].keys() :
            pattribs = mattribs['points'][p];
            if 'infeasibility' in pattribs and pattribs['infeasibility'] >= mininfeas :
                print 'remove', m, 'point', p, '(infeasibility =', pattribs['infeasibility'], ')';
                mattribs['points'].pop(p);

def checkdata(data) :
    for m, mattribs in data.iteritems() :
        #if 'adddate' not in mattribs :
        #    print >> sys.stderr, 'No addition date for instance', m;
        if 'removedate' not in mattribs :
            if len(mattribs['formats']) == 0 :
                print >> sys.stderr, 'No instance files found for instance', m;
            if 'gms' not in mattribs['formats'] :
                print >> sys.stderr, 'No GAMS file found for instance', m;
                
        else :
            if len(mattribs['formats']) > 0 :
                print >> sys.stderr, 'Instance', m, 'has removal date, but instance files exist:', mattribs['formats'];

            if len(mattribs['points']) > 0 :
                print >> sys.stderr, 'Instance', m, 'has removal date, but point meta information exist';
        
            if 'adddate' in mattribs and mattribs['removedate'] < mattribs['adddate'] :
                print >> sys.stderr, 'Removedate', mattribs['removedate'], 'before adddate', mattribs['adddate'], 'for instance', m;

        prevp = None;                
        prevadddate = None;
        for p in sorted(mattribs['points']) :
            pattribs = mattribs['points'][p];
            if 'adddate' not in pattribs :
                print >> sys.stderr, 'No addition date for point', p, 'of instance', m;
            else :
                if 'adddate' in mattribs and pattribs['adddate'] < mattribs['adddate'] :
                    print >> sys.stderr, 'Date', pattribs['adddate'], 'for point', p, 'is before date', mattribs['adddate'], 'of instance', m;
                
                # check that if points are in lexicographical order, then they are also in order of they adddate
                #if prevadddate is not None and prevadddate > pattribs['adddate'] :
                #    print >> sys.stderr, 'Date', prevadddate, 'for point', prevp, 'is later than date', pattribs['adddate'], 'of point', p, 'for instance', m;
                
                prevadddate = pattribs['adddate'];
                prevp = p;

            if len(pattribs['formats']) == 0 :
                print >> sys.stderr, 'No files found for point', p, 'of instance', m;
            if 'gdx' not in pattribs['formats'] :
                print >> sys.stderr, 'No GDX file found for point', p, 'of instance', m;
    
    # TODO check for instance / point files without .info file


def read() :
    data = readinfo_dummy();
    checkformats(data);
    readprop(data);
    readdualbounds(data);
        
    checkdata(data);
    
    removePoints(data, FEASTOL);
    
    return data;


def getbestprimal(instanceattribs) :
    sense = 1.0;
    if 'objsense' in instanceattribs :
        sense = 1.0 if instanceattribs['objsense'] == 'min' else -1.0;

    best = None;
    for pa in instanceattribs['points'].values() :
        if 'objvalue' in pa and (best is None or sense * best > sense * pa['objvalue']) :
            best = pa['objvalue'];
            
    return best;

def gettrusteddual(instanceattribs) :
    sense = 1.0;
    if 'objsense' in instanceattribs :
        sense = 1.0 if instanceattribs['objsense'] == 'min' else -1.0;

    allbounds = [];
    for dattribs in instanceattribs['dualbounds'].values() :
        assert 'bound' in dattribs;
        allbounds.append(dattribs['bound']);

    if len(allbounds) >= TRUSTTHRESHOLD :
        allbounds.sort(reverse = (sense < 0.0));
        return allbounds[-TRUSTTHRESHOLD];
    else :
        return None;

def gap(a, b) :
    if a is None or b is None :
        return float('inf');
    if a == b or abs(a - b) <= ZEROGAPTOL :  #the latter does not give true if both bounds are at the same infinity 
        return 0.0;
    if abs(a) <= ZEROGAPTOL or abs(b) <= ZEROGAPTOL or abs(a) >= float('inf') or abs(b) >= float('inf') or a * b < 0.0 :
        return float('inf');
    return abs(a - b) / min(abs(a), abs(b));

def gettrustedgap(instanceattribs) :
    bestprimal = getbestprimal(instanceattribs);
    bestdual = gettrusteddual(instanceattribs);
    
    return gap(bestprimal, bestdual);

def issolved(instanceattribs) :
    return gettrustedgap(instanceattribs) <= GAPTOL;

_negatedcurv = {'linear'     : 'linear',
                'convex'     : 'concave',
                'concave'    : 'convex',
                'indefinite' : 'indefinite',
                'nonconvex'  : 'nonconcave',
                'nonconcave' : 'nonconvex',
                'unknown'    : 'unknown'
                } 

def curvknown(instanceattribs) :
    return ('objcurvature' in instanceattribs) and (instanceattribs['objcurvature'] in ['linear', 'convex', 'concave', 'indefinite']) \
        and ('conscurvature' in instanceattribs) and (instanceattribs['conscurvature'] in ['linear', 'convex', 'concave', 'indefinite']);

def isconvex(instanceattribs) :
    if not curvknown(instanceattribs) :
        return False;
    
    objcurv = instanceattribs['objcurvature'];
    conscurv = instanceattribs['conscurvature'];
    
    if 'objsense' in instanceattribs and instanceattribs['objsense'] == 'max' :
        objcurv = _negatedcurv[objcurv];
            
    return objcurv in ['convex', 'linear'] and conscurv in ['convex', 'linear'];

def isnotconvex(instanceattribs) :
    if 'objcurvature' not in instanceattribs or 'conscurvature' not in instanceattribs : 
        return False;
    
    objcurv = instanceattribs['objcurvature'];
    conscurv = instanceattribs['conscurvature'];

    if 'objsense' in instanceattribs and instanceattribs['objsense'] == 'max' :
        objcurv = _negatedcurv[objcurv];

    return objcurv in ['concave', 'nonconvex', 'indefinite'] or conscurv in ['concave', 'nonconvex', 'indefinite'];

def getcoefrange(instanceattribs, regardinitial = True) :
    mincoef = float("inf");
    maxcoef = 0.0;
    for a in ([instanceattribs] if regardinitial else []) + instanceattribs['points'].values() :
        if 'minobjcoef' in a :
            mincoef = min(mincoef, a['minobjcoef']);
        if 'minjaccoef' in a :
            mincoef = min(mincoef, a['minjaccoef']);
        if 'maxobjcoef' in a :
            maxcoef = max(maxcoef, a['maxobjcoef']);
        if 'maxjaccoef' in a :
            maxcoef = max(maxcoef, a['maxjaccoef']);
    if maxcoef > 0.0 :
        return maxcoef / mincoef;
    elif mincoef <= maxcoef :  # max = 0 -> min = 0 -> 0/0 = 1
        return 1.0;
    else :
        return None;

def getprobtype(instanceattribs) :
    if 'nvars' not in instanceattribs :
        return '?';
    
    nvars = instanceattribs['nvars'];
    nbinvars = instanceattribs['nbinvars'] if 'nbinvars' in instanceattribs else 0;
    nintvars = instanceattribs['nintvars'] if 'nintvars' in instanceattribs else 0;
    nspecial = (instanceattribs['nsemi'] if 'nsemi' in instanceattribs else 0) \
        + (instanceattribs['nsos1'] if 'nsos1' in instanceattribs else 0) \
        + (instanceattribs['nsos2'] if 'nsos2' in instanceattribs else 0);
        
    objtype = instanceattribs['objtype'] if 'objtype' in instanceattribs else 'linear';
    #ncons = instanceattribs['ncons'] if 'ncons' in instanceattrs else 0;
    nlincons = instanceattribs['nlincons'] if 'nlincons' in instanceattribs else 0;
    nquadcons = instanceattribs['nquadcons'] if 'nquadcons' in instanceattribs else 0;
    nnonquadcons = instanceattribs['npolynomcons'] if 'npolynomcons' in instanceattribs else 0;
    nnonquadcons += instanceattribs['nsignomcons'] if 'nsignomcons' in instanceattribs else 0;
    nnonquadcons += instanceattribs['ngennlcons'] if 'ngennlcons' in instanceattribs else 0;

    s = '';
    if nvars == 0 :
        return 'P';
    
    if nbinvars == nvars :
        s += 'B'
    elif nintvars == nvars :
        s += 'I';
    elif nintvars > 0 :
        s += 'MI';
    elif nbinvars > 0 :
        s += 'MB'
    elif nspecial > 0 :
        s += 'S'
        
    if nnonquadcons > 0 or objtype in ['signomial', 'polynomial', 'nonlinear'] :
        # something more than quadratic -> *NLP 
        s += 'NLP';
    elif objtype == 'quadratic' and nquadcons > 0 :
        # quadratic obj, quad cons
        s += 'QCQP';
    elif objtype == 'quadratic' and nquadcons == 0 :
        # quadratic obj, linear cons
        s += 'QP'
    elif nquadcons > 0 :
        # linear obj, quad cons
        s += 'QCP'
    else :
        # linear obj, linear cons
        s += 'P';
    
    return s;

def getsourceids(instanceattribs) :
    sources = [];
    #if 'source' in instanceattribs :
    #    s = instanceattribs['source'];
        
    #if 'references' in instanceattribs :
    #    references = instanceattribs['references'];

    if len(sources) == 0 :
        sources = ['other'];
        
    return sources;

def todataframe(data, includeremoved = False) :
    if not _havepandas :
        return None;
    
    dfdata = {};
    pointdata = {};
    opdata = {};
    for m, mattribs in data.iteritems() :
        if not includeremoved and 'removedate' in mattribs :
            continue;
        
        d = mattribs.copy();
        
        d['nlinfunc'] = mattribs['nlincons'] + (1 if mattribs['objtype'] == 'linear' else 0);
        d['nquadfunc'] = mattribs['nquadcons'] + (1 if mattribs['objtype'] == 'quadratic' else 0);
        d['npolynomfunc'] = mattribs['npolynomcons'] + (1 if mattribs['objtype'] == 'polynomial' else 0);
        d['nsignomfunc'] = mattribs['nsignomcons'] + (1 if mattribs['objtype'] == 'signomial' else 0);
        d['ngennlfunc'] = mattribs['ngennlcons'] + (1 if mattribs['objtype'] == 'nonlinear' else 0);
        d['nnlfunc'] = d['nquadfunc'] + d['npolynomfunc'] + d['nsignomfunc'] + d['ngennlfunc'];
        d['nz'] = mattribs['nobjnz'] + mattribs['njacobiannz'];
        d['nlnz'] = mattribs['nobjnlnz'] + mattribs['njacobiannlnz'];
        d['ncontvars'] = mattribs['nvars'] - mattribs['nbinvars'] - mattribs['nintvars'] - mattribs['nsemi'] - mattribs['nsos1'] - mattribs['nsos2'];
        d['coefrange'] = getcoefrange(mattribs);
        d['gap'] = gettrustedgap(mattribs);
        d['convex'] = True if isconvex(mattribs) else False if isnotconvex(mattribs) else None;
        d['sourceids'] = getsourceids(mattribs);
        d['primalbound'] = getbestprimal(mattribs);
        d['dualbound'] = gettrusteddual(mattribs);

        del d['points'];
        del d['dualbounds'];

        if 'nloperands' in mattribs :
            for op in mattribs['nloperands'] :
                d['op'+op] = True;
        
        dfdata[m] = d;
        
        
        #for p, pattribs in mattribs['points'].iteritems() :
        #    pointdata[m+"."+p] = {'infeasibility' : pattribs['infeasibility']};
            


    df = pd.DataFrame.from_dict(dfdata, orient = 'index');
    df['density'] = df['nz'] / (df['nvars'] * (df['ncons']+1.0));
    df['nldensity'] = df['nlnz'] / (df['nnlvars'] * (df['nnlfunc'] + 0.0));
    
    df.index.name = 'name';
    
    return df;

    #pdf = pd.DataFrame.from_dict(pointdata, orient = 'index');
    

if __name__ == '__main__' :

    data = read();
    
    # write out id's of all used references
    #refs = set();
    #for model, vals in data.iteritems() :
    #    if 'references' in vals :
    #        for r in vals['references'] :
    #            refs.add(r);
    #print sorted(refs);
    
    exit(0);
    
    for model, vals in sorted(data.iteritems()) :
        print;
        print model;
        for opt, optval in vals.iteritems() :
            if opt == 'points' :
                continue;
                
            print ' '*5, opt, optval;
            
        for point, pointvals in vals['points'].iteritems() :
            print ' '*5, point;
            
            for opt, optval in pointvals.iteritems() :
                print ' '*10, opt, optval; #.replace('\n', ' ');
            
    
    #print data;
