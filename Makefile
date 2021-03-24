all: init html 

init:
        git submodule update --init --remote
        rm -r docs/

html:
        doxygen Doxyfile-default

qhp:
        cp -vf Doxyfile-default Doxyfile.qhp
        sed -i "s/GENERATE_QHP           = NO/GENERATE_QHP           = YES/g" Doxyfile.qhp
        sed -i "s/OUTPUT_DIRECTORY       = Docs_html/OUTPUT_DIRECTORY       = Docs_qhp/g" Doxyfile.qhp
        sed -i "s/qtgui.tags=https:\/\/doc.qt.io\/qt-5\//qtgui.tags=qthelp:\/\/org.qt-project.qtgui\/qtgui\//g$
        sed -i "s/qtcore.tags=https:\/\/doc.qt.io\/qt-5\//qtcore.tags=qthelp:\/\/org.qt-project.qtcore\/qtcore$
        sed -i "s/qtwidgets.tags=https:\/\/doc.qt.io\/qt-5\//qtwidgets.tags=qthelp:\/\/org.qt-project.qtwidget$
        doxygen Doxyfile.qhp

install:
        mkdir -p $(DESTDIR)/usr/share/qt5/doc
        cp -r  docs/dtk.qch $(DESTDIR)/usr/share/qt5/doc/
clean:
        rm -rf docs/
