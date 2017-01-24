#!/usr/bin/python2

import os;
import subprocess;
import datetime;
import sys

import metadata;
import bibtohtml;
import HTML;
import statistics;

BIBFILE = os.path.join(metadata.DATADIR, 'qplib.bib');
HTMLDIR = os.path.join(metadata.BASEDIR, 'html');
PNGDIR = os.path.join(metadata.DATADIR, 'png');

def _htmlheader(title) :
    return '''<HEAD>
        <STYLE>
        table.dataframe { text-align: right; font-size: 12px; border: 1px; border-collapse: collapse}
        </STYLE>
        <TITLE>''' + title + '''</TITLE>
        </HEAD>
    ''';

def _refstohtml(refs) :
    s = '';
    for r in refs :
        if not bibtohtml.hasref(bib, r) :
            raise BaseException('No entry for reference ' + r + ' in bibfile ' + BIBFILE);
        s += bibtohtml.tohtml(bib, r);
        s += '<BR>'

    return s;

def _formatstohtml(formats) :
    s = '';
    for f in sorted(formats) :
        s += '<A href="../data/' + f + '/' + instance + '.' + f + '">' + f + "</A> ";
    return s;

def _pointstohtml(points) :
    best = None;
    for p, pattribs in points.iteritems() :
        if 'objvalue' in pattribs and (best is None or objsense * pattribs['objvalue'] < objsense * best) :
            best = pattribs['objvalue'];
            
    s = '';
    for p, pattribs in sorted(points.iteritems()) :
        isbest = 'objvalue' in pattribs and abs(pattribs['objvalue'] - best) < metadata.OPTTOL;
        if 'adddate' in pattribs :
            s += '<div title="Added on ' + pattribs['adddate'].strftime("%d %b %Y") + '">';
        else :
            s += '<div>'
        if isbest :
            s += '<B>';
        if 'objvalue' in pattribs :
            s += '{0:.8f}'.format(pattribs['objvalue']);
        if isbest :
            s += '</B>';
        s += ' <A href=' + instance + '.' + p + '.html>' + p + '</A> ( ';
        for f in sorted(pattribs['formats']) :
            s += '<A href="../data/' + f + '/' + instance + '.' + p + '.' + f + '">' + f + "</A> ";
        s += ') ';
        if 'infeasibility' in pattribs :
            s += ' <FONT SIZE=-1>(infeas: {0:.1g})'.format(pattribs['infeasibility']) + '</FONT>';
        s += '</div>'
    return s;

def _dualboundstohtml(dualbounds) :
    allbounds = [];
    for dattribs in dualbounds.values() :
        assert 'bound' in dattribs;
        allbounds.append(dattribs['bound']);
        
    best = None;
    if len(allbounds) >= 3 :
        allbounds.sort(reverse = (objsense < 0.0));
        best = allbounds[-3];
        
    s = '';
    for solver, dattribs in sorted(dualbounds.iteritems()) :
        if 'date' in dattribs :
            s += '<div title="Last updated: ' + dattribs['date'].strftime("%d %b %Y") + '">';
        else :
            s += '<div>';
        isbest = best is not None and (dattribs['bound'] * objsense >= best * objsense - metadata.OPTTOL);
        if isbest :
            s += '<B>'
        s += '{0:.8f}'.format(dattribs['bound']);
        if isbest :
            s += '</B>'
        s += ' (' + solver + ')'
        s += '</div>';

    return s;

def _sourcetohtml(source):
    s = str(source);
    return s;

# (attribute keys, string to print for it, conversion function for value)
# TODO get variable/equation names into table
INSTANCEATTRS = [
    ('formats', 'Formats', _formatstohtml),
    #('points', 'Primal Bounds', _pointstohtml),
    #('dualbounds', ['Dual Bounds', 'Up to 3rd best bound is in bold. See also the FAQ!'], _dualboundstohtml),
    ('references', 'References', _refstohtml),
    ('source', 'Source', _sourcetohtml),
    ('application', 'Application', str),
    ('adddate', 'Added to library', lambda x : x.strftime("%d %b %Y")),
    ('removedate', 'Removed from library', lambda x : x.strftime("%d %b %Y")),
    ('removereason', 'Removed because', str),
    ('probtype', 'Problem type', str),
    ('nvars', '#Variables', str),
    ('nbinvars', '#Binary Variables', str),
    ('nintvars', '#Integer Variables', str),
    ('nboundedvars', '#Bounded Variables', str),
    ('nsingleboundedvars', '#Variables with one bound', str),
    ('nnlvars', '#Nonlinear Variables', str),
    ('nnlbinvars', '#Nonlinear Binary Variables', str),
    ('nnlintvars', '#Nonlinear Integer Variables', str),
    ('objsense', 'Objective Sense', str),
    ('objtype', 'Objective type', str),
    ('objcurvature', 'Objective curvature', str),
    ('nobjnz', '#Nonzeros in Objective', str),
    ('nobjnlnz', '#Nonlinear Nonzeros in Objective', str),
    ('ncons', '#Constraints', str),
    ('nlincons', '#Linear Constraints', str),
    ('nquadcons', '#Quadratic Constraints', str),
    ('npolynomcons', '#Polynomial Constraints', str),
    ('nsignomcons', '#Signomial Constraints', str),
    ('ngennlcons', '#General Nonlinear Constraints', str),
    ('nloperands', 'Operands in Gen. Nonlin. Functions', ' '.join),
    ('conscurvature', 'Constraints curvature', str),
    ('nconvexnlcons', '#Convex Nonlinear Constraints', str),
    ('nconcavenlcons', '#Concave Nonlinear Constraints', str),
    ('nindefinitenlcons', '#Indefinite Nonlinear Constraints', str),
    ('njacobiannz', '#Nonzeros in Jacobian', str),
    ('njacobiannlnz', '#Nonlinear Nonzeros in Jacobian', str),
    ('nlaghessiannz', '#Nonzeros in (Upper-Left) Hessian of Lagrangian', str),
    ('nlaghessiannz', '#Nonzeros in Diagonal of Hessian of Lagrangian', str),
    ('nlaghessianblocks', '#Blocks in Hessian of Lagrangian', str),
    ('laghessianminblocksize', 'Minimal blocksize in Hessian of Lagrangian', str),
    ('laghessianmaxblocksize', 'Maximal blocksize in Hessian of Lagrangian', str),
    ('laghessianavgblocksize', 'Average blocksize in Hessian of Lagrangian', str),
    #('nsemi', ['#Semicontinuities', 'semicontinuous and semiinteger variables'], str),
    #('nnlsemi', ['#Nonlinear Semicontinuities', 'nonlinear semicontinuous and semiinteger variables'], str),
    #('nsos1', '#SOS type 1', str),
    #('nsos2', '#SOS type 2', str),
    ('minobjcoef', ['Min. Objective Grad.', 'w.r.t. initial point'], '{0:.4e}'.format),
    #'minobjcoefvar' : str,
    ('maxobjcoef', ['Max. Objective Grad.', 'w.r.t. initial point'], '{0:.4e}'.format),
    #'maxobjcoefvar' : str,
    ('minjaccoef', ['Min. Jacobian Entry', 'w.r.t. initial point'], '{0:.4e}'.format),
    #'minjaccoefvar' : str,
    #'minjaccoefequ' : str,
    ('maxjaccoef', ['Max. Jacobian Entry', 'w.r.t. initial point'], '{0:.4e}'.format),
    #'maxjaccoefvar' : str,
    #'maxjaccoefequ' : str,
    ('minscale', ['Min. Scale', 'w.r.t. initial point'], '{0:.4e}'.format),
    #'minscalevar' : str,
    #'minscaleequ' : str,
    ('maxscale', ['Max. Scale', 'w.r.t. initial point'], '{0:.4e}'.format)
    #'maxscalevar' : str,
    #'maxscaleequ' : str
    ]

def _writemodelpage(m, mattribs, bib) :
    
    page = open(os.path.join(HTMLDIR, m + '.html'), 'w');
    
    print >> page, '<HTML>', _htmlheader(m), '<BODY>';
    
    print >> page, '<H2>', m, '</H2>';
        
    #if 'references' in mattribs and len(mattribs['references']) > 0 :
    #    refs = mattribs['references'];
    #    print >> page, '<P>', '<B>Reference' + ('s' if len(refs)>1 else '') + ':</B>';
    #    print >> page, '<UL>';
    #    for r in refs :
    #        if r not in bib :
    #            raise BaseException('No entry for reference ' + r + ' of model ' + m + ' in bibfile ' + BIBFILE);
    #        print >> page, '<LI>', _reftostring(bib[r]), '</LI>';
    #    print >> page, '</UL>';
    #    print >> page, '</P>';

    if 'descr' in mattribs :
        print >> page, '<pre>' + mattribs['descr'] + '</pre>';

    global instance;
    instance = m;
    
    global objsense;
    objsense = 1.0 if 'objsense' not in mattribs or mattribs['objsense'] == "min" else -1.0;

    t = HTML.Table();
    
    for a in INSTANCEATTRS :
        if a[0] in mattribs :
            if isinstance(a[1], list) :
                title = '<B title="' + a[1][1] + '">' + a[1][0] + ':</B>'; 
            else :
                title = '<B>' + str(a[1]) + ':</B>';
            t.rows.append([title, a[2](mattribs[a[0]])]);
            
    if os.path.exists(os.path.join(PNGDIR, m + '.jac.png')) :
        s = '<img src=' + os.path.join('..', 'data', 'png', m + '.jac.png');
        if mattribs['nvars'] > 600 :
            s += ' width=600';
        s += ' title="black = linear, red = nonlinear"';
        s += '>';
        t.rows.append(['<B title="black = linear, red = nonlinear">Sparsity Jacobian:</B>', s]);

    if os.path.exists(os.path.join(PNGDIR, m + '.hess.png')) :
        s = '<img src=' + os.path.join('..', 'data', 'png', m + '.hess.png');
        if mattribs['nvars'] > 600 :
            s += ' width=600';
        s += '>';
        t.rows.append(['<B>Sparsity Lag. Hessian:</B>', s]);
            
    print >> page, t;
    
    #points = mattribs['points'];
    #if len(points) > 0 :
    #    print >> page, '<P>', '<B>Point' + ('s' if len(points)>1 else '') + ':</B>';
    #    print >> page, '<UL>';
    #    for p, pattribs in sorted(points.iteritems()) :
    #        print >> page, '<LI>', '<A href=' + m + '.' + p + '.html>' +  p + '</A> (';
    #        for f in sorted(pattribs['formats']) :
    #            print >> page, '<A href="../data/' + f + '/' + m + '.' + f + '.' + p + '">' + f + "</A> ";
    #        print >> page, ')</LI>';
    #    print >> page, '</UL>';
    #    print >> page, '</P>';
    
    if 'gms' in mattribs['formats'] :
        print >> page, '<HR><PRE>'
        #with open(os.path.join(HTMLDIR, '..', 'data', 'gms', m + '.gms')) as f:
        #    print >> page, f.read();
        print >> page, '<!--#include virtual="../data/gms/' + m + '.gms" -->';
        print >> page, '</PRE>';

    
    print >> page, '</BODY></HTML>';
    page.close();

def _pointformatstohtml(formats) :
    s = '';
    for f in sorted(formats) :
        s += '<A href="../data/' + f + '/' + instance + '.' + point + '.' + f + '">' + f + "</A> ";
    return s;

# (attribute keys, string to print for it, conversion function for value)
# TODO get variable/equation names into table
POINTATTRS = [
    ('formats', 'Formats', _pointformatstohtml),
    ('adddate', 'Added to library', lambda x : x.strftime("%d %b %Y")),
    ('objvalue', 'Objective Value', '{0:.6f}'.format),
    ('infeasibility', 'Infeasibility (absolute)', '{0:.4g}'.format),
    ('infeasscaled', 'Infeasibility (scaled)', '{0:.4g}'.format),
    ('minobjcoef', 'Min. Objective Grad.', '{0:.4e}'.format),
    #'minobjcoefvar' : str,
    ('maxobjcoef', 'Max. Objective Grad.', '{0:.4e}'.format),
    #'maxobjcoefvar' : str,
    ('minjaccoef', 'Min. Jacobian Entry', '{0:.4e}'.format),
    #'minjaccoefvar' : str,
    #'minjaccoefequ' : str,
    ('maxjaccoef', 'Max. Jacobian Entry', '{0:.4e}'.format),
    #'maxjaccoefvar' : str,
    #'maxjaccoefequ' : str,
    ('minscale', 'Min. Scale', '{0:.4e}'.format),
    #'minscalevar' : str,
    #'minscaleequ' : str,
    ('maxscale', 'Max. Scale', '{0:.4e}'.format)
    #'maxscalevar' : str,
    #'maxscaleequ' : str
    ]

def _writepointpage(m, p, pattribs) :

    page = open(os.path.join(HTMLDIR, m + '.' + p + '.html'), 'w');
    
    print >> page, '<HTML>', _htmlheader(m + ' - ' + p), '<BODY>';
    
    print >> page, '<H2>', '<A href=' + m + '.html>' + m + '</A> - point', p, '</H2>';

    if 'descr' in pattribs :
        print >> page, '<pre>' + pattribs['descr'] + '</pre>';

    global instance;
    instance = m;
    global point;
    point = p;

    t = HTML.Table();
    
    for a in POINTATTRS :
        if a[0] in pattribs :
            t.rows.append(['<B>' + a[1] + ':</B>', a[2](pattribs[a[0]])]);
            
    print >> page, t;

    #for f in sorted(pattribs['formats']) :
    #    print >> page, '<A href="../data/' + f + '/' + m + '.' + f + '.' + p + '">' + f + "</A> ";

    if 'sol' in pattribs['formats'] :
        print >> page, '<HR><PRE>'
        #with open(os.path.join(HTMLDIR, '..', 'data', 'sol', m + '.' + p + '.sol')) as f:
        #    print >> page, f.read();
        print >> page, '<!--#include virtual="../data/sol/' + m + '.' + p + '.sol" -->';
        print >> page, '</PRE>';

    print >> page, '</BODY></HTML>';
    page.close();
    
def _writeinstancepage(data) :

    instances = open(os.path.join(HTMLDIR, 'instances.html'), 'w');
    print >> instances, '<HTML>', _htmlheader("QPLIB Instance Listing"), '<BODY>';
    print >> instances, '<H3>QPLIB Instance Listing</H3>'

    print >> instances, '<link rel="stylesheet" type="text/css" href="../datatables/media/css/jquery.dataTables.css">'
    print >> instances, '<script type="text/javascript" language="javascript" src="../datatables/media/js/jquery.js"></script>'
    print >> instances, '<script type="text/javascript" language="javascript" src="../datatables/media/js/jquery.dataTables.js"></script>'
    print >> instances, '<script type="text/javascript" language="javascript" src="../datatables/extensions/FixedHeader/js/dataTables.fixedHeader.js"></script>'
    print >> instances, '<script type="text/javascript" language="javascript" class="init">'
    print >> instances, 'jQuery.fn.dataTableExt.oSort["numWithNull-asc"] = function(a,b) {'
    print >> instances, 'var x = parseInt(a);'
    print >> instances, 'var y = parseInt(b);'
    print >> instances, 'return ((isNaN(x) || x < y) ? -1 : ((isNaN(y) || x > y) ? 1 : 0));'
    print >> instances, '};'
    print >> instances, 'jQuery.fn.dataTableExt.oSort["numWithNull-desc"] = function(a,b) {'
    print >> instances, 'var x = parseInt(a);'
    print >> instances, 'var y = parseInt(b);'
    print >> instances, 'return ((isNaN(x) || x < y) ? 1 : ((isNaN(y) || x > y) ? -1 : 0));'
    print >> instances, '};'
    print >> instances, '$(document).ready(function() {'
    print >> instances, 'var table = $("#instancelisting").dataTable({"iDisplayLength": -1, "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],'

    print >> instances, '"columnDefs":[ {"type": "numWithNull", "targets": [5,6]} ],'
    
    print >> instances, '"aoColumns": ['
    print >> instances, '{"sType": "string" },'
    print >> instances, '{"bSortable": false},'
    print >> instances, '{"sType": "string" },'
    print >> instances, '{"sType": "string" },'
    print >> instances, 'null,'
    print >> instances, 'null,'
    print >> instances, 'null,'
    print >> instances, 'null,'
    #print >> instances, 'null,'
    #print >> instances, 'null,'
    print >> instances, 'null,'
    #print >> instances, 'null,'
    #print >> instances, 'null,'
    #print >> instances, '{"bSortable": false},'
    #print >> instances, '{"bSortable": false},'
    #print >> instances, '{"bSortable": false}
    print >> instances, ']});'
    print >> instances, 'new $.fn.dataTable.FixedHeader( table );'
    print >> instances, '} );'
    print >> instances, '</script>'


    
    col_align = ['left', 'left', 'left'] + ['right'] * 6;

    t = HTML.Table([], col_align = col_align, border = 0, style = '', cellspacing = 0, cellpadding = 2, attribs = {'id' : 'instancelisting', 'class' : 'compact display'},
    header_row = [
        HTML.TableCell('Name', attribs = {'title' : 'Instance Name', 'align': 'left'}, header = True),
        HTML.TableCell('Formats', attribs = {'title' : 'Available Fileformats', 'align': 'left'}, header = True),
        HTML.TableCell('Type', attribs = {'title' : 'Problem type', 'align': 'left'}, header = True),
        HTML.TableCell('C', attribs = {'title' : 'Continuous Relaxation proven to be convex?', 'align': 'center'}, header = True),
        HTML.TableCell('#Vars', attribs = {'title' : 'Number of Variables', 'align': 'center'}, header = True),
        HTML.TableCell('#BinVars', attribs = {'title' : 'Number of Binary Variables', 'align': 'center'}, header = True),
        HTML.TableCell('#IntVars', attribs = {'title' : 'Number of Integer Variables', 'align': 'center'}, header = True),
        HTML.TableCell('#Cons', attribs = {'title' : 'Number of Constraints (equations)', 'align': 'center'}, header = True),
        #HTML.TableCell('#SOS', attribs = {'title' : 'Number of Special Ordered Set Constraints', 'align': 'center'}, header = True),
        #HTML.TableCell('#Semi', attribs = {'title' : 'Number of Semicontinuity/Semiintegrality Constraints', 'align': 'center'}, header = True),
        HTML.TableCell('#NZ', attribs = {'title' : 'Number of Nonzeros in Jacobian and Objective', 'align': 'center'}, header = True),
        #HTML.TableCell('CoefRange', attribs = {'title' : 'Quotient maximal by minimal coefficient of objective gradient and Jacobian w.r.t. initial and solution points.', 'align': 'center'}, header = True),
        #HTML.TableCell('S', attribs = {'title' : 'Proven optimal value by at least 3 solvers?', 'align': 'center'}, header = True),
        #HTML.TableCell('Dual Bound', attribs = {'title' : 'Dual bound as reported by at least 3 solvers', 'align': 'right'}, header = True),
        #HTML.TableCell('Primal Bound', attribs = {'title' : 'Best known objective value', 'align': 'right'}, header = True),
        #HTML.TableCell('Points', attribs = {'title' : 'Available Solution Points', 'align': 'left'}, header = True)
    ]);
    
    count = 0;
    for m, mattribs in sorted(data.iteritems()) :
        
        # skip removed instances here
        if 'removedate' in mattribs :
            continue;
                
        row = [HTML.TableCell('<A href=' + m + '.html>' + m + '</A>')];
        
        formats = '';
        for f in sorted(mattribs['formats']) :
            formats += '<A href="../data/' + f + '/' + m + '.' + f + '">' + f + "</A> ";
        row.append(HTML.TableCell(formats));

        def inttostr(x) :
            if x == 0 :
                return '';
            return str(x);

        row.append(HTML.TableCell(mattribs['probtype']));
        row.append(HTML.TableCell('*' if metadata.isconvex(mattribs) else '-' if metadata.isnotconvex(mattribs) else ''));
        row.append(HTML.TableCell(inttostr(mattribs['nvars']) if 'nvars' in mattribs else '?'));
        row.append(HTML.TableCell(inttostr(mattribs['nbinvars']) if 'nbinvars' in mattribs else '?'));
        row.append(HTML.TableCell(inttostr(mattribs['nintvars']) if 'nintvars' in mattribs else '?'));
        row.append(HTML.TableCell(str(mattribs['ncons']) if 'ncons' in mattribs else '?'));
        #row.append(HTML.TableCell(inttostr(mattribs['nsos1'] + mattribs['nsos2']) if 'nsos1' in mattribs and 'nsos2' in mattribs else '?'));
        #row.append(HTML.TableCell(inttostr(mattribs['nsemi']) if 'nsemi' in mattribs else '?'));
        row.append(HTML.TableCell(inttostr(mattribs['njacobiannz'] + mattribs['nobjnz']) if 'njacobiannz' in mattribs and 'nobjnz' in mattribs else '?'));
        #range = metadata.getcoefrange(mattribs);
        #row.append(HTML.TableCell('{0:.2e}'.format(range) if range is not None else '?'));
        #row.append(HTML.TableCell('*' if metadata.issolved(mattribs) else '&nbsp;'));
        #bestdual = metadata.gettrusteddual(mattribs);
        #bestprimal = metadata.getbestprimal(mattribs);
        #row.append(HTML.TableCell('{0:.4f}'.format(bestdual) if bestdual is not None else '')); # TODO treat unboundedness / infeasibility
        #row.append(HTML.TableCell('{0:.4f}'.format(bestprimal) if bestprimal is not None else '')); # TODO treat unboundedness / infeasibility

        points = '';
        for p, pattribs in sorted(mattribs['points'].iteritems()) :
            #_writepointpage(m, p, pattribs);
            points += '<A href=' + m + '.' + p + '.html>';
            if 'objvalue' in pattribs and abs(pattribs['objvalue'] - bestprimal) < metadata.OPTTOL :
                points += '<B>' + p + '</B>'
            else :
                points += p
            points += '</A> ';
        #row.append(HTML.TableCell(points));
        
        t.rows.append(HTML.TableRow(row, bgcolor = '#e0e0e0' if (count % 25) % 2 else "#fefefe"));
        count += 1;

    # fix <thead>
    tStr = str(t)
    tStr = tStr.replace('<TR>', '<THEAD bgcolor="white"><TR>', 1)
    tStr = tStr.replace('</TR>', '</TR></THEAD><TBODY>', 1)
    tStr = tStr.replace('</TABLE>', '</TBODY></TABLE>', 1)
    print >> instances, '<P>', tStr, '</P>';
    
    print >> instances, '<P>'
    print >> instances, '<B>Number of instances:', count, '</B><BR>';
    #print >> instances, 'Feasibility tolerance:', metadata.FEASTOL, '(points with absolute infeasibility of at least', metadata.FEASTOL, 'are not shown)', '<BR>';
    #print >> instances, 'Optimality tolerance:', metadata.OPTTOL, '(points with objective value difference below', metadata.OPTTOL, 'are considered equally good)', '<BR>';
    #print >> instances, 'Gap tolerance:', metadata.GAPTOL, '(dual bounds within', metadata.GAPTOL, 'of primal bound indicate instance as solved)';
    print >> instances, '</P>';
    

    # print removed instances    
    count = 0;
    t = HTML.Table([HTML.TableRow(['Name', 'Removal Date', 'Reason'], header = True)], border = 0, style = '', cellspacing = 0, cellpadding = 2);
    for m, mattribs in sorted(data.iteritems()) :
        
        # skip removed instances here
        if 'removedate' not in mattribs :
            continue;
        
        row = [HTML.TableCell('<A href=' + m + '.html>' + m + '</A>')];
        
        row.append(HTML.TableCell(mattribs['removedate'].strftime("%d %b %Y")));
        row.append(HTML.TableCell(mattribs['removereason'] if 'removereason' in mattribs else '?'));
        
        t.rows.append(HTML.TableRow(row));
    
    if len(t.rows) > 1 :
       print >> instances, '<P>Removed Instances:<BR>', t, '</P>';
    
    print >> instances, '</BODY></HTML>';
    instances.close();
    
def _writeauthorspage(data) :
    
    author2instance = {};
    author2ref = {};
    
    for m, mattribs in data.iteritems() :
        if 'removedate' in mattribs :
            continue;
        
        if 'references' not in mattribs :
            continue;
        
        for ref in mattribs['references'] :
            assert bibtohtml.hasref(bib, ref);
            authors = bibtohtml.getauthors(bib, ref);
            
            for a in authors :
                a = a.encode('ascii', 'xmlcharrefreplace');
                if a not in author2instance :
                    author2instance[a] = set([m]);
                else :
                    author2instance[a].add(m);
                
                if a not in author2ref :
                    author2ref[a] = set([ref]);
                else :
                    author2ref[a].add(ref);
                
    page = open(os.path.join(HTMLDIR, 'authors.html'), 'w');
    print >> page, '<HTML><HEAD>', _htmlheader("MINLPLib 2 Instance Listing by Author"), '</HEAD><BODY>';
    print >> page, '<H3>MINLPLib Instance Listing by Author</H3>'

    #print >> page, '<H4>Authors:</H4>';
    print >> page, '<TABLE width=100%>';
    count = 0;
    for a in sorted(author2instance.keys(), key = lambda s: s.lower()) :
        if count == 0 :
            print >> page, '<TR>';
        print >> page, '<TD>', '<A href="#' + a + '">' + a + '</A>', '</TD>';
        if count == 4 :
            print >> page, '</TR>';
        count = (count + 1) % 5;
    if count != 0 :
        print >> page, '</TR>';
    print >> page, '</TABLE>';

    print >> page, '<HR>';
            
    for a, instances in sorted(author2instance.iteritems(), key = lambda s: s[0].lower()) :
        print >> page, '<P>';
        print >> page, '<A name="'+a+'"><B>', a + ':', '</B></A>';
        print >> page, '<UL>'
        
        for ref in author2ref[a] :
            print >> page, '<LI>', bibtohtml.tohtml(bib, ref), '</LI>';
            
        print >> page, '<LI>', 'Instances:';
        print >> page, '<UL>';
        for m in sorted(instances) :
            print >> page, '<LI>', '<A href='+m+'.html>' + m + '</A>', '</LI>';
        print >> page, '</UL>';
        
        print >> page, '</UL>';
        print >> page, '</P>';

    print >> page, '</BODY></HTML>';
    page.close();
    
def _writesourcepage(data) :
    source2instance = {};    
    
    for m, mattribs in data.iteritems() :
        if 'removedate' in mattribs :
            continue;
        
        sources = metadata.getsourceids(mattribs);
        for s in sources :
            if s not in source2instance :
                source2instance[s] = [m];
            else :
                source2instance[s].append(m);

    page = open(os.path.join(HTMLDIR, 'sources.html'), 'w');
    print >> page, '<HTML><HEAD>', _htmlheader("MINLPLib 2 Instance Listing by Source"), '</HEAD><BODY>';
    print >> page, '<H3>MINLPLib Instance Listing by Source</H3>'

    print >> page, '<TABLE width=100%>';
    count = 0;
    for s in sorted(source2instance.keys(), key = lambda s: s.lower()) :
        if count == 0 :
            print >> page, '<TR>';
        print >> page, '<TD>', '<A href="#' + s + '">' + s + '</A>', '</TD>';
        if count == 4 :
            print >> page, '</TR>';
        count = (count + 1) % 5;
    if count != 0 :
        print >> page, '</TR>';
    print >> page, '</TABLE>';

    print >> page, '<HR>';

    for s, instances in sorted(source2instance.iteritems(), key = lambda s: s[0].lower()) :
        print >> page, '<P>';
        print >> page, '<A name="'+s+'"><B>';
        if s in metadata.SOURCELINKS :
            print >> page, '<A href="' + metadata.SOURCELINKS[s] + '">' + s + '</A>:';
        else :
            print >> page, s, ':';
        print >> page, '</B></A>';
        print >> page, '<UL>'
        for m in sorted(instances) :
            print >> page, '<LI>', '<A href='+m+'.html>' + m + '</A>', '</LI>';
        print >> page, '</UL>';
        print >> page, '</P>';

    print >> page, '</BODY></HTML>';
    page.close();

def _writeapplicationspage(data) :
    app2instance = {};    
    
    for m, mattribs in data.iteritems() :
        if 'removedate' in mattribs :
            continue;
        
        if 'application' not in mattribs :
            continue;
        
        app = mattribs['application'] if 'application' in mattribs else 'Other';
        if app not in app2instance :
            app2instance[app] = [m];
        else :
            app2instance[app].append(m);
        
    page = open(os.path.join(HTMLDIR, 'applications.html'), 'w');
    print >> page, '<HTML><HEAD>', _htmlheader("MINLPLib 2 Instance Listing by Application"), '</HEAD><BODY>';
    print >> page, '<H3>MINLPLib Instance Listing by Application</H3>'

    print >> page, '<TABLE width=100%>';
    count = 0;
    for a in sorted(app2instance.keys(), key = lambda s: s.lower()) :
        if count == 0 :
            print >> page, '<TR>';
        print >> page, '<TD>', '<A href="#' + a + '">' + a + '</A>', '</TD>';
        if count == 4 :
            print >> page, '</TR>';
        count = (count + 1) % 5;
    if count != 0 :
        print >> page, '</TR>';
    print >> page, '</TABLE>';

    print >> page, '<HR>';

    for app, instances in sorted(app2instance.iteritems(), key = lambda s: s[0].lower()) :
        print >> page, '<P>';
        print >> page, '<A name="'+app+'"><B>', app, ':', '</B></A>';
        print >> page, '<UL>'
        for m in sorted(instances) :
            print >> page, '<LI>', '<A href='+m+'.html>' + m + '</A>',;
            if 'descr' in data[m] :
                print >> page, '<BR>';
                print >> page, '<FONT SIZE=-2>', data[m]['descr'], '</FONT>';
            print >> page, '</LI>';
        print >> page, '</UL>';
        print >> page, '</P>';

    print >> page, '</BODY></HTML>';
    page.close();
    
def _writedatepage(data) :
    
    date2instance = {};
    
    for m, mattribs in data.iteritems() :
        date = mattribs['adddate'];
        
        if date not in date2instance :
            date2instance[date] = {'added' : [m], 'removed' : []};
        else :
            date2instance[date]['added'].append(m);
        
        if 'removedate' not in mattribs :
            continue;
        
        date = mattribs['removedate'];
        if date not in date2instance :
            date2instance[date] = {'added' : [], 'removed' : [m]};
        else :
            date2instance[date]['removed'].append(m);
        
    page = open(os.path.join(HTMLDIR, 'dates.html'), 'w');
    print >> page, '<HTML><HEAD>', _htmlheader("MINLPLib 2 Instance Listing by Date"), '</HEAD><BODY>';
    print >> page, '<H3>MINLPLib Instance Listing by Date</H3>'

    for date, instances in sorted(date2instance.iteritems(), reverse = True) :
        if len(instances['added']) > 0 :
            print >> page, '<P>';
            print >> page, '<B>', date.strftime('%Y-%m-%d'), ' added:', '</B>';
            print >> page, '<UL>'
            for m in sorted(instances['added']) :
                print >> page, '<LI>', '<A href='+m+'.html>' + m + '</A>', '</LI>';
            print >> page, '</UL>';
            print >> page, '</P>';
            
        if len(instances['removed']) > 0 :
            print >> page, '<P>';
            print >> page, '<B>', date.strftime('%Y-%m-%d'), ' removed:', '</B>';
            print >> page, '<UL>'
            for m in sorted(instances['removed']) :
                print >> page, '<LI>', '<A href='+m+'.html>' + m + '</A>',;
                if 'removereason' in data[m] :
                    print >> page, '<BR>';
                    print >> page, '<FONT SIZE=-1>', data[m]['removereason'], '</FONT>';
                print >> page, '</LI>';
            print >> page, '</UL>';
            print >> page, '</P>';

    print >> page, '</BODY></HTML>';
    page.close();

    
def writehtml() :
    data = metadata.read();
    
    global bib;
    bib = bibtohtml.readbib(BIBFILE);
        
    if not os.access(HTMLDIR, os.F_OK) :
        os.mkdir(HTMLDIR);
        
    if not os.access(HTMLDIR, os.X_OK | os.W_OK) :
        raise BaseException('Cannot write into directory ' + HTMLDIR);

    # write pages for each model and point
    for m, mattribs in data.iteritems() :
        _writemodelpage(m, mattribs, bib);
        
        # skip removed instances for points
        if 'removedate' in mattribs :
            continue;
        
        for p, pattribs in mattribs['points'].iteritems() :
            _writepointpage(m, p, pattribs);
        
    index = open(os.path.join(HTMLDIR, 'index.html'), 'w');
    print >> index, '<HTML><HEAD>', _htmlheader("QPLIB"), '</HEAD><BODY>';
    print >> index, '<H2>QPLIB</H2>'
    
    print >> index, '<P><FONT SIZE=-1>'
    #p = subprocess.Popen(['svnversion', metadata.BASEDIR], stdout = subprocess.PIPE);
    #svnrev = p.communicate()[0];
    #if p.returncode != 0 :
    #   print >> sys.stderr, 'Return code', p.returncode, 'from calling svnversion';
    #else :
    #   print >> index, 'Current revision:', svnrev;
    print >> index, 'Date:', datetime.datetime.today().strftime('%Y-%m-%d');
    print >> index, '</FONT></P>';
    
    #print >> index, '<P>Since 2001, the Mixed-Integer Nonlinear Programming Library (MINLPLib) and the Nonlinear Programming Library (GLOBALLib) have provided algorithm developers with a large and varied set of both theoretical and practical test models.';
    #print >> index, 'We have recently started with major updates to MINLPLib (now incorporating also NLPs), which includes the addition of many more instances.';
    #print >> index, 'We hope that the updated library can be a starting point to define a widely accepted test set to evaluate the performance of MINLP solving software.'
    #print >> index, '</P>';
    #print >> index, '<P>';
    #print >> index, 'Note, that the development of this update to the MINLPLib currently in <B>ALPHA</B> phase.';
    #print >> index, 'That is, while the library already provides more instances, more solution points, and more information on each instance than the first MINLPLib, it is still possible that instances are added, removed, or modified without notice.'
    #print >> index, '</P>'
    print >> index, '<UL>';

    # write instance statistics page
    _writeinstancepage(data);
    print >> index, '<LI>', '<A href=instances.html>Browse QPLIB by instance name</A>',;
    
    #rawdata = metadata.todataframe(data);
    #if rawdata is not None :
    #    alldata = open(os.path.join(HTMLDIR, 'allinstancedata.csv'), 'w');
    #    print >> alldata, "<HTML><HEAD>", _htmlheader("MINLPLib 2 Instance Data"), "</HEAD><BODY>";
    #    print >> alldata, rawdata.to_csv(sep = ';');
    #    print >> alldata, "</BODY></HTML>";
    #    alldata.close();
    #    print >> index, '<FONT SIZE=-2>(<A href=allinstancedata.html>raw data</A>)</FONT>', '</LI>';
    print >> index, '<FONT SIZE=-1>(<A href="../instancedata.csv">raw data</A>)</FONT>', '</LI>';
    print >> index, '<BR>'
    
    #_writeauthorspage(data);
    #print >> index, '<LI>', '<A href=authors.html>Browse MINLPLib by author</A>', '</LI>';

    #_writesourcepage(data);
    #print >> index, '<LI>', '<A href=sources.html>Browse MINLPLib by source</A>', '</LI>';

    #_writeapplicationspage(data);
    #print >> index, '<LI>', '<A href=applications.html>Browse MINLPLib by application</A>', '</LI>';

    #_writedatepage(data);
    #print >> index, '<LI>', '<A href=dates.html>Browse MINLPLib by date</A>', '</LI>';
    
    statistics.writehtml(data);
    print >> index, '<LI>', '<A href=statistics.html>QPLIB Statistics</A>', '</LI>';
    
    #print >> index, '<BR>';
    print >> index, '<LI>', '<A href=../qplib.zip>Download QPLIB</A>', '(<!--#fsize virtual="../qplib.zip" -->)', '</LI>';
    
    print >> index, '</UL>'
    
    #print >> index, '<H3><A name="FAQ"/>Frequently Asked Questions</H3>'
    #print >> index, '<UL>'
    #print >> index, '<LI><I>What are the default bounds on variables in a GAMS model?</I>'
    #print >> index, '<P>See <A href="http://www.gams.com/help/topic/gams.doc/userguides/userguide/_u_g__variables.html?cp=0_2_0_1_4#UG_Variables_VariableTypes">the GAMS User\'s Guide</A>.'
    #print >> index, '<B>However</B>, MINLPLib 2 works around the default upper bound of 100 for integer variables by setting the option <tt>intvarup=0</tt> (see, e.g., model <a href="jit1.html">jit1</a>).'
    #print >> index, 'Therefore, for integer variables a default lower bound of 0 and a default upper bound of +infinity is assumed.</P></LI>'
    
    #print >> index, '<LI><I>Do the reported solution points and dual bounds allow to rank the performance of solvers?</I>'
    #print >> index, '<P><B>No.</B> New solutions are usually only added when improving the primal bound. If several solvers find the same solution, it is random which solver is attributed to that solution.'
    #print >> index, 'Further, the reported dual bounds are just the best value as computed in some run with some option settings on some machine at some time in the past.</P></LI>'

    #print >> index, '</UL>'
    #print >> index, '<H3>Call for Instances</H3>'
    #print >> index, '<P>We are looking for more interesting and challenging (MI)NLPs from all fields of Operations Research and Combinatorial Optimization, ideally those which have been built to model real life problems.<BR>';
    #print >> index, 'If you would like to contribute, please send your instances by <A href="mailto:stefan@gams.com">e-mail</A>.';
    #print >> index, 'We accept any well-known format that can be translated into GAMS. This includes AMPL (.mod and .nl), GAMS, ZIMPL, BARON, CPLEX LP, MPS, PIP, and OSiL.</P>'
    #print >> index, '<P>Further, if you have a MINLP model that you would like to discuss with other people, be reminded of the <A href="http://www.minlp.org">minlp.org initiative</A>.';
    #print >> index, 'We are monitoring minlp.org and add model instantiations from minlp.org to MINLPLib.</P>';
    
    print >> index, '</BODY></HTML>';
    index.close();
    
    
if __name__ == '__main__' :
    writehtml();
