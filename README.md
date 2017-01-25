### QPLib web

This repository contain QPLib instances, and scripts and tools to build the QPLib instance listing. The scripts/tools were derived from the one used for MINLPLib 2.

To build the QPLib instance listing:

1. Create a link "gams" pointing to a GAMS system directory.
2. Execute make to build helper tools.
3. Run ```./scripts/convertinstances.sh``` to create .lp files.
5. Run ```./scripts/writehtml.py``` to create HTML pages
6. Run ```./scripts/makedist.sh``` to create a qplib.zip file.

The code that checks instances for convexity can make use of CHOLMOD.
If you have CHOLMOD available on your system, create a file make.local
in the base directory with the line ```CHOLMOD = true```.

To publish the website, simply copy the html/ directory to your server.
