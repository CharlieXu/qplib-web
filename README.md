### QPLib web

This repository contain QPLib instances, and scripts and tools to build the QPLib instance listing. The scripts/tools were derived from the one used for MINLPLib 2.

To build the QPLib instance listing:

1. Create a link "gams" pointing to a GAMS system directory.
2. Execute make to build helper tools.
3. Run ```./scripts/convertinstances.sh``` to create files for the different instance formats.
4. Run ```./scripts/convertpoints.sh``` to create files for the different point formats.
5. Run ```./scripts/writehtml.py``` to create HTML pages.
6. Run ```./scripts/makedist.sh``` to create a qplib.zip file.

The code that checks instances for convexity can make use of CHOLMOD.
If you have CHOLMOD available on your system, create a file make.local
in the base directory with the line ```CHOLMOD = true```.

To publish the website at the address http://qplib.zib.de/:

7. Run ```./scripts/export-www.sh``` to copy the html/ directory to the web server.
