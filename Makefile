BINDIR=bin
OBJDIR=obj
SRCDIR=src

GAMSDIR=$(realpath gams)
GAMSAPIDIR=$(GAMSDIR)/apifiles/C/api

CFLAGS = -g -O -Wall -I$(GAMSAPIDIR) "-DGAMSDIR=\"$(GAMSDIR)\"" -I$(SRCDIR)/xmnLib
LDFLAGS = -ldl -lpthread -lm -lpng
LDFLAGS += -llapack

CFLAGS += -DHAVE_CHOLMOD
LDFLAGS += -lcholmod

OBJS = $(OBJDIR)/loadgms.o $(OBJDIR)/gevmcc.o $(OBJDIR)/gmomcc.o $(OBJDIR)/curvcheck.o $(OBJDIR)/sparsityplot.o $(OBJDIR)/convert.o

all : $(BINDIR)/propcheck $(BINDIR)/convert

depend : $(SRCDIR)/*.c $(SRCDIR)/*.h $(GAMSAPIDIR)/*.c $(GAMSAPIDIR)/*.h
	$(CC) $(CFLAGS) -MM $^ | sed -e 's@^\([a-z]\)@$(OBJDIR)/\1@g' > $@

-include depend

$(BINDIR) $(OBJDIR) :
	mkdir -p $@

$(BINDIR)/propcheck : $(OBJS) $(OBJDIR)/propcheck.o | $(BINDIR)
	$(CC) $^ $(LDFLAGS) -o $@

$(BINDIR)/convert : $(OBJS) $(OBJDIR)/convertmain.o | $(BINDIR)
	$(CC) $^ $(LDFLAGS) -o $@

$(OBJDIR)/%.o : $(GAMSAPIDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o : $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o : $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o : $(SRCDIR)/xmnLib/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(OBJS) $(BINDIR)/* depend

