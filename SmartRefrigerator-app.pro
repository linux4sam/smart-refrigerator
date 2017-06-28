#-------------------------------------------------
#
# Project created by QtCreator 2013-11-03T20:39:32
#
#-------------------------------------------------

addfiles.source = CustomWidgets/Fridge-Whiteboard/Canvas/qmldir
addfiles.target = output/SmartRefrigerator/CustomWidgets/Fridge-Whiteboard/Canvas
script.source = SmartRefrigerator.sh
script.target = output/SmartRefrigerator
configfiles.source = configs/2-smart-refrigerator.xml
configfiles.target = output/ApplicationLauncher/applications/xml
configresource.source = configs/smart-refrigerator.png
configresource.target = output/ApplicationLauncher/applications/resources
nostromo.source = configs/nhttpd.conf
nostromo.target = output/
boa.source = configs/boa.conf
boa.target = output/
DEPLOYMENTFOLDERS += addfiles script configfiles configresource nostromo boa


QT       += core gui declarative

TARGET = SmartRefrigerator
TEMPLATE = app

DESTDIR = ./output/SmartRefrigerator

include(qmlapplicationviewer/qmlapplicationviewer.pri)
include(CustomWidgets/Overlay/overlay.pri)
include(CustomWidgets/Fridge-MainScreen/FridgeMainScreen.pri)
include(CustomWidgets/Fridge-Whiteboard/FridgeWhiteboard.pri)
include(CustomWidgets/Fridge-Zones/FridgeZones.pri)
include(CustomWidgets/Fridge-Epi/FridgeEpi.pri)
include(CustomWidgets/Fridge-webBrowser/FridgeWebBrowser.pri)
include(CustomWidgets/Fridge-Calendar/FridgeCalendar.pri)
include(CustomWidgets/Fridge-Contents/FridgeContents.pri)


SOURCES += main.cpp\
        mainwindow.cpp \
    SlidingStackedWidget.cpp \
    homescreen.cpp \
    fridgezonesscreen.cpp \
    fridgewhiteboardscreen.cpp \
    fridgeepiscreen.cpp \
    fridgewebbrowser.cpp \
    fridgecalendar.cpp \
    fridgecontents.cpp

HEADERS  += mainwindow.h \
    SlidingStackedWidget.h \
    homescreen.h \
    fridgezonesscreen.h \
    fridgewhiteboardscreen.h \
    fridgeepiscreen.h \
    fridgewebbrowser.h \
    fridgecalendar.h \
    fridgecontents.h

FORMS    += mainwindow.ui \
    homescreen.ui \
    fridgezonesscreen.ui \
    fridgewhiteboardscreen.ui \
    fridgeepiscreen.ui \
    fridgewebbrowser.ui \
    fridgecalendar.ui \
    fridgecontents.ui

RESOURCES += \
    mainResource.qrc

OTHER_FILES +=

qtcAddDeployment()
