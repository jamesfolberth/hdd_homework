
FIGDIR = figures

SHELL := /bin/bash
MATLAB = matlab -nodesktop -nosplash
OCTAVE = octave --silent


.PHONY: all code clean

all: code

code:
	echo "run some code"
	#$(OCTAVE) --eval "disp('Octave is cool');";\

clean:
	@rm -f $(FIGDIR)/*.png;
	# Don't remove tikz files (some computations are slow)
