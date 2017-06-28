INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

QT += xml

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += \
    CustomWidgets/Fridge-Contents/xmlparser.cpp
#    main.cpp

# Please do not modify the following two lines. Required for deployment.
#include(../../qmlapplicationviewer/qmlapplicationviewer.pri)
#include(qmlapplicationviewer/qmlapplicationviewer.pri)
#qtcAddDeployment()

RESOURCES += \
    CustomWidgets/Fridge-Contents/firdgeContents.qrc

OTHER_FILES += \
    dragDrop.js \
    CustomWidgets/Fridge-Contents/qml/FridgeContents/*.qml \
    CustomWidgets/Fridge-Contents/qml/smallFridgeContents/*.qml

HEADERS += \
    CustomWidgets/Fridge-Contents/xmlparser.h
