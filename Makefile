PDFLATEX = xelatex
BIBTEX = bibtex
OTT = ott

# Name of the note:
Name := paper
# Name of the language (ott spec name):
OTTPrefix := spec

OTT_FLAGS_WRAP := -tex_show_meta false -picky_multiple_parses false -tex_name_prefix $(OTTPrefix)
OTT_FLAGS_NO_WRAP := -tex_wrap false -tex_show_meta false -picky_multiple_parses false -tex_name_prefix $(OTTPrefix)
OTT_FLAGS := $(OTT_FLAGS_NO_WRAP)

TexFileName := $(Name).tex
OTTFileName := $(OTTPrefix)
OTTFile := $(OTTFileName).ott
OTTGen := $(OTTFileName)-inc.tex
OTTOutputFile := $(TexFileName) # $(Name)-ottput.tex

PDF := $(Name).pdf

OTT_FILES = introduction.tex	    

FILES := $(OTT_FILES) \
	 abstract.tex \
	 $(Name).tex \
	 Makefile

OTT_TARGETS := $(subst .tex,-ottput.tex,$(OTT_FILES))
OTT_FILTER := $(subst .tex,.tex ,$(addprefix -tex_filter ,$(join $(OTT_FILES), $(OTT_TARGETS))))

all : $(PDF)

open : $(PDF)
	open -a Skim $(PDF)

# $(OTTGen) : $(OTTFile)
# 	$(OTT) $(OTT_FLAGS) -i $(OTTFile) -o $(OTTGen)

# $(OTT_TARGETS) : $(OTT_FILES) $(OTTGen) 
# 	$(OTT) $(OTT_FLAGS) $(OTT_FILTER) -i $(OTTFile) 

$(PDF) : $(FILES)
	$(PDFLATEX) -jobname=$(Name) $(TexFileName)

clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *.bbl *.blg \
	      *.rel note.pdf *~ *.vtc *.out *.spl *-inc.tex  *-ott.tex *-ottput.tex \
	      *.toc
