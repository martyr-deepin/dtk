QT += testlib
QT -= gui

CONFIG += testcase c++11

SOURCES += \
    dutiltester.cpp \
    main.cpp \
    singletontester.cpp

HEADERS += \
    dutiltester.h \
    singletontester.h

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../dbase/release/ -ldtkbase1
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../dbase/debug/ -ldtkbase1
else:unix: LIBS += -L$$OUT_PWD/../../dbase/ -ldtkbase1

INCLUDEPATH += $$PWD/../../dbase
DEPENDPATH += $$PWD/../../dbase


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../dutil/release/ -ldtkutil1
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../dutil/debug/ -ldtkutil1
else:unix: LIBS += -L$$OUT_PWD/../../dutil/ -ldtkutil1

INCLUDEPATH += $$PWD/../../dutil
DEPENDPATH += $$PWD/../../dutil

unix:QMAKE_RPATHDIR += $$OUT_PWD/../../dbase/
unix:QMAKE_RPATHDIR += $$OUT_PWD/../../dutil/
