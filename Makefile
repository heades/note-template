PDFLATEX = pdflatex
BIBTEX = bibtex
OTT = ott

OTT_FLAGS_WRAP := -tex_show_meta false -picky_multiple_parses false
OTT_FLAGS_NO_WRAP := -tex_wrap false -tex_show_meta false -picky_multiple_parses false
OTT_FLAGS := $(OTT_FLAGS_NO_WRAP)

# Name of the note:
Name := note
# Name of the language (ott spec name):
OTTPrefix := spec
TexFileName := $(Name)
OTTFileName := $(OTTPrefix)
OTTFile := $(OTTFileName).ott
OTTGen := $(OTTFileName)-inc.tex
OTTOutputFile := $(TexFileName)-ottput.tex

PDF := $(TexFileName).pdf

all: pdf

$(OTTOutputFile) : $(OTTFile)
	@$(OTT) $(OTT_FLAGS) -i $(OTTFile) -o $(OTTGen) -tex_filter $(TexFileName).tex $(OTTOutputFile) -tex_name_prefix $(OTTPrefix)

# Now this takes the full LaTex translation and compiles it using
# pdflatex.
pdf :  $(OTTOutputFile) $(OTTFile) Makefile
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)


clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *.bbl *.blg *.rel *.pdf *~ *.vtc *.out *.spl *-inc.tex *-spec.tex *-ottput.tex
