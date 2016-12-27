#!/usr/bin/python

import os;
import datetime;

try :
    import matplotlib;
    
    matplotlib.use('agg');
    #matplotlib.use('svg');
    #matplotlib.rcParams['font.size'] = 16;
    
    import pandas as pd;
    import numpy as np;
    import matplotlib.pyplot as plt;
    
    _havepandas = True;
except ImportError :
    _havepandas = False;

import metadata;

HTMLDIR = os.path.join(metadata.BASEDIR, 'html');

def _saveplot(htmlout, name) :
    plt.savefig(os.path.join(HTMLDIR, name + '.png'));
    print >> htmlout, "<A href=" + name + ".png>", "<IMG height=300 src="+name+".png>", "</A>"; 

    #plt.savefig(os.path.join(HTMLDIR, name + '.pdf'), bbox_inches = 'tight');

def writehtml(data) :
    htmlout = open(os.path.join(HTMLDIR, "statistics.html"), 'w');
    print >> htmlout, '<HTML><HEAD>';
    print >> htmlout, '<TITLE>MINLPLib Statistics</TITLE>';
    print >> htmlout, '</HEAD>'
    print >> htmlout, '<!--#include virtual="/minlp/header.html" -->'
    print >> htmlout, '<BODY>';
    print >> htmlout, '<H3>MINLPLib Statistics</H3>';
    
    if not _havepandas :
        print >> htmlout, 'Python PANDAS not available, cannot generate statistics.';
        print >> htmlout, "</BODY></HTML>";
        htmlout.close();
        return
    
    df = metadata.todataframe(data);
    df['sourceids'] = df['sourceids'].map(lambda x : x[0]); # reduce to first source id
        
    ninstchange = {};
    pointdata = {};
    opdata = {};
    for m, mattribs in data.iteritems() :
        if 'adddate' in mattribs :
            date = mattribs['adddate'];
            if date not in ninstchange :
                ninstchange[date] = 0;  
            ninstchange[mattribs['adddate']] += 1;
        
        if 'removedate' in mattribs :
            date = mattribs['removedate'];
            if date not in ninstchange :
                ninstchange[date] = 0;  
            ninstchange[mattribs['removedate']] -= 1;
            continue;
                     
        for p, pattribs in mattribs['points'].iteritems() :
            pointdata[m+"."+p] = {'infeasibility' : pattribs['infeasibility']};
            
        if 'nloperands' in mattribs :
            d = {};
            for op in mattribs['nloperands'] :
                d[op] = True;
            opdata[m] = d;
            
    print >> htmlout, "<P>";
    plt.clf();
    n = pd.Series(ninstchange).cumsum();
    nold = n.select(lambda x : x <= datetime.datetime(2013, 3, 1));
    nnew = n.select(lambda x : x >= nold.index[-1]);
    plt.step(nold.index, nold.values, color = 'b', label = 'GLOBALLib + MINLPLib 1');
    plt.step(nnew.index, nnew.values, color = 'r', label = 'MINLPLib 2');
    plt.title('MINLPLib 2 - Number of Instances');
    plt.legend(loc = 'lower right');
    plt.xlim(nold.index[0], datetime.datetime.today() + datetime.timedelta(31));
    plt.ylim(0, None);
    #plt.xlim(nold.index[0], datetime.datetime(2013, 2, 1));
    #plt.ylim(0, 700);
    _saveplot(htmlout, 'ninstances');
    plt.close();
    print >> htmlout, "</P>";
    
    oldinstances = df['adddate'] <= datetime.datetime(2013, 3, 1);
    dfold = df[oldinstances];
    dfnew = df[~oldinstances];

    ninstances = len(df.index);

    # TODO add percentages?
    print >> htmlout, "<P>";
    plt.clf();
    sourcecounts = dfold['sourceids'].value_counts().reindex_like(df['sourceids'].value_counts().sort_values()).fillna(0);
    plt.pie(sourcecounts, labels = [x if sourcecounts[x] else '' for x in sourcecounts.index]);
    plt.title('GLOBALLib + MINLPLib 1 instance sources ('+str(len(dfold.index))+' in total)');
    plt.xlim(-1.7, 1.7);
    _saveplot(htmlout, 'source1');

    plt.clf();
    sourcecounts = df['sourceids'].value_counts().sort_values();
    plt.pie(sourcecounts, labels = sourcecounts.index);
    plt.title('MINLPLib 2 instance sources ('+str(ninstances)+' in total)');
    plt.xlim(-1.7, 1.7);
    _saveplot(htmlout, 'source2');
    print >> htmlout, "</P>";
    
    print >> htmlout, "<P>";
    plt.clf();
    ptypecounts = dfold['probtype'].value_counts();
    quad = pd.Series(ptypecounts.index.map(lambda x : x[-3:] == 'QCP' or x[-2:] == 'QP'), index = ptypecounts.index).sort_values();
    ptypecounts = ptypecounts.reindex_like(quad);
    #print ptypecounts.to_string();
    plt.pie(ptypecounts, labels = ptypecounts.index, colors = ['b' if x else 'r' for x in quad]);
    plt.title('GLOBALLib + MINLPLib 1 instances problem type');
    _saveplot(htmlout, 'probtype1');
    
    plt.clf();
    ptypecounts = df['probtype'].value_counts();
    quad = pd.Series(ptypecounts.index.map(lambda x : x[-3:] == 'QCP' or x[-2:] == 'QP'), index = ptypecounts.index).sort_values();
    ptypecounts = ptypecounts.reindex_like(quad);
    #print ptypecounts.to_string();
    plt.pie(ptypecounts, labels = ptypecounts.index, colors = ['b' if x else 'r' for x in quad]);
    plt.title('MINLPLib 2 instances problem type');
    _saveplot(htmlout, 'probtype2');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    plt.clf();
    plt.hist([dfold['nvars'].values, dfnew['nvars'].values], stacked = True, bins = np.logspace(0, np.log10(df['nvars'].max()), 15), color = ['b', 'r'], label = ['GLOBALLib + MINLPLib 1', 'new in MINLPLib 2']);
    plt.gca().set_xscale("log");
    plt.legend();
    plt.xlabel('Number of variables');
    plt.ylabel('Number of instances');
    plt.title('MINLPLib histogram w.r.t. #variables');
    _saveplot(htmlout, 'nvars');

    plt.clf();
    plt.hist([dfold['ncons'].values, dfnew['ncons'].values], stacked = True, bins = np.logspace(0, np.log10(df['ncons'].max()), 15), color = ['b', 'r'], label = ['GLOBALLib + MINLPLib 1', 'new in MINLPLib 2']);
    plt.gca().set_xscale("log");
    plt.legend();
    plt.xlabel('Number of constraints');
    plt.ylabel('Number of instances');
    plt.title('MINLPLib histogram w.r.t. #constraints');
    _saveplot(htmlout, 'ncons');
    print >> htmlout, "</P>";
    
    print >> htmlout, "<P>";
    print >> htmlout, "Scatter plots: Area of bubble corresponds to instance (nonlinear) density. ", "<BR>";
    print >> htmlout, "<FONT SIZE=-2>Density in left scatter plot is (#nonzeros in objective and jacobian) / (#vars * (#cons + 1)).", "<BR>";
    print >> htmlout, "Density in right scatter plot is (#nonlinear nonzeros in objective and jacobian) / (#nonlinear vars * (#nonlinear cons + 1 if objective is nonlinear)).", "<BR>";
    print >> htmlout, "Densities below 0.05 are shown as 0.05.";
    print >> htmlout, "</FONT><BR>"
    plt.clf();
    #print df[['nvars', 'ncons', 'nz', 'density']].sort('density').to_string();
    plt.scatter(dfold['nvars'], dfold['ncons']+1, s = 200 * dfold['density'].clip_lower(0.05), alpha = 0.5, c = 'b', label = 'GLOBALLib + MINLPLib 1');
    plt.scatter(dfnew['nvars'], dfnew['ncons']+1, s = 200 * dfnew['density'].clip_lower(0.05), alpha = 0.5, c = 'r', label = 'new in MINLPLib 2');
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.legend(loc = 'upper left');
    plt.xlabel('Number of variables');
    plt.ylabel('Number of constraints');
    plt.title('MINLPLib instances scatter plot');
    _saveplot(htmlout, 'sizescatter');

    plt.clf();
    plt.scatter(dfold['nnlvars'], dfold['nnlfunc'], s = 200 * dfold['nldensity'].clip_lower(0.05), alpha = 0.5, c = 'b', label = 'GLOBALLib + MINLPLib 1');
    plt.scatter(dfnew['nnlvars'], dfnew['nnlfunc'], s = 200 * dfnew['nldensity'].clip_lower(0.05), alpha = 0.5, c = 'r', label = 'new in MINLPLib 2');
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.legend(loc = 'upper left');
    plt.xlabel('Number of nonlinear variables');
    plt.ylabel('Number of nonlinear constraints');
    plt.title('MINLPLib instances scatter plot (nonlinear parts only)');
    _saveplot(htmlout, 'sizenlscatter');
    print >> htmlout, "</P>";
    
    
    print >> htmlout, "<P>";
    plt.clf();
    convex = df['convex'].sum();
    nonconvex = (df['convex'] == False).sum();
    all = len(df.index) + 0.0;
    unknown = all - df['convex'].count();
    plt.pie([convex if not np.isnan(convex) else 0, nonconvex, unknown],
            colors = ['b', 'r', 'c'],
            labels = ['convex\n{0:.0f}%'.format(100.0 * convex / all), 'nonconvex\n{0:.0f}%'.format(100.0 * nonconvex / all), 'undecided\n{0:.0f}%'.format(100.0 * unknown / all)]
            );
    plt.gca().set_aspect(1);
    plt.title('MINLPLib instances convexity');
    _saveplot(htmlout, 'convexity');

    plt.clf();
    convex = dfnew['convex'].sum();
    nonconvex = (dfnew['convex'] == False).sum();
    all = len(dfnew.index) + 0.0;
    unknown = all - dfnew['convex'].count();
    plt.pie([convex if not np.isnan(convex) else 0, nonconvex, unknown],
            colors = ['b', 'r', 'c'],
            labels = ['convex\n{0:.0f}%'.format(100.0 * convex / all), 'nonconvex\n{0:.0f}%'.format(100.0 * nonconvex / all), 'undecided\n{0:.0f}%'.format(100.0 * unknown / all)]
            );
    plt.gca().set_aspect(1);
    plt.title('MINLPLib 2 new instances convexity');
    _saveplot(htmlout, 'convexity2');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    print >> htmlout, "<FONT SIZE=-2>Coefficient range is quotient of maximal and minimal coefficient of objective gradient and Jacobian w.r.t. initial and available solution points of an instance.</FONT><BR>"
    plt.clf();
    plt.hist([dfold['coefrange'].values, dfnew['coefrange'].values], stacked = True, bins = np.logspace(0, np.log10(df['coefrange'].max()), 20), color = ['b', 'r'], label = ['GLOBALLib + MINLPLib 1', 'new in MINLPLib 2']);
    plt.gca().set_xscale("log");
    plt.legend();
    plt.xlabel('Coefficient range');
    plt.ylabel('Number of instances');
    plt.title('MINLPLib histogram w.r.t. coef. range');
    _saveplot(htmlout, 'coefrange');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    print >> htmlout, "<FONT SIZE=-2>Trusted gap is gap between primal bound and a dual bound that has been confirmed by at least 2 other solvers.</FONT><BR>"
    plt.clf();
    plt.hist([dfold['gap'].clip_upper(1.1).values, dfnew['gap'].clip_upper(1.1).values], stacked = True, bins = 11, color = ['b', 'r'], label = ['GLOBALLib + MINLPLib 1', 'new in MINLPLib 2'], align = 'left');
    plt.legend(loc = 'upper center');
    plt.xlabel('Trusted Gap');
    plt.ylabel('Number of instances');
    plt.title('MINLPLib histogram w.r.t. trusted gap');
    plt.xlim(-0.05, 1.05);
    _saveplot(htmlout, 'gap');
    print >> htmlout, "</P>";
    
    print >> htmlout, "<P>";
    print >> htmlout, "Scatter plots: Area of bubble corresponds to trusted gap (projected onto [0.01,1.0]).", "<BR>";
    plt.clf();
    plt.scatter(dfold['nvars'], dfold['ncons']+1, s = 200 * dfold['gap'].clip(0.01, 1.0), alpha = 0.5, c = 'b', label = 'GLOBALLib + MINLPLib 1');
    plt.scatter(dfnew['nvars'], dfnew['ncons']+1, s = 200 * dfnew['gap'].clip(0.01, 1.0), alpha = 0.5, c = 'r', label = 'new in MINLPLib 2');
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.legend(loc = 'upper left');
    plt.xlabel('Number of variables');
    plt.ylabel('Number of constraints');
    plt.title('MINLPLib instances scatter plot');
    _saveplot(htmlout, 'sizescattergap');

    plt.clf();
    plt.scatter(dfold['nnlvars'], dfold['nnlfunc'], s = 200 * dfold['gap'].clip(0.01, 1.0), alpha = 0.5, c = 'b', label = 'GLOBALLib + MINLPLib 1');
    plt.scatter(dfnew['nnlvars'], dfnew['nnlfunc'], s = 200 * dfnew['gap'].clip(0.01, 1.0), alpha = 0.5, c = 'r', label = 'new in MINLPLib 2');
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.legend(loc = 'upper left');
    plt.xlabel('Number of nonlinear variables');
    plt.ylabel('Number of nonlinear constraints');
    plt.title('MINLPLib instances scatter plot (nonlinear parts only)');
    _saveplot(htmlout, 'sizenlscattergap');
    print >> htmlout, "</P>";
    
    
    print >> htmlout, "<P>";
    pdf = pd.DataFrame.from_dict(pointdata, orient = 'index');
    plt.clf();
    plt.hist(pdf['infeasibility'].clip(1e-15, 1e10), bins = np.logspace(-15.0, 10.0, 20));
    plt.gca().set_xscale("log");
    plt.xlabel('Infeasibility');
    plt.ylabel('Number of points');
    plt.title('MINLPLib 2 solution points w.r.t. infeasibility');
    _saveplot(htmlout, 'infeasibility');
    print >> htmlout, "</P>";
    
    
    print >> htmlout, "<P>";
    
    quad = (df['nquadfunc'] > 0) & (df['npolynomfunc'] == 0) & (df['nsignomfunc'] == 0) & (df['ngennlfunc'] == 0);
    poly = (df['npolynomfunc'] >  0) & (df['nsignomfunc'] == 0) & (df['ngennlfunc'] == 0);
    signom = (df['nsignomfunc'] > 0) & (df['ngennlfunc'] == 0);
    gennl = (df['ngennlfunc'] > 0);
    label = ['quadratic', 'polynomial', 'signomial', 'general'];
    ninstanceold = [len(dfold[quad.reindex_like(dfold)].index), len(dfold[poly.reindex_like(dfold)].index), len(dfold[signom.reindex_like(dfold)].index), len(dfold[gennl.reindex_like(dfold)].index)];
    ninstancenew = [len(dfnew[quad.reindex_like(dfnew)].index), len(dfnew[poly.reindex_like(dfnew)].index), len(dfnew[signom.reindex_like(dfnew)].index), len(dfnew[gennl.reindex_like(dfnew)].index)];
    plt.clf();
    width = 0.8;
    ind = np.arange(len(label)) + 0.5;
    p1 = plt.bar(ind, ninstanceold, width, color='b');
    p2 = plt.bar(ind, ninstancenew, width, color='r', bottom = ninstanceold);
    plt.ylabel('Number of instances')
    plt.title('Equation Types');
    plt.xticks(ind+width/2., label);
    plt.legend( (p1[0], p2[0]), ('GLOBALLib + MINLPLib 1', 'new in MINLPLib 2') )
    plt.xlim(0.1, ind[-1] + 1.0);
    plt.ylim(0, len(df.index));
    _saveplot(htmlout, 'probtype3');
    
    odf = pd.DataFrame.from_dict(opdata, orient = 'index').reindex(oldinstances.index).fillna(False);
    odfold = odf[oldinstances];
    odfnew = odf[~oldinstances];
    opcountsold = odfold.sum().sort_values(ascending = False);
    opcountsnew = odfnew.sum().reindex_like(opcountsold);
    plt.clf();
    width = 0.8;
    ind = np.arange(len(opcountsold.index)) + 0.5;
    p1 = plt.bar(ind, opcountsold, width, color='b');
    p2 = plt.bar(ind, opcountsnew, width, color='r', bottom = opcountsold);
    plt.ylabel('Number of instances')
    plt.title('Operands in general nonlinear functions');
    plt.xticks(ind+width/2., opcountsold.index, rotation = 45);
    plt.legend( (p1[0], p2[0]), ('GLOBALLib + MINLPLib 1', 'new in MINLPLib 2') );
    plt.tight_layout();
    plt.xlim(ind[0], ind[-1]+width);
    plt.ylim(0, gennl.sum());
    _saveplot(htmlout, "operands");
    
    discrtypes = ['contvars', 'binvars', 'intvars', 'semi', 'sos1', 'sos2'];
    label = ['Continuous', 'Binary', 'Integer', 'SemiC/SemiI', 'SOS1', 'SOS2'];
    ninstanceold = [(dfold['n' + x] > 0).sum() for x in discrtypes];
    ninstancenew = [(dfnew['n' + x] > 0).sum() for x in discrtypes];
    plt.clf();
    width = 0.8;
    ind = np.arange(len(discrtypes)) + 0.5;
    p1 = plt.bar(ind, ninstanceold, width, color='b');
    p2 = plt.bar(ind, ninstancenew, width, color='r', bottom = ninstanceold);
    plt.ylabel('Number of instances')
    plt.title('Variable Types');
    plt.xticks(ind+width/2., label);
    plt.legend( (p1[0], p2[0]), ('GLOBALLib + MINLPLib 1', 'new in MINLPLib 2') )
    plt.xlim(0.1, ind[-1] + 1.0);
    plt.ylim(0, len(df.index));
    _saveplot(htmlout, "vartypes");
    
    print >> htmlout, "</P>";
    
    print >> htmlout, "</BODY></HTML>";
    htmlout.close();

def run() :
    data = metadata.read();
    writehtml(data);

if __name__ == '__main__' :
    run();
