all: init html qhp

init:
	git submodule update --init --remote
	rm -r docs/

html:
	doxygen Doxyfile-default
	mv docs/html/*  docs/
	rm -r docs/html/

qhp:
	cp -vf Doxyfile Doxyfile.qhp
	sed -i "s/GENERATE_QHP           = NO/GENERATE_QHP           = YES/g" Doxyfile.qhp
	sed -i "s/OUTPUT_DIRECTORY       = Docs_html/OUTPUT_DIRECTORY       = Docs_qhp/g" Doxyfile.qhp
	sed -i "s/qtgui.tags=https:\/\/doc.qt.io\/qt-5\//qtgui.tags=qthelp:\/\/org.qt-project.qtgui\/qtgui\//g" Doxyfile.qhp
	sed -i "s/qtcore.tags=https:\/\/doc.qt.io\/qt-5\//qtcore.tags=qthelp:\/\/org.qt-project.qtcore\/qtcore\//g" Doxyfile.qhp
	sed -i "s/qtwidgets.tags=https:\/\/doc.qt.io\/qt-5\//qtwidgets.tags=qthelp:\/\/org.qt-project.qtwidgets\/qtwidgets\//g" Doxyfile.qhp
	doxygen Doxyfile.qhp
	
install:
	mkdir -p $(DESTDIR)/usr/share/qt5/doc
	cp -r  docs/dtk.qch $(DESTDIR)/usr/share/qt5/doc/
clean:
	rm -rf docs/
	rm -f Doxyfile.qhp 
