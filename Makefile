ODGS       = $(wildcard odgs/*.odg)
ODGS_svg   = $(patsubst %.odg,%.svg,$(ODGS))

NEEDED = $(ODGS_svg)

all: $(NEEDED)

%.svg: %.odg
	unoconv -f svg $<
	inkscape --verb=FitCanvasToDrawing --verb=FileSave --verb=FileQuit $@

clean:
	rm -f $(NEEDED)
	