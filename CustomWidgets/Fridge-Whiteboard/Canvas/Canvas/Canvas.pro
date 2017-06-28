INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

QT += declarative script
greaterThan(QT_MAJOR_VERSION, 4) {
    QT +=
#quick
}
TEMPLATE = lib
CONFIG += qt plugin

 
TARGET  = canvasplugin

 DESTDIR = ../../../../output/SmartRefrigerator/CustomWidgets/Fridge-Whiteboard/Canvas
 OBJECTS_DIR = tmp
 MOC_DIR = tmp

HEADERS += context2d.h \
        canvas.h \
        canvastimer.h \
        canvasplugin.h

SOURCES += context2d.cpp \
        canvas.cpp \
        canvasplugin.cpp \
        canvastimer.cpp
