#!/bin/bash

# remove all existing pdf and cd into ipynb dir
rm pdf/*
cd ipynb;

# loop to *.ipynb files and generate pdf using nbconvert
for ipynbFile in *.ipynb; 
do
jupyter nbconvert --to pdf "$ipynbFile" --output-dir ../pdf;
done

# back to root of repo dir
cd ..
