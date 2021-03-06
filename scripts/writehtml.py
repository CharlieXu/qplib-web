#!/usr/bin/python2
# -*- coding: utf-8 -*-

import os;
import datetime;
import sys;
import shutil;
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
import bibtohtml;
import HTML;

BIBFILE = os.path.join(metadata.DATADIR, 'qplib.bib');
HTMLDIR = os.path.join(metadata.BASEDIR, 'html');
PNGDIR = os.path.join(metadata.DATADIR, 'png');

def _htmlheader(title) :
    return '''<HEAD>
        <META http-equiv="content-type" content="text/html;charset=UTF-8" />
        <META name="author" content="Stefan Vigerske, Ambros Gleixner" />
        <META name="description" content="QPLIB: A Library of Quadratic Programming Instances" />
        <META name="keywords" content="QPLIB" />
        <META name="robots" content="index|follow" />
        <link rel="stylesheet" type="text/css" href="qplib.css" />
        <TITLE>''' + title + '''</TITLE>
        </HEAD>
    ''';

def _htmlstartbody() :
    return '''<BODY>
    <div id="content">
      <h1>QPLIB</h1>
      <h2>A Library of Quadratic Programming Instances</h2>

      <a href="index.html">Home</a> //
      <a href="instances.html">browse instances</a> //
      <a href="statistics.html">view statistics</a> //
      <a href="doc.html">read documentation</a> //
      <a href="qplib.zip">download QPLIB archive [ <!--#fsize virtual="qplib.zip" --> ]</a>

      <hr />
    ''';

def _htmlendbody() :
    return '''<br /><br /><br /><hr />
      <p>
        Website &copy; 2017 by <a href="http://www.zib.de">Zuse Institute Berlin</a>. All rights reserved.
      <a href="http://www.zib.de/en/imprint.html">Imprint</a>.<br /><br />
      <!-- <a href="http://validator.w3.org/check/referer"><img class="logo" src="valid-xhtml11.png" alt="Valid XHTML 1.1!" /></a>&nbsp; -->
      <a href="http://jigsaw.w3.org/css-validator/check/referer"><img class="logo" src="valid-css.png" alt="Valid CSS!" /></a>
      </p>
    </div>

    </BODY>''';

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
        s += '<A href="' + f + '/' + instance + '.' + f + '">' + f + "</A> ";
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
            s += '<A href="' + f + '/' + instance + '.' + p + '.' + f + '">' + f + "</A> ";
        s += ') ';
        if 'infeasibility' in pattribs :
            s += ' <FONT SIZE=-1>(infeas: {0:.1g})'.format(pattribs['infeasibility']) + '</FONT>';
        s += '</div>'
    return s;

def _pointtohtml(solobjvalue) :
    s = '{0:.8f}'.format(solobjvalue);
    s += ' (<A href="gdx/' + instance + '.gdx">gdx</A>,';
    s += ' <A href="sol/' + instance + '.sol">sol</A>)';

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
INSTANCEATTRS = [
    ('formats', 'Formats', _formatstohtml),
    #('points', 'Primal Bounds', _pointstohtml),
    #('dualbounds', ['Dual Bounds', 'Up to 3rd best bound is in bold. See also the FAQ!'], _dualboundstohtml),
    ('references', 'References', _refstohtml),
    #('source', 'Source', _sourcetohtml),
    ('application', 'Application', str),
    ('adddate', 'Added to library', lambda x : x.strftime("%d %b %Y")),
    ('removedate', 'Removed from library', lambda x : x.strftime("%d %b %Y")),
    ('removereason', 'Removed because', str),
    ('probtype', 'Problem type', str),
    ('solobjvalue', 'Solution point objective value', _pointtohtml),
    ('solinfeasibility', 'Solution point infeasibility', '{0:.4e}'.format),
    ('donor', 'Donor', str),
    ('nvars', '#Variables', str),
    ('nbinvars', '#Binary Variables', str),
    ('nintvars', '#Integer Variables', str),
    ('nboundedvars', '#Bounded non-binary Variables', str),
    ('nsingleboundedvars', '#Variables with only one bound', str),
    ('nnlvars', '#Nonlinear Variables', str),
    ('nnlbinvars', '#Nonlinear Binary Variables', str),
    ('nnlintvars', '#Nonlinear Integer Variables', str),
    ('objsense', 'Objective Sense', str),
    ('objtype', 'Objective type', str),
    ('objcurvature', 'Objective curvature', str),
    ('nobjquadnegev', ['#Negative eigenvalues in objective matrix', 'eigenvalues below -1e-9 in coefficient matrix of quadratic part of objective'], int),
    ('nobjquadposev', ['#Positive eigenvalues in objective matrix', 'eigenvalues above  1e-9 in coefficient matrix of quadratic part of objective'], int),
    ('nobjnz', '#Nonzeros in Objective', str),
    ('nobjnlnz', '#Nonlinear Nonzeros in Objective', str),
    ('nobjquadnz', ['#Quadratic Terms in Objective', 'number of square and bilinear terms'], str),
    ('nobjquaddiagnz', '#Square Terms in Objective', str),
    ('ncons', '#Constraints', str),
    ('nlincons', '#Linear Constraints', str),
    ('nquadcons', '#Quadratic Constraints', str),
    ('ndiagquadcons', ['#Diagonal Quadratic Constraints', 'only square and linear terms'], str),
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
    ('nlaghessiandiagnz', '#Nonzeros in Diagonal of Hessian of Lagrangian', str),
    ('nlaghessianblocks', '#Blocks in Hessian of Lagrangian', str),
    ('laghessianminblocksize', 'Minimal blocksize in Hessian of Lagrangian', str),
    ('laghessianmaxblocksize', 'Maximal blocksize in Hessian of Lagrangian', str),
    ('laghessianavgblocksize', 'Average blocksize in Hessian of Lagrangian', str),
    #('nsemi', ['#Semicontinuities', 'semicontinuous and semiinteger variables'], str),
    #('nnlsemi', ['#Nonlinear Semicontinuities', 'nonlinear semicontinuous and semiinteger variables'], str),
    #('nsos1', '#SOS type 1', str),
    #('nsos2', '#SOS type 2', str)
    ]

def _writemodelpage(m, mattribs, bib) :
    
    page = open(os.path.join(HTMLDIR, m + '.html'), 'w');
    
    print >> page, '<HTML>', _htmlheader(m), _htmlstartbody();
    
    print >> page, '<H3>', m, '</H3>';
        
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

    t = HTML.Table(style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-collapse: collapse;", width="100%", border="0", cellpadding=5);
    rowstyle = "border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; border-collapse: collapse;"

    for a in INSTANCEATTRS :
        if a[0] in mattribs :
            if isinstance(a[1], list) :
                title = '<span title="' + a[1][1] + '">' + a[1][0] + '</span>';
            else :
                title = '<span>' + str(a[1]) + '</span>';
            if a[0] != 'formats' :
               title += ' <a href="doc.html#' + a[0] + '"><SUP>' + a[0] + '</SUP></a>';
            t.rows.append(HTML.TableRow([title, a[2](mattribs[a[0]])], attribs={"style":rowstyle}));
            
    if os.path.exists(os.path.join(PNGDIR, m + '.jac.png')) :
        s = '<img src=' + os.path.join('png', m + '.jac.png');
        if mattribs['nvars'] > 600 :
            s += ' width=600';
        s += ' title="black = linear, red = nonlinear"';
        s += '>';
        t.rows.append(HTML.TableRow(['<span title="black = linear, red = nonlinear">Sparsity Jacobian</span>', s], attribs={"style":rowstyle}));

    if os.path.exists(os.path.join(PNGDIR, m + '.hess.png')) :
        s = '<img src=' + os.path.join('png', m + '.hess.png');
        if mattribs['nvars'] > 600 :
            s += ' width=600';
        s += '>';
        t.rows.append(HTML.TableRow(['<span>Sparsity Lag. Hessian</span>', s], attribs={"style":rowstyle}));
            
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
        print >> page, '<H3>' + m + '.gms</H3>';
        print >> page, '<PRE>'
        #with open(os.path.join(HTMLDIR, '..', 'data', 'gms', m + '.gms')) as f:
        #    print >> page, f.read();
        print >> page, '<!--#include virtual="gms/' + m + '.gms" -->';
        print >> page, '</PRE>';

    
    print >> page, _htmlendbody(), '</HTML>';
    page.close();

def _pointformatstohtml(formats) :
    s = '';
    for f in sorted(formats) :
        s += '<A href="' + f + '/' + instance + '.' + point + '.' + f + '">' + f + "</A> ";
    return s;

# (attribute keys, string to print for it, conversion function for value)
POINTATTRS = [
    ('formats', 'Formats', _pointformatstohtml),
    ('adddate', 'Added to library', lambda x : x.strftime("%d %b %Y")),
    ('objvalue', 'Objective Value', '{0:.6f}'.format),
    ('infeasibility', 'Infeasibility (absolute)', '{0:.4g}'.format),
    ('infeasscaled', 'Infeasibility (scaled)', '{0:.4g}'.format)
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
        print >> page, '<!--#include virtual="sol/' + m + '.' + p + '.sol" -->';
        print >> page, '</PRE>';

    print >> page, '</BODY></HTML>';
    page.close();
    
def _writeinstancepage(data) :

    instances = open(os.path.join(HTMLDIR, 'instances.html'), 'w');
    print >> instances, '<HTML>', _htmlheader("QPLIB Instance Listing"), _htmlstartbody(), '''
<p>
This page lists all QPLIB instances. For column-wise filters, scroll to the <a href="#filter">end of the table</a>.
A file with the objective value of all solution points is available <a href="qplib.solu">here</a>.
</p>'''

    # create solu file
    soluout = open(os.path.join(HTMLDIR, 'qplib.solu'), 'w')
    for m, mattribs in data.iteritems() :
        if 'solobjvalue' in mattribs :
            obj = mattribs['solobjvalue'];
            print >> soluout, '=best= {0:25s} {1:30.16f}'.format(m, obj);
        else :
            print >> soluout, '=unkn=', m;
    soluout.close();

    print >> instances, '''
<link rel="stylesheet" type="text/css" href="DataTables/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="FixedHeader/css/fixedHeader.dataTables.min.css">
<script type="text/javascript" src="jQuery/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="DataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="FixedHeader/js/dataTables.fixedHeader.min.js"></script>
<script type="text/javascript" class="init">
jQuery.fn.dataTableExt.oSort["numWithNull-asc"] = function(a,b) {
  var x = parseFloat(a);
  var y = parseFloat(b);
  return ((isNaN(x) || x < y) ? -1 : ((isNaN(y) || x > y) ? 1 : 0));
};
jQuery.fn.dataTableExt.oSort["numWithNull-desc"] = function(a,b) {
  var x = parseFloat(a);
  var y = parseFloat(b);
  return ((isNaN(x) || x < y) ? 1 : ((isNaN(y) || x > y) ? -1 : 0));
};
$(document).ready(function() {
  var table = $("#instancelisting").DataTable({
    "paging": false,
    "fixedHeader" : { "header" : true, "footer" : true },  // fixing footer doesn't work when paging is disabled, unfortunately
    "columns": [
      {"type": "string" },  // Name and formats
      {"type": "string" },  // Cvx
      {"type": "string" },  // O
      {"type": "numWithNull"},  // Q0 density
      {"type": "numWithNull"},  // Q0 hard ev
      {"type": "string" },  // V
      null,  // Vars
      {"type": "numWithNull"},  // BinVars
      {"type": "numWithNull"},  // IntVars
      {"type": "string" },  // C
      null,  // Cons
      {"type": "numWithNull"},  // QuadCons
      null,  // NZ
    ]});

  // columns with numeric values for which we have InputMin/InputMax filter
  var numcols = [3,4,5,7,8,10,11,12];

  $.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
      var inputO = $('#InputO').val();
      if( inputO != "" && inputO.indexOf(data[2]) < 0 )
        return false;

      var inputV = $('#InputV').val();
      if( inputV != "" && inputV.indexOf(data[5]) < 0 )
        return false;

      var inputC = $('#InputC').val();
      if( inputC != "" && inputC.indexOf(data[9]) < 0 )
        return false;

      var inputCvx = $('#InputCvx').val();
      if( inputCvx == "Y" && data[1] == "-" )
        return false;
      if( inputCvx == "N" && data[1] != "-" )
        return false;

      for( var c in numcols ) {
         col = numcols[c];
         var min = parseFloat($('#InputMin' + col).val());
         var max = parseFloat($('#InputMax' + col).val());
         var colval = parseFloat(data[col]);
         if( isNaN(colval) )
            colval = 0;
         if( !isNaN(min) && colval < min )
            return false;
         if( !isNaN(max) && colval > max )
            return false;
      }

      return true;
    }
  );

  $('#InputCvx, #InputV, #InputO, #InputC').keyup( function() { table.draw(); } );
  for( var c in numcols ) {
     $('#InputMin' + numcols[c]).keyup( function() { table.draw(); } );
     $('#InputMax' + numcols[c]).keyup( function() { table.draw(); } );
  }
  $('#InputReset').click( function() { setTimeout(function(){table.draw();}, 500); } );
});
</script>'''

    col_align = ['left', 'center', 'center', 'right', 'right', 'center', 'right', 'right', 'right', 'center', 'right', 'right', 'right']

    t = HTML.Table([], border = 0, col_align = col_align, style = '', cellspacing = 0, cellpadding = 2, attribs = {'id' : 'instancelisting', 'class' : 'compact display'},
    header_row = [
        HTML.TableCell('Instance', attribs = {'title' : 'Name and fileformats'}, header = True),
        HTML.TableCell('<A href="doc.html#convex">Cvx</A>', attribs = {'title' : 'Continuous Relaxation convex'}, header = True),
        HTML.TableCell('<A href="doc.html#probtype">O</A>', attribs = {'title' : 'Objective type'}, header = True),
        HTML.TableCell('<A href="doc.html#objquaddensity">Q<sup>0</sup><br/>density</A>', attribs = {'title' : 'Objective density % in quad. part coef. matrix'}, header = True),
        HTML.TableCell('<A href="doc.html#objquadhardevfrac">Q<sup>0</sup><br/>hard ev</A>', attribs = {'title' : 'Objective hard eigenvalues % in quad. part coef. matrix'}, header = True),
        HTML.TableCell('<A href="doc.html#probtype">V</A>', attribs = {'title' : 'Variables type'}, header = True),
        HTML.TableCell('<A href="doc.html#nvars">Total</br>Vars.</A>', attribs = {'title' : 'Number of Variables'}, header = True),
        HTML.TableCell('<A href="doc.html#nbinvars">Binary<br/>Vars.</A>', attribs = {'title' : 'Number of Binary Variables'}, header = True),
        HTML.TableCell('<A href="doc.html#nintvars">Integer<br/>Vars.</A>', attribs = {'title' : 'Number of Integer Variables'}, header = True),
        HTML.TableCell('<A href="doc.html#probtype">C</A>', attribs = {'title' : 'Constraints type'}, header = True),
        HTML.TableCell('<A href="doc.html#ncons">Total<br/>Cons.</A>', attribs = {'title' : 'Number of Constraints (excluding variable bounds)'}, header = True),
        HTML.TableCell('<A href="doc.html#nquadcons">Quad.<br/>Cons.</A>', attribs = {'title' : 'Number of Quadratic Constraints'}, header = True),
        HTML.TableCell('<A href="doc.html#nz">Non-<br/>zeros</A>', attribs = {'title' : 'Number of Nonzeros in Jacobian and Objective'}, header = True),
    ]);
    
    bgcolor = '#e0e0e0';
    for m, mattribs in sorted(data.iteritems()) :
        
        # skip removed instances here
        if 'removedate' in mattribs :
            continue;
        
        formats = ', '.join('<A href="' + f + '/' + m + '.' + f + '">' + f + "</A>" for f in sorted(mattribs['formats']));

        probtype = mattribs['probtype'];

        def inttostr(x) :
            if x == 0 :
                return '';
            return str(x);

        row = [HTML.TableCell('<A href=' + m + '.html>' + m[6:] + '</A> <SUP>(' + formats + ')</SUP>')];
        row.append(HTML.TableCell('&#10004;' if metadata.isconvex(mattribs) else '-' if metadata.isnotconvex(mattribs) else ''));
        row.append(HTML.TableCell(probtype[0]));
        if mattribs['nobjnlnz'] > 0 :
           row.append(HTML.TableCell('{0:.1f}'.format(100.0*(2.0*mattribs['nobjquadnz']-mattribs['nobjquaddiagnz'])/(mattribs['nobjnlnz']*mattribs['nobjnlnz']))));
           row.append(HTML.TableCell('{0:.1f}'.format((100.0*(mattribs['nobjquadnegev'] if mattribs['objsense'] == 'min' else mattribs['nobjquadposev']))/mattribs['nvars'])));
        else :
           row.append(HTML.TableCell(''));
           row.append(HTML.TableCell(''));
        row.append(HTML.TableCell(probtype[1]));
        row.append(HTML.TableCell(inttostr(mattribs['nvars']) if 'nvars' in mattribs else '?'));
        row.append(HTML.TableCell(inttostr(mattribs['nbinvars']) if 'nbinvars' in mattribs else '?'));
        row.append(HTML.TableCell(inttostr(mattribs['nintvars']) if 'nintvars' in mattribs else '?'));
        row.append(HTML.TableCell(probtype[2]));
        row.append(HTML.TableCell(str(mattribs['ncons'])));
        row.append(HTML.TableCell(str(mattribs['nquadcons'])));
        row.append(HTML.TableCell(inttostr(mattribs['njacobiannz'] + mattribs['nobjnz']) if 'njacobiannz' in mattribs and 'nobjnz' in mattribs else '?'));

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
        
        t.rows.append(HTML.TableRow(row, bgcolor = bgcolor));
        bgcolor = "#fefefe" if bgcolor == '#e0e0e0' else '#fefefe';  # swap bgcolor

    # fix <thead>
    tStr = str(t)
    tStr = tStr.replace('<TR>', '<THEAD bgcolor="white"><TR>', 1)
    tStr = tStr.replace('</TR>', '</TR></THEAD><TBODY>', 1)
    tStr = tStr.replace('</TABLE>', '''</TBODY><TFOOT valign="top">
    <TR>
     <TH><a name="filter"></a>Filter:</br><input name="InputReset" id="InputReset" type="reset"/></TH>
     <TH title="Y or N"><input name="InputCvx" id="InputCvx" type="text" maxlength="1" size="1"/></TH>
     <TH title="C, D, L, or Q (0-3 times)"><input name="InputO" id="InputO" type="text" maxlength="3" size="1"/></TH>
     <TH align="right"><input title="min" name="InputMin7" id="InputMin7" type="text" size="1"/><BR/><input title="max" name="InputMax7" id="InputMax7" type="text" size="1"/></TH>
     <TH align="right"><input title="min" name="InputMin8" id="InputMin8" type="text" size="1"/><BR/><input title="max" name="InputMax8" id="InputMax8" type="text" size="1"/></TH>
     <TH title="B, C, G, I, or M (0-3 times)"><input name="InputV" id="InputV" type="text" maxlength="3" size="1"/></TH>
     <TH align="right"><input title="min" name="InputMin3" id="InputMin3" type="text" size="3"/><BR/><input title="max" name="InputMax3" id="InputMax3" type="text" size="3"/></TH>
     <TH align="right"><input title="min" name="InputMin4" id="InputMin4" type="text" size="3"/><BR/><input title="max" name="InputMax4" id="InputMax4" type="text" size="3"/></TH>
     <TH align="right"><input title="min" name="InputMin5" id="InputMin5" type="text" size="3"/><BR/><input title="max" name="InputMax5" id="InputMax5" type="text" size="3"/></TH>
     <TH title="C, D, L, N, or Q (0-3 times)"><input name="InputC" id="InputC" type="text" maxlength="3" size="1"/></TH>
     <TH align="right"><input title="min" name="InputMin10" id="InputMin10" type="text" size="3"/><BR/><input title="max" name="InputMax10" id="InputMax10" type="text" size="3"/></TH>
     <TH align="right"><input title="min" name="InputMin11" id="InputMin11" type="text" size="3"/><BR/><input title="max" name="InputMax11" id="InputMax11" type="text" size="3"/></TH>
     <TH align="right"><input title="min" name="InputMin12" id="InputMin12" type="text" size="3"/><BR/><input title="max" name="InputMax12" id="InputMax12" type="text" size="3"/></TH>
    </TR></TFOOT></TABLE>''', 1)

    print >> instances, '<P><FORM>', tStr, '</FORM></P>';


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
    
    print >> instances, _htmlendbody(), '</HTML>';
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


def _saveplot(htmlout, name) :
    plt.savefig(os.path.join(HTMLDIR, name + '.png'));
    print >> htmlout, "<A href=" + name + ".png>", "<IMG height=300 src="+name+".png>", "</A>";

    #plt.savefig(os.path.join(HTMLDIR, name + '.pdf'), bbox_inches = 'tight');

def _writestatistics(data) :
    htmlout = open(os.path.join(HTMLDIR, "statistics.html"), 'w');
    print >> htmlout, '<HTML>', _htmlheader("QPLIB Statistics"), _htmlstartbody();

    if not _havepandas :
        print >> htmlout, 'Python PANDAS not available, cannot generate statistics.';
        print >> htmlout, "</BODY></HTML>";
        htmlout.close();
        return

    print >> htmlout, '''<p>
        The following diagrams provide aggregated statistics on sources and characteristics of the instances in QPLIB.
        You can download the raw data in <a href="instancedata.csv">csv format</a>.
        The data fields are defined in the <a href="doc.html">documentation</a>.''';

    # create instancedata.csv
    df = metadata.todataframe(data);
    df.drop('source', axis = 1, inplace = True);  # drop SOURCE for now
    df.to_csv(os.path.join(HTMLDIR, 'instancedata.csv'));

    ninstances = len(df.index);

    print >> htmlout, "<h3>Problem types</h3>";
    print >> htmlout, '<P>For a definition of the <a href="doc.html#probtype">three letter problem classification</a> see the documentation.';
    #print >> htmlout, "<P>";
    #plt.clf();
    #ptypecounts = df['probtype'].value_counts();
    #cont = pd.Series(ptypecounts.index.map(lambda x : x[1] == 'C'), index = ptypecounts.index).sort_values();
    #ptypecounts = ptypecounts.reindex_like(cont);
    #plt.pie(ptypecounts, labels = ptypecounts.index, labeldistance = 1.2, colors = ['b' if x else 'r' for x in cont]);
    #plt.gca().set_aspect(1);
    ##plt.title('problem type');
    #_saveplot(htmlout, 'probtype');
    #print >> htmlout, "</P>";

    def simplifyprobtype(t) :
       r = '';
       r += 'C' if t[0] == 'D' else t[0];  # map objective D to C
       r += t[1];
       r += 'C' if t[2] == 'D' else t[2];  # map constraints D to C
       return r;
    discrtypecounts = df[df['nbinvars']+df['nintvars']>0]['probtype'].map(simplifyprobtype).value_counts().sort_index();  # non-continuous only
    discrtypecounts['total'] = discrtypecounts.sum();
    conttypecounts = df[df['nbinvars']+df['nintvars']==0]['probtype'].map(simplifyprobtype).value_counts().sort_index();  # continuous only
    conttypecounts['total'] = conttypecounts.sum();
    print >> htmlout, '<table><tr><th valign="top"><h4>Continuous Instances&nbsp;&nbsp;&nbsp;/</h4></th><th>&nbsp;&nbsp;&nbsp;</th><th valign="top"><h4>Discrete Instances</h4></th></tr>'
    print >> htmlout, '<tr><td valign="top">';
    print >> htmlout, pd.DataFrame(conttypecounts).to_html(header = False).replace('border="1"','border="0"').replace('<th>', '<th align="left">');
    print >> htmlout, '</td><td/><td valign="top">';
    print >> htmlout, pd.DataFrame(discrtypecounts).to_html(header = False).replace('border="1"','border="0"').replace('<th>', '<th align="left">');
    print >> htmlout, '</td></tr></table>';

    print >> htmlout, "<h3>Variable types</h3>";
    print >> htmlout, "<P>";
    discrtypes = ['contvars', 'binvars', 'intvars'];
    label = ['Continuous', 'Binary', 'Integer'];
    plt.clf();
    width = 0.8;
    ind = np.arange(len(discrtypes)) + 0.5;
    p1 = plt.bar(ind, [(df['n' + x] > 0).sum() for x in discrtypes], width);
    plt.ylabel('Number of instances')
    #plt.title('Variable Types');
    plt.xticks(ind+width/2., label);
    #plt.legend( (p1[0], p2[0]), ('GLOBALLib + MINLPLib 1', 'new in MINLPLib 2') )
    plt.xlim(0.1, ind[-1] + 1.0);
    plt.ylim(0, len(df.index));
    _saveplot(htmlout, "vartypes");
    print >> htmlout, "</P>";

    print >> htmlout, "<h3>Convexity</h3>";
    print >> htmlout, "<P>";
    print >> htmlout, 'Left: <a href="doc.html#convex">Convexity of the continuous relaxation</a>.'
    print >> htmlout, 'Right: <a href="doc.html#objquadhardevfrac">Fraction of hard eigenvalues</a> in the coefficient matrix of the objective function w.r.t. the total number of variables.';
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
    #plt.title('instances convexity');
    _saveplot(htmlout, 'convexity');

    plt.clf();
    negeigs = df[df['nobjquadnz']>0]['objquadhardevfrac'].sort_values() * 100.0;
    plt.plot(negeigs.values, color = 'r', marker = '+', linestyle = 'None');
    plt.xlabel('Instances with quadratic objective function');
    plt.ylabel('% hard eigenvalues in objective');
    plt.ylim(ymin = -1);
    _saveplot(htmlout, 'hardev');
    print >> htmlout, "</P>";

    print >> htmlout, "<h3>Problem sizes</h3>";
    print >> htmlout, "<P>";
    plt.clf();
    plt.hist(df['nvars'].values, bins = np.logspace(0, np.log10(df['nvars'].max()), 15));
    plt.gca().set_xscale("log");
    plt.xlabel('Number of variables');
    plt.ylabel('Number of instances');
    #plt.title('histogram w.r.t. #variables');
    _saveplot(htmlout, 'nvars_hist');

    plt.clf();
    varsize = df[['nvars']].copy();
    varsize['ndiscrvars' ] = df['nbinvars'] + df['nintvars'];
    varsize.sort_values('nvars', inplace = True);
    p1 = plt.plot(varsize['nvars'].values, color = 'r', marker = '+', linestyle = 'None');
    p2 = plt.plot(varsize['ndiscrvars'].values, color = 'blue', marker = 'x', linestyle = 'None');
    plt.gca().set_yscale("symlog");
    plt.ylim(ymin = -0.1);
    plt.legend( (p1[0], p2[0]), ('# variables', '# discrete variables'), loc = 'upper left' );
    plt.xlabel('Instances');
    #plt.title('Number of variables');
    _saveplot(htmlout, 'nvars');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    plt.clf();
    plt.hist(df['ncons'].values, bins = np.logspace(0, np.log10(df['ncons'].max()), 15));
    plt.gca().set_xscale("log");
    plt.xlabel('Number of constraints');
    plt.ylabel('Number of instances');
    #plt.title('histogram w.r.t. #constraints');
    _saveplot(htmlout, 'ncons_hist');

    plt.clf();
    conssize = df[['ncons']].copy();
    conssize['nquadcons' ] = df['nquadcons'];
    conssize.sort_values('ncons', inplace = True);
    p1 = plt.plot(conssize['ncons'].values, color = 'r', marker = '+', linestyle = 'None');
    p2 = plt.plot(conssize['nquadcons'].values, color = 'blue', marker = 'x', linestyle = 'None');
    plt.gca().set_yscale("symlog");
    plt.ylim(ymin = -0.1);
    plt.legend( (p1[0], p2[0]), ('# constraints', '# quadratic constraints'), loc = 'upper left' );
    plt.xlabel('Instances');
    #plt.title('Number of constraints');
    _saveplot(htmlout, 'ncons');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    plt.clf();
    continuous = df[df['nbinvars'] + df['nintvars'] == 0];
    discrete = df[df['nbinvars'] + df['nintvars'] > 0];
    p1 = plt.scatter(continuous['nvars'], continuous['ncons'], c = 'r', marker = '+');
    p2 = plt.scatter(discrete['nvars'], discrete['ncons'], c = 'blue', marker = 'x');
    plt.gca().set_xscale("log");
    plt.gca().set_yscale("symlog");
    plt.ylim(ymin = -0.1);
    plt.legend( (p1, p2), ('Continuous instances', 'Discrete instances'), loc = 'upper left' );
    plt.xlabel('Number of variables');
    plt.ylabel('Number of constraints');
    #plt.title('Distribution of number of variables and constraints');
    _saveplot(htmlout, 'nvarsncons');

    plt.clf();
    conssize = df[df['nquadcons']>0][['nquadcons','nconvexnlcons']].copy();
    conssize['nnonconvexquadcons' ] = (conssize['nquadcons'] - conssize['nconvexnlcons']);
    conssize.sort_values('nquadcons', inplace = True);
    p1 = plt.plot(conssize['nquadcons'].values, color = 'r', marker = '+', linestyle = 'None');
    p2 = plt.plot(conssize['nnonconvexquadcons'].values, color = 'blue', marker = 'x', linestyle = 'None');
    plt.gca().set_yscale("symlog");
    plt.ylim(ymin = -0.1);
    plt.legend( (p1[0], p2[0]), ('# quadratic constraints', '# nonconvex quadratic constraints'), loc = 'upper left' );
    plt.xlabel('Instances with at least one quadratic constraint');
    #plt.title('Number of quadratic constraints');
    _saveplot(htmlout, 'nquadcons');
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    plt.clf();
    nz = df[['nz','nlnz']].sort_values('nz');
    p1 = plt.plot(nz['nz'].values, color = 'r', marker = '+', linestyle = 'None');
    p2 = plt.plot(nz['nlnz'].values, color = 'blue', marker = 'x', linestyle = 'None');
    plt.gca().set_yscale("log");
    #plt.ylim(ymin = -0.1);
    plt.legend( (p1[0], p2[0]), ('# nonzeros', '# nonlinear nonzeros'), loc = 'upper left' );
    plt.xlabel('Instances');
    #plt.title('Number of nonzeros');
    _saveplot(htmlout, 'nz');
    print >> htmlout, "</P>";
    print >> htmlout, "<P>";
    print >> htmlout, 'See also the definition of <a href="doc.html#nz">nonzeros</a> and <a href="doc.html#nlnz">nonlinear nonzeros</a> in the documentation.';
    print >> htmlout, "</P>";


    print >> htmlout, "<h3>Density</h3>";
    print >> htmlout, "<P>";
    print >> htmlout, "In these scatter plots, each bubble represents an instance and the area of the bubble corresponds to the (nonlinear) density of the instance:", "<BR>";

    plt.clf();
    #print df[['nvars', 'ncons', 'nz', 'density']].sort('density').to_string();
    plt.scatter(df['nvars'], df['ncons']+1, s = 200 * df['density'].clip_lower(0.05), alpha = 0.5, label = None);
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.xlabel('Number of variables');
    plt.ylabel('Number of constraints');
    #plt.title('instances scatter plot');
    _saveplot(htmlout, 'sizescatter');

    plt.clf();
    plt.scatter(df['nnlvars'], df['nnlfunc'], s = 200 * df['nldensity'].clip_lower(0.05), alpha = 0.5, label = None);
    plt.gca().set_yscale("log");
    plt.gca().set_xscale("log");
    plt.xlabel('Number of nonlinear variables');
    plt.ylabel('Number of nonlinear constraints');
    #plt.title('instances scatter plot (nonlinear parts only)');
    _saveplot(htmlout, 'sizenlscatter');

    print >> htmlout, "<UL>";
    print >> htmlout, '<LI> The density in left scatter plot is defined as (<a href="doc.html#nz">#nonzeros</a>) / (<a href="doc.html#nvars">#vars</a> * (<a href="doc.html#ncons">#cons</a> + 1)).', "</LI>";
    print >> htmlout, '<LI> The density in right scatter plot is defined as (<a href="doc.html#nlnz">#nonlinear nonzeros</a>) / (<a href="doc.html#nnlvars">#nonlinear vars</a> * (<a href="doc.html#nquadcons">#quadratic cons</a> + 1 if <a href="doc.html#objtype">objective is nonlinear</a>)).', "</LI>";
    print >> htmlout, "<LI> Densities below 0.05 are shown as 0.05.", "</LI>";
    print >> htmlout, "</UL>"
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    print >> htmlout, 'The diagram below shows the instances with a quadratic objective function sorted according to the <a href="doc.html#objquaddensity">density of the quadratic objective function coefficient matrix</a>.';
    print >> htmlout, "</P>";

    print >> htmlout, "<P>";
    plt.clf();
    density = df[df['nobjquadnz']>0]['objquaddensity'].sort_values() * 100;
    plt.plot(density.values, color = 'r', marker = '+', linestyle = 'None');
    plt.xlabel('Instances with quadratic objective function');
    plt.ylabel('% density of objective coef. matrix');
    plt.ylim(ymin = -1);
    _saveplot(htmlout, 'objquaddensity');
    print >> htmlout, "</P>";

    print >> htmlout, _htmlendbody(), "</HTML>";
    htmlout.close();

def _writedocpage() :
    htmlout = open(os.path.join(HTMLDIR, "doc.html"), 'w');
    print >> htmlout, '<HTML>', _htmlheader("QPLIB Documentation"), _htmlstartbody();

    print >> htmlout, '''
        <script type="text/x-mathjax-config">
          MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/SVG"],
            SVG: { scale: 90 }
          });
        </script>
        <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js"></script>
    ''';

    docin = open(os.path.join(metadata.BASEDIR, "static/doc.inc"), 'r');
    docstring = docin.read();
    print >> htmlout, docstring;
    docin.close()

    print >> htmlout, _htmlendbody(), "</HTML>";
    htmlout.close();

def writehtml() :
    data = metadata.read();
    
    global bib;
    bib = bibtohtml.readbib(BIBFILE);
        
    if not os.access(HTMLDIR, os.F_OK) :
        os.mkdir(HTMLDIR);
        
    if not os.access(HTMLDIR, os.X_OK | os.W_OK) :
        raise BaseException('Cannot write into directory ' + HTMLDIR);

    # copy all files and directories from static/ except for doc.inc
    STATICDIR = os.path.join(metadata.BASEDIR, 'static');
    for f in os.listdir(STATICDIR) :
       if f != "doc.inc" :
          if os.path.isfile(os.path.join(STATICDIR, f)) :
             shutil.copy(os.path.join(STATICDIR, f), HTMLDIR);
          else :
             if os.path.exists(os.path.join(HTMLDIR, f)) :
                shutil.rmtree(os.path.join(HTMLDIR, f));
             shutil.copytree(os.path.join(STATICDIR, f), os.path.join(HTMLDIR, f));

    # copy all files from data/{gms,lp,mod,qplib,png,gdx,sol}
    for d in ['gms', 'lp', 'mod', 'qplib', 'png', 'gdx', 'sol'] :
       if os.path.exists(os.path.join(HTMLDIR, d)) :
          shutil.rmtree(os.path.join(HTMLDIR, d));
       if os.path.exists(os.path.join(metadata.DATADIR, d)) :
          shutil.copytree(os.path.join(metadata.DATADIR, d), os.path.join(HTMLDIR, d));

    # write pages for each model and point
    for m, mattribs in data.iteritems() :
        _writemodelpage(m, mattribs, bib);
        
        # skip removed instances for points
        if 'removedate' in mattribs :
            continue;
        
        for p, pattribs in mattribs['points'].iteritems() :
            _writepointpage(m, p, pattribs);

    # write landing page
    index = open(os.path.join(HTMLDIR, 'index.html'), 'w');
    print >> index, '<HTML>', _htmlheader("QPLIB: A Library of Quadratic Programming Instances"), _htmlstartbody();
    
    print >> index, '''      <p>
        This website hosts a collection of problem instances from the diverse class of <i>quadratic programming
        problems</i>.  Starting from 8,164&nbsp;submitted instances, the final version of QPLIB contains
        251&nbsp;discrete and 116&nbsp;continuous instances of different characteristics.'''
        # During this process, we
        #developed a taxonomy based on a three-fields code of the form <b>OVC</b>, where <b>O</b> indicates the objective
        #function, <b>V</b> the variables, and <b>C</b> the constraints of the problem. The fields can be given the
        #following values:
      #</p>
      #<ol>
      #  <li>objective function: (L)inear, (D)iagonal convex (if minimization) or concave (if maximization) quadratic, (C)onvex (if minimization) or (C)oncave (if maximization) quadratic, (Q)uadratic (all other cases);
      #  </li>
      #  <li>variables: (C)ontinuous only, (B)inary only, (M)ixed binary and continuous, (I)nteger (incl. binary) only, (G)eneral (all other cases);
      #  </li>
      #  <li>constraints: (N)one, (B)ox, (L)inear, (D)iagonal convex quadratic, (C)onvex quadratic, nonconvex (Q)uadratic.
      #  </li>
      #</ol>
    print >> index, '''
        For details on the library see the preprint
      </p>
      <ul>
        <li> Fabio Furini, Emiliano Traversi, Pietro Belotti, Antonio Frangioni, Ambros Gleixner, Nick Gould, Leo
          Liberti, Andrea Lodi, Ruth Misener, Hans Mittelmann, Nikolaos Sahinidis, Stefan Vigerske, and Angelika
          Wiegele. <a href="http://www.optimization-online.org/DB_HTML/2017/02/5846.html">QPLIB: A Library of Quadratic Programming Instances</a>, submitted to Mathematical
          Programming Computation, 2017
        </li>
      </ul>
      <p>
         and the <a href="statistics.html">statistics</a> and <a href="doc.html">documentation</a> pages on this website.
         When using QPLIB, please cite the article above.  The BibTeX entry is <a href="FuriniEtAl2017TR.bib">here</a>.
    </p>''';

    print >> index, '''      <h3>History and updates</h3>
      <ul>
        <li>October 26, 2017: Added feasible solution points obtained by running a variety of solvers with a 12 hour time limit.  All solutions satisfy integrality requirements and variable bounds exactly; absolute constraint violations should be 1e-9 or less.
        </li>
        <li>July 27, 2017: Fixed errors in the .qplib formatted versions of instances with quadratic constraints.
        </li>
        <li>May 5, 2017: Tightening the tolerance for zero eigenvalues lead to changes in convexity information for instances QPLIB_{2635,2881,9030}.
        </li>
        <li>May 4, 2017: Corrected convexity information for instances QPLIB_{2696,3049,3326,3554,3790,9048}.
        </li>
        <li>February 15, 2017: New instance file formats online: AMPL's .mod and our newly developed .qplib.
        </li>
        <li>February 6, 2017: The finalized instance selection for QPLIB&nbsp;2014 goes online.
        </li>
        <li>July 19, 2015: A first beta version containing 410&nbsp;discrete instances and 138&nbsp;continuous instances is online (<a href="http://www.lamsade.dauphine.fr/QPlib2014/doku.php?id=beta">here</a>).
        </li>
        <li>July 17, 2015: Emiliano Traversi presents on the collection and initial filtering of QPLIB instances at ISMP
        2015 in Pittsburgh (<a href="ismp2015.pdf">slides</a>).
        </li>
        <li>January 21, 2014: First call for instances is out on dmanet.  Until 2015, 8,164&nbsp;instances are submitted.
        </li>
      </ul>''';


    print >> index, '''      <h3>Committee</h3>
      <p>
        The following researchers have been involved in the creation of QPLIB:
      </p>
      <ul>
        <li> <a href="https://plus.google.com/+PietroBelotti" title="https://plus.google.com/+PietroBelotti">Pietro Belotti</a>, Xpress-Optimizer team, FICO
        </li>
        <li> <a href="http://www.di.unipi.it/~frangio/" title="http://www.di.unipi.it/~frangio/">Antonio Frangioni</a>, Dipartimento di Informatica, Università di Pisa
        </li>
        <li> <a href="http://www.lamsade.dauphine.fr/~furini" title="http://www.lamsade.dauphine.fr/~furini">Fabio Furini</a>, LAMSADE, Université Paris Dauphine
        </li>
        <li> <a href="http://www.zib.de/gleixner/" title="http://www.zib.de/gleixner/">Ambros Gleixner</a>, Department Optimization, Zuse Institute Berlin
        </li>
        <li> <a href="http://www.numerical.rl.ac.uk/people/nimg/nimg.html" title="http://www.numerical.rl.ac.uk/people/nimg/nimg.html">Nick Gould</a>, STFC-Rutherford Appleton Laboratory
        </li>
        <li> <a href="http://www.lix.polytechnique.fr/~liberti/" title="http://www.lix.polytechnique.fr/~liberti/">Leo Liberti</a>, CNRS LIX, Ecole Polytechnique
        </li>
        <li> <a href="https://www.gerad.ca/en/people/andrea-lodi" title="https://www.gerad.ca/en/people/andrea-lodi">Andrea Lodi</a>, Ecole Polytechnique de Montréal
        </li>
        <li> <a href="https://wp.doc.ic.ac.uk/rmisener/" title="https://wp.doc.ic.ac.uk/rmisener/">Ruth Misener</a>, Department of Computing, Imperial College London
        </li>
        <li> <a href="http://plato.la.asu.edu/" title="http://plato.la.asu.edu/">Hans Mittelmann</a>, School of Mathematical and Statistical Sciences, Arizona State University
        </li>
        <li> <a href="http://www.cheme.cmu.edu/people/faculty/ns1b.htm" title="http://www.cheme.cmu.edu/people/faculty/ns1b.htm">Nikolaos Sahinidis</a>, Chemical Engineering, Carnegie Mellon University
        </li>
        <li> <a href="http://lipn.univ-paris13.fr/~traversi/" title="http://lipn.univ-paris13.fr/~traversi/">Emiliano Traversi</a>, LIPN, Université de Paris 13
        </li>
        <li> <a href="http://www.gams.com/~stefan/" title="http://www.gams.com/~stefan/">Stefan Vigerske</a>, GAMS Software GmbH
        </li>
        <li> <a href="http://www.uni-klu.ac.at/~anwiegel/" title="http://www.uni-klu.ac.at/~anwiegel/">Angelika Wiegele</a>, Institut f&uuml;r Mathematik, Alpen-Adria-Universit&auml;t Klagenfurt
        </li>
      </ul>

      <p>
        We want to thank the <a href="https://www.fondation-hadamard.fr/fr/pgmo">Gaspard Monge Program for Optimization and Operations Research (PGMO)</a> and <a href="http://www.gams.com">GAMS</a> for their support of the QPLIB project.
      </p>''';


    print >> index, '''      <h3>Contact</h3>

      <p>
        For questions and comments please contact the main coordinators <a href="http://www.lamsade.dauphine.fr/~furini/">Fabio Furini</a> and <a href="http://lipn.univ-paris13.fr/~traversi/">Emiliano Traversi</a> at <a href="mailto:qplib2014@gmail.com">qplib2014@gmail.com</a>.
      </p>''';


    print >> index, _htmlendbody();
    index.close();
    
    # write instance and statistics page
    _writeinstancepage(data);
    _writestatistics(data);
    _writedocpage();

if __name__ == '__main__' :
    writehtml();
