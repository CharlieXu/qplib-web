#!/usr/bin/python2

import os;
import sys;

GAMSEXE = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'gams', 'gams'));

def gms2gms(infile, outfile, fix = "", gamsopts = "") :

    if os.path.exists(outfile) :
        os.remove(outfile);
    
    # cleanup input, creating tmp1
    if os.system("cat '" + infile + "'" +
                 "| grep -i -v 'OPTION .*;' " +
                 "| grep -i -v 'minlp *=' " +
                 "| grep -i -v -F .optfile " +
                 "| grep -i -v -F .workspace " +
                 "| grep -i -v -F .workfactor " +
                 "| grep -i -v -F .reslim " +
                 "| grep -i -v -F .iterlim " +
                 "| grep -i -v -F .nodlim " +
                 "| grep -i -v -F .optcr " +
                 "| grep -i -v -F .optca " +
                 "| grep -i -v -F .holdfixed " +
                 fix +
                 "> gms2gms_tmp1.gms") :
        raise BaseException("gams file " + infile + " cleanup failed");

    # run GAMS convert to create tmp2 from tmp1
    convertopt = open("convert.opt", 'w');
    print >> convertopt, "GmsInsert";
    print >> convertopt, "ObjVar objvar";
    print >> convertopt, "Gams gms2gms_tmp2.gms";
    convertopt.close();
            
    os.system(GAMSEXE + " gms2gms_tmp1.gms lo=0 pf4=0 limcol=0 limrow=0 pc=2 optfile=1 " +
              "LP=CONVERT RMIP=CONVERT QCP=CONVERT RMIQCP=CONVERT NLP=CONVERT DNLP=CONVERT RMINLP=CONVERT CNS=CONVERT MIP=CONVERT MIQCP=CONVERT MINLP=CONVERT MCP=CONVERT MPEC=CONVERT RMPEC=CONVERT " + gamsopts);
    if not os.path.exists("gms2gms_tmp2.gms") or os.system('grep -q "SOLVER STATUS     1 Normal Completion" gms2gms_tmp1.lst') :
        raise BaseException("GAMS/CONVERT failed");

    hasdiscrete = False;
    hasdiscont = False;

    # create outfile out of tmp2
    gmsfile = open(outfile, 'w');
    
    print >> gmsfile, "$offlisting";
    for line in open('gms2gms_tmp2.gms', 'r') :
        if ("Binary" in line) or ("Integer" in line) or ("SOS" in line) or ("Semi" in line) :
            hasdiscrete = True;
        if ("abs" in line) or ("mod(" in line) or ("min(" in line) or ("max(" in line) or ("Gamma(" in line) :
            hasdiscont = True;
        if line.find("Solve m using") == 0 :
            print >> gmsfile, 'm.tolproj = 0.0;';
            if 'CNS' in line :
                modtype = "CNS"
            else :
                modtype = "MIQCP" if hasdiscrete else ("DNLP" if hasdiscont else "QCP");
            print >> gmsfile, "$if not set " + modtype + " $set " + modtype + " " + modtype
            print >> gmsfile, "Solve m using %" + modtype + "%", ' '.join(line.split()[4:]);
        elif line.find('written by GAMS Convert') >= 0 :
            continue;
        elif line.find('m.optc') >= 0 or line.find('m.reslim') >= 0 or line.find('m.iterlim') >= 0 or line.find('m.work') >= 0 or line.find('bratio') >= 0 :
            continue;
        else :
            print >> gmsfile, line,;
            
    gmsfile.close();

    # cleanup
    if os.path.exists("convert.opt") :
        os.remove("convert.opt");
    if os.path.exists("gms2gms_tmp1.gms") :
        os.remove("gms2gms_tmp1.gms");
    if os.path.exists("gms2gms_tmp1.lst") :
        os.remove("gms2gms_tmp1.lst");
    if os.path.exists("gms2gms_tmp2.gms") :
        os.remove("gms2gms_tmp2.gms");

if __name__ == '__main__' :
   gms2gms(sys.argv[1], sys.argv[2], gamsopts = sys.argv[3] if len(sys.argv) >= 4 else "");
