#!/bin/bash
ARGUMENT="$1"
AUXNAME="${ARGUMENT%.tex}.aux"
pdflatex -output-directory=out -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning"
bibtex -terse out/"$AUXNAME"
pdflatex -output-directory=out -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning"
pdflatex -output-directory=out -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning"
cp out/document.pdf document.pdf
