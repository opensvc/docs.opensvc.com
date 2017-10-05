# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = build
DOCDIR        = $(HOME)/docs

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source

TRANS_D = source/translated
POT_D = $(TRANS_D)/pot

.PHONY: help clean html dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf text man changes linkcheck doctest osvc osvc_fr

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  dirhtml    to make HTML files named index.html in directories"
	@echo "  singlehtml to make a single large HTML file"
	@echo "  pickle     to make pickle files"
	@echo "  json       to make JSON files"
	@echo "  htmlhelp   to make HTML files and a HTML help project"
	@echo "  qthelp     to make HTML files and a qthelp project"
	@echo "  devhelp    to make HTML files and a Devhelp project"
	@echo "  epub       to make an epub"
	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
	@echo "  text       to make text files"
	@echo "  man        to make manual pages"
	@echo "  changes    to make an overview of all changed/added/deprecated items"
	@echo "  linkcheck  to check all external links for integrity"
	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"

clean:
	-rm -rf $(BUILDDIR)/*

html:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

singlehtml:
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

pickle:
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) $(BUILDDIR)/pickle
	@echo
	@echo "Build finished; now you can process the pickle files."

json:
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) $(BUILDDIR)/json
	@echo
	@echo "Build finished; now you can process the JSON files."

htmlhelp:
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) $(BUILDDIR)/htmlhelp
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in $(BUILDDIR)/htmlhelp."

qthelp:
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) $(BUILDDIR)/qthelp
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/OpenSVCreferencebook.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/OpenSVCreferencebook.qhc"

devhelp:
	$(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) $(BUILDDIR)/devhelp
	@echo
	@echo "Build finished."
	@echo "To view the help file:"
	@echo "# mkdir -p $$HOME/.local/share/devhelp/OpenSVCreferencebook"
	@echo "# ln -s $(BUILDDIR)/devhelp $$HOME/.local/share/devhelp/OpenSVCreferencebook"
	@echo "# devhelp"

epub:
	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) $(BUILDDIR)/epub
	@echo
	@echo "Build finished. The epub file is in $(BUILDDIR)/epub."

latex:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make' in that directory to run these through (pdf)latex" \
	      "(use \`make latexpdf' here to do that automatically)."

latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "Running LaTeX files through pdflatex..."
	make -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

text:
	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
	@echo
	@echo "Build finished. The text files are in $(BUILDDIR)/text."

man:
	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) $(BUILDDIR)/man
	@echo
	@echo "Build finished. The manual pages are in $(BUILDDIR)/man."

changes:
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
	@echo
	@echo "The overview file is in $(BUILDDIR)/changes."

linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

html_fr:
	$(SPHINXBUILD) -b html -Dlanguage=fr $(ALLSPHINXOPTS) $(BUILDDIR)/html/fr

osvc: changelog templates commands compobjs html html_fr

pot:
	$(SPHINXBUILD) -b gettext source $(POT_D)

po_fr:
	@for pot in `echo $(POT_D)/*.pot` ; do \
	base_pot=`basename $$pot` ; \
	po=$(TRANS_D)/fr/`echo $$base_pot | sed "s/t$$//"` ; \
	echo "merge new strings in $$po" ; \
	touch $$po ; \
	msgmerge -s -U $$po $$pot ; \
	done

po: po_fr

mo_fr:
	@for po in `echo $(TRANS_D)/fr/*.po` ; do \
	base_po=`basename $$po` ; \
	mo=$(TRANS_D)/fr/LC_MESSAGES/`echo $$base_po | sed "s/po$$/mo/"` ; \
	echo "gen hash in $$mo" ; \
	msgfmt -c -v -o $$mo $$po ; \
	done

mo: mo_fr

trans: pot po mo

gitclone:
	@test -d $(DOCDIR) || mkdir $(DOCDIR)
	@cd $(DOCDIR) && git clone https://git.opensvc.com/opensvc/.git

gitrepo:
	@echo "Updating git repo"
	@test -d $(DOCDIR)/opensvc/.git || $(MAKE) gitclone
	@cd $(DOCDIR)/opensvc && git pull --all && git reset --hard

commands: gitrepo
	@test -d $(DOCDIR)/opensvc/tmp || mkdir $(DOCDIR)/opensvc/tmp
	@$(DOCDIR)/opensvc/bin/pkg/make_man_rst
	cp $(DOCDIR)/opensvc/tmp/nodemgr.rst source/agent.commands.nodemgr.rst
	cp $(DOCDIR)/opensvc/tmp/svcmgr.rst source/agent.commands.svcmgr.rst

templates: gitrepo
	@test -d $(DOCDIR)/opensvc/tmp || mkdir $(DOCDIR)/opensvc/tmp
	@test -d source/agent.templates || mkdir source/agent.templates
	@$(DOCDIR)/opensvc/bin/pkg/make_rst
	@rm -rf source/agent.templates/* && mv $(DOCDIR)/opensvc/tmp/rst/* source/agent.templates/
	cp $(DOCDIR)/opensvc/usr/share/doc/node.conf source/_static/node.conf
	cp $(DOCDIR)/opensvc/usr/share/doc/auth.conf source/_static/auth.conf

compobjs: gitrepo
	@for t in `egrep -l "^data = {" $(DOCDIR)/opensvc/var/compliance/com.opensvc/*.py` ; do \
	base_t=`basename $$t | sed -e "s/\.py//"` ; \
	echo "$$base_t" | awk '{l=length($$0) ;printf $$0 "\n"; while (l>0) {printf "-";l--} ; printf "\n\n"}'| tee source/compliance.objects/$$base_t.rst ; \
	buff=`$$t info` 2>/dev/null || continue ; \
	echo "$$buff" | tee -a source/compliance.objects/$$base_t.rst ; \
	done

changelog: gitrepo
	@echo "Agent Changelog\n===============\n\n" | tee source/agent.changelog.rst
	@cd $(DOCDIR)/opensvc/bin/pkg && bash ./changelog | grep -v ^BRANCH=HEAD | sed -e 's/*//g' | awk '{printf("| `"$$1 " <https://git.opensvc.com/?p=opensvc/.git;a=commitdiff;h=" $$2 ">`_ ") ; for (i = 3; i < NF; i++) {printf("%s ", $$i);} ; printf("%s", $$NF);printf("\n")}' > $(DOCDIR)/opensvc/opensvc.changelog.rst
	@cat $(DOCDIR)/opensvc/opensvc.changelog.rst | tee -a source/agent.changelog.rst
	@rm -f $(DOCDIR)/opensvc/opensvc.changelog.rst
	@is_modified=`git status -s source/agent.changelog.rst | grep ' M source/agent.changelog.rst'` ; \
	if ! test -z "$$is_modified"; then git commit -m 'Autocommit agent changelog' source/agent.changelog.rst; fi;
