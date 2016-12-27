import os;
import sys;
from bibtexparser.bparser import BibTexParser;
from bibtexparser.customization import *;

# docu https://bibtexparser.readthedocs.org/en/latest/

def readbib(bibfilename) :
    
    if not os.access(bibfilename, os.R_OK) :
        raise BaseException('Cannot read bib file ' + bibfilename);
    bibfile = open(bibfilename, 'r');
        
    def customizations(record) :
        record = type(record);
        record = author(record);
        record = editor(record);
        record = link(record);
        record = doi(record);
        record = convert_to_unicode(record);
        
        return record;
    
    bib = BibTexParser(bibfile, customization = customizations).get_entry_dict();
    
    return bib;

def hasref(bib, r) :
    return r in bib;

def _docomma(ref, s) :
    if len(s) > 0 and s[-1] != ' ':
        s += ', ';
        
def _docanonical(ref, s, key) :
    if key in ref :
        _docomma(ref, s);
        s += ref[key];

def _doeditors(ref, s) :
    if 'editor' not in ref :
        return;
        
    i = 1;
    l = len(ref['editor']);
    for e in ref['editor'] :
        if l == 2 and i == 2 :
            s += ' ';
        else :
           _docomma(ref, s);
        if i == l and l > 1 :
            s += 'and '; 
        s += e['name'];
        i += 1;
    s += ', Eds' if l > 1 else ', Ed';

def _doauthors(ref, s) :

    if 'author' in ref :
        i = 1;
        l = len(ref['author']);
        for a in ref['author'] :
            if l == 2 and i == 2 :
                s += ' ';
            else :
               _docomma(ref, s);
            if i == l and l > 1 :
                s += 'and '; 
            s += a;
            i += 1;

    else :
        _doeditors(ref, s);

def _dotitle(ref, s) :
    if 'title' not in ref :
        return;

    _docomma(ref, s);
    
    if 'link' in ref :
        s += '<A href="' + ref['link'][0]['url'] + '">';
    
    s += ref['title'];
    
    if 'link' in ref :
        s += '</A>'

def _dobooktitle(ref, s) :
    _docanonical(ref, s, 'booktitle');

def _doseries(ref, s) :
    _docanonical(ref, s, 'series');

def _dojournal(ref, s) :
    _docanonical(ref, s, 'journal');

def _dovolume(ref, s) :
    if 'volume' in ref :
        _docomma(ref, s);
        s += ref['volume'];
        if 'number' in ref :
            s += ':';
            s += ref['number'];
    else :
        _docanonical(ref, s, 'number');
        
def _dotechrepnumber(ref, s) :
    _docomma(ref, s);
    s += 'Tech. Rep.';
    if 'number' in ref :
        s += ' ';
        s += ref['number'];

def _donumber(ref, s) :
    _docanonical(ref, s, 'number');

def _doyear(ref, s) :        
    _docanonical(ref, s, 'year');
    
def _dopages(ref, s) :        
    _docanonical(ref, s, 'pages');

def _donote(ref, s) :
    if 'note' not in ref :
        return;
    if len(s) > 0 :
        s += '. ';
    s += ref['note'];

def _dopublisher(ref, s) :
    _docanonical(ref, s, 'publisher');

def _doaddress(ref, s) :
    _docanonical(ref, s, 'address');
    
def _doorganization(ref, s) :
    _docanonical(ref, s, 'organization');

def _dothesis(ref, s) :
    _docomma(ref, s);
    if ref['type'] == 'mastersthesis' :
        s += 'Masters thesis';
    else :
        assert ref['type'] == 'phdthesis';
        s += 'PhD thesis';
    
def _doschool(ref, s) :
    _docanonical(ref, s, 'school');

def _doinstitution(ref, s) :
    _docanonical(ref, s, 'institution');

def _doedition(ref, s) :
    _docanonical(ref, s, 'edition');


def tohtml(bib, r) :
    '''Formats a bibtex reference into a HTML string'''

    assert hasref(bib, r);
    
    ref = bib[r];
    type = ref['type'];
        
    s = [];

    if type == 'article' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _dojournal(ref, s);
        _dovolume(ref, s);
        _doyear(ref, s);
        _dopages(ref, s);
        _donote(ref, s);

    elif type == 'book' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _dopublisher(ref, s);
        _doaddress(ref, s);
        _doyear(ref, s);
        _donote(ref, s);

    elif type == 'inbook' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _dopublisher(ref, s);
        _doaddress(ref, s);
        _doyear(ref, s);
        _dopages(ref, s);
        _donote(ref, s);

    elif type == 'manual' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _doorganization(ref, s);
        _doaddress(ref, s);
        _donumber(ref, s);
        _doedition(ref, s);
        _doyear(ref, s);
        _donote(ref, s);

    elif type == 'mastersthesis' or type == 'phdthesis' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _dothesis(ref, s);
        _doschool(ref, s);
        _doyear(ref, s);
        _donote(ref, s);

    elif type == 'incollection' or type == 'inproceedings' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        s += '. ';
        if 'chapter' in ref :
            s += 'Chapter ' + ref['chapter'] + ' in ';
        else :
            s += 'In ';
        if 'crossref' in ref :
            if ref['crossref'] not in bib :
                raise BaseException('Bibtex entry ' + r + ' crossrefs to ' + ref['crossref'] + ', but this entry is not found in the bibfile');
            crossref = bib[ref['crossref']];
            _doauthors(crossref, s);
            _dotitle(crossref, s);
            _dopublisher(crossref, s);
            _doaddress(crossref, s);
            _doyear(crossref, s);
        else :
            _doeditors(ref, s);
            _dobooktitle(ref, s);
            _doseries(ref, s);
            _dovolume(ref, s);
            _dopublisher(ref, s);
            _doaddress(ref, s);
            _doyear(ref, s);
        _dopages(ref, s);
        _donote(ref, s);

    elif type == 'proceedings' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _doyear(ref, s);
        _donote(ref, s);

    elif type == 'techreport' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _dotechrepnumber(ref, s);
        _doinstitution(ref, s);
        _doyear(ref, s);
        _donote(ref, s);
        
    elif type == 'misc' :
        _doauthors(ref, s);
        _dotitle(ref, s);
        _doyear(ref, s);
        _donote(ref, s);

    else :
        print >> sys.stderr, "Unknown bibtex entry type", type, "in reference", r;

    s += '.';
    
    s = u''.join(s).encode('ascii', 'xmlcharrefreplace');
    
    return s;

def getauthors(bib, r):
    assert hasref(bib, r);
    
    ref = bib[r];
    
    if 'author' in ref :
        return ref['author'];
    
    return [];
