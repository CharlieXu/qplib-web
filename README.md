### QPLib web

This repository contain QPLib instances, and scripts and tools to build the QPLib instance listing. The scripts/tools were derived from the one used for MINLPLib 2.

To build the QPLib instance listing:

1.  Create a link "gams" pointing to a GAMS system directory.
2. Execute make to build helper tools.
3. Run ```./scripts/convertinstances.sh``` to create .lp files.
4. Run ```./scripts/query.py "*" -c "*" --csv > instancedata.csv``` to write down all instance data into a csv file.
5. Run ```./scripts/writehtml.py``` to create HTML pages
6. Run ```./scripts/makedist.sh``` to create a qplib.zip file.
