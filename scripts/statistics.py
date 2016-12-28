#!/usr/bin/env python2.7

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
    print >> htmlout, '<TITLE>QPLIB Statistics</TITLE>';
    print >> htmlout, '</HEAD>'
    print >> htmlout, '<!--#include virtual="/minlp/header.html" -->'
    print >> htmlout, '<BODY>';
    print >> htmlout, '<H3>QPLIB Statistics</H3>';
    
    if not _havepandas :
        print >> htmlout, 'Python PANDAS not available, cannot generate statistics.';
        print >> htmlout, "</BODY></HTML>";
        htmlout.close();
        return
    
    df = metadata.todataframe(data);
    
    ninstances = len(df.index);

    print >> htmlout, "<P>";
    plt.clf();
    ptypecounts = df['probtype'].value_counts();
    cont = pd.Series(ptypecounts.index.map(lambda x : x[0] == 'Q'), index = ptypecounts.index).sort_values();
    ptypecounts = ptypecounts.reindex_like(cont);
    #print ptypecounts.to_string();
    plt.pie(ptypecounts, labels = ptypecounts.index, colors = ['b' if x else 'r' for x in cont]);
    plt.title('problem type');
    _saveplot(htmlout, 'probtype');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    plt.clf();
    plt.hist(df['nvars'].values, bins = np.logspace(0, np.log10(df['nvars'].max()), 15));
    plt.gca().set_xscale("log");
    plt.legend();
    plt.xlabel('Number of variables');
    plt.ylabel('Number of instances');
    plt.title('histogram w.r.t. #variables');
    _saveplot(htmlout, 'nvars');

    plt.clf();
    plt.hist(df['ncons'].values, bins = np.logspace(0, np.log10(df['ncons'].max()), 15));
    plt.gca().set_xscale("log");
    plt.legend();
    plt.xlabel('Number of constraints');
    plt.ylabel('Number of instances');
    plt.title('histogram w.r.t. #constraints');
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
    plt.scatter(df['nvars'], df['ncons']+1, s = 200 * df['density'].clip_lower(0.05), alpha = 0.5, label = None);
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.legend(loc = 'upper left');
    plt.xlabel('Number of variables');
    plt.ylabel('Number of constraints');
    plt.title('instances scatter plot');
    _saveplot(htmlout, 'sizescatter');

    plt.clf();
    plt.scatter(df['nnlvars'], df['nnlfunc'], s = 200 * df['nldensity'].clip_lower(0.05), alpha = 0.5, label = None);
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.legend(loc = 'upper left');
    plt.xlabel('Number of nonlinear variables');
    plt.ylabel('Number of nonlinear constraints');
    plt.title('instances scatter plot (nonlinear parts only)');
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
    plt.title('instances convexity');
    _saveplot(htmlout, 'convexity');
    print >> htmlout, "</P>";    
    
    print >> htmlout, "<P>";
    
    discrtypes = ['contvars', 'binvars', 'intvars'];
    label = ['Continuous', 'Binary', 'Integer'];
    plt.clf();
    width = 0.8;
    ind = np.arange(len(discrtypes)) + 0.5;
    p1 = plt.bar(ind, [(df['n' + x] > 0).sum() for x in discrtypes], width);
    plt.ylabel('Number of instances')
    plt.title('Variable Types');
    plt.xticks(ind+width/2., label);
    #plt.legend( (p1[0], p2[0]), ('GLOBALLib + MINLPLib 1', 'new in MINLPLib 2') )
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
