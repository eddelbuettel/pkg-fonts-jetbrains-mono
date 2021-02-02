
## Minimal and hackish packaging for Jetbrains Mono
##
## This Makefile downloads from GitHub, extracts the TTF files and
## lets the Debian packaging in debian/ do the rest. Just call
##
##     dpkg-buildpackage -rfakeroot -us -uc -tc
##
## or just
##
##     runMe.sh
##
## to have the package build using 'fake' suid, do not sign (as we're
## not uploading anywhere) and clean.
##
## Copyright (C) 2016 - 2021  Dirk Eddelbuettel
## and released under GPL (>=2 )

srcfile=https://github.com/JetBrains/JetBrainsMono/archive/master.zip
outfile=$(shell basename ${srcfile})

all:
	test -f ${outfile} || wget ${srcfile}
	unzip ${outfile}
	mkdir ttf otf
	mv JetBrainsMono-master/fonts/ttf/*.ttf ttf/
	mv JetBrainsMono-master/fonts/otf/*.otf otf/
	rm -rf JetBrainsMono-master

clean:
	rm -f ${outfile}
	rm -rf ttf/ otf/
