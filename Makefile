NAME?="Let's use FreeCAD"
target=freecad
all: ${target}.html

%.html: %.org Makefile
	NAME=${NAME} emacs --batch\
 -u ${USER} \
  --eval '(load user-init-file)' \
  $< \
  -f org-reveal-export-to-html
	x-www-browser $@
help:
	echo "https://github.com/yjwen/org-reveal/issues/171"
	echo "   M-x load-library ox-reveal"
	echo "C-c C-e R R"

clean:
	rm -rf *~ tmp
