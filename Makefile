SRCDIR = $(CURDIR)/src
GENOMESDIR = $(CURDIR)/genomes
OMADIR = $(GENOMESDIR)/oma
OMAPARAMETERS = $(OMADIR)/parameters.drw
OMACPU = 6

# Sequences and orthology

K12 = $(GENOMESDIR)/k12.gbk
OTHER = $(GENOMESDIR)/other.gbk

# Anything below this point should not be changed

K12FA = $(GENOMESDIR)/k12.fa
$(K12FA): $(K12)
	$(SRCDIR)/gbk2faa $(K12) $(K12FA)
OTHERFA = $(GENOMESDIR)/other.fa
$(OTHERFA): $(OTHER)
	$(SRCDIR)/gbk2faa $(OTHER) $(OTHERFA)

K12OTHERDIR = $(GENOMESDIR)/k12-OTHER
$(K12OTHERDIR): $(K12FA) $(OTHERFA) $(OMAPARAMETERS)
	mkdir -p $(K12OTHERDIR)
	mkdir -p $(K12OTHERDIR)/DB
	cp $(OMAPARAMETERS) $(K12OTHERDIR)
	cp $(K12FA) $(K12OTHERDIR)/DB
	cp $(OTHERFA) $(K12OTHERDIR)/DB

K12OTHERHGROUPS = $(K12OTHERDIR)/Output/HierarchicalGroups.orthoxml
$(K12OTHERHGROUPS): $(K12OTHERDIR)
	cd $(K12OTHERDIR) && oma -n $(OMACPU)

ORTHOXMLLIB = $(SRCDIR)/orthoxml.py
$(ORTHOXMLLIB):
	wget -O $(ORTHOXMLLIB) https://raw.githubusercontent.com/jhcepas/phylogenetic-XML-python-parsers/master/orthoxml.py

K12OTHERPANGENOME = $(OMADIR)/k12_other.tsv
$(K12OTHERPANGENOME): $(K12OTHERHGROUPS) $(ORTHOXMLLIB) $(OMADIR)
	$(SRCDIR)/omah2tsv $(K12OTHERHGROUPS) $(K12OTHERPANGENOME)

# Makefile targets

orthologs: $(K12OTHERPANGENOME)
all: orthologs

.PHONY: all orthologs
