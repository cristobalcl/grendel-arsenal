TARGET = file

all: $(TARGET).pdf

clean:
	rm $(TARGET).pdf $(TARGET).dvi $(TARGET).log $(TARGET).bbl $(TARGET).blg $(TARGET).aux

#$(TARGET).pdf: $(TARGET).tex $(TARGET).bbl
$(TARGET).pdf: $(TARGET).tex
	pdflatex $(TARGET)

#$(TARGET).bbl: $(TARGET).bib $(TARGET).tex
#	pdflatex $(TARGET)
#	pdflatex $(TARGET)
#	bibtex $(TARGET)
#	pdflatex $(TARGET)
