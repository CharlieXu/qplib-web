#!/usr/bin/env python2

import sys;
import os;
import StringIO;
import argparse;
import zipfile;
import pandas as pd;

import metadata;

# requires Pandas >= 0.13 and numexpr
# http://pandas.pydata.org/pandas-docs/dev/indexing.html#indexing-query
# https://github.com/pydata/numexpr/releases

def _setupargparse() :
    parser = argparse.ArgumentParser(description = 'MINLPLib query tool', fromfile_prefix_chars = '@');
    parser.add_argument('query', type = str, help = 'query in Pandas query() syntax, or "*" to get all', nargs = '?');
    parser.add_argument('--printcolumns', action = 'store_true', help = 'prints which data columns are available');
    parser.add_argument('-c', '--column', type = str, help = 'a column to print additionally to the instance name, or "*" to get all; prepend with "!" to exclude a column', action = 'append', default = []);
    parser.add_argument('--noheader', action = 'store_true', help = 'disables columns header when printing with --column');
    parser.add_argument('--csv', action = 'store_true', help = 'writes result as comma separated values instead of text table');
    parser.add_argument('-s', '--sort', type = str, help = 'a column by which to sort the output (add ! to sort descending)', action = 'append');
    parser.add_argument('-z', '--zip', type = str, help = 'name of a zip file to hold selected instances with solution points');
    
    return parser;

def _dozip(zipfilename, instances, data, addmeta = False) :
    z = zipfile.ZipFile(zipfilename, 'w', zipfile.ZIP_DEFLATED);
    
    if zipfilename.endswith('.zip') :
        zipdir = zipfilename[:-4];
    else :
        zipdir = zipfilename;
    
    for subdir in metadata.INSTANCEFORMATS + metadata.POINTFORMATS + (['meta' ] if addmeta else []):
        dir = os.path.join(metadata.DATADIR, subdir);
        for f in os.listdir(dir) :
            #if f.endswith('.gdx') : continue;
            #if f.endswith('.db') : continue;
            if f.partition('.')[0] in instances :
                z.write(os.path.join(dir, f), arcname = os.path.join(zipdir, subdir, f));

    if addmeta :
        z.write(os.path.join(metadata.DATADIR, 'minlplib.bib'), arcname = os.path.join(zipdir, 'ref.bib'));

    z.close();
    
    
def _selectcolumns(allcols, select) :
    cols = list();
    for c in select :
        if c == '*' :
            cols += list(allcols);
        elif c.startswith('!') :
            if c[1:] in cols :
                cols.remove(c[1:]);
        elif c in allcols:
            cols.append(c);
      
    return cols;
   

def run(argv) :
    parser = _setupargparse();
    args = parser.parse_args(argv);
    
    if (args.query is None and not args.printcolumns and args.column == []) :
        parser.print_help();
        return;
    
    #print args;
        
    data = metadata.read();
    df = metadata.todataframe(data);
    
    if args.printcolumns :
        # TODO add some description
        for c in sorted([col for col in df.columns] + [df.index.name]) :
            print c;
    
    # disable breaking output at line width
    pd.set_option('expand_frame_repr', False);
    
    if args.query is not None :
        # need to sort before query to avoid warning (sort writes into slice of dataframe)
        if args.sort is not None :
            sortcol = [s.partition('!')[0] for s in args.sort];
            sortasc = [s.rfind('!') == -1 for s in args.sort];
            df.sort(sortcol, ascending = sortasc, inplace = True);

        #print 'run query', args.query;        
        if args.query == "*" :
            result = df;
        else :
            result = df.query(args.query);
            
        #result = result[result.sourceids.map(lambda x : "minlp.org" in x)];
        
        cols = _selectcolumns(df.columns, args.column);
        if len(cols) > 0 :
            if args.csv :
                print result[cols].to_csv(header = not args.noheader);
            else :
                print result[cols].to_string(header = not args.noheader, index_names = False);
        else :
            for r in result.index :
                print r;
                
        if args.zip is not None :
            _dozip(args.zip, result.index.tolist(), data);
        

if __name__ == '__main__' :
    run(sys.argv[1:]);

