INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

#
# Add more folders to ship with the application, here
#
whiteboard.source = CustomWidgets/Fridge-Whiteboard/qml/FridgeWhiteboard
whiteboard.target = output/SmartRefrigerator/CustomWidgets/Fridge-Whiteboard/qml

smallwhiteboard.source = CustomWidgets/Fridge-Whiteboard/qml/smallFridgeWhiteboard
smallwhiteboard.target = output/SmartRefrigerator/CustomWidgets/Fridge-Whiteboard/qml

DEPLOYMENTFOLDERS += whiteboard smallwhiteboard

OTHER_FILES += CustomWidgets/Fridge-Whiteboard/qml/FridgeWhiteboard/*.qml \
               CustomWidgets/Fridge-Whiteboard/qml/smallFridgeWhiteboard/*.qml

RESOURCES += \
    CustomWidgets/Fridge-Whiteboard/whiteboard.qrc

#LIBS += -L$$PWD/CustomWidgets/Fridge-Whiteboard/Canvas -lcanvasplugin
#LIBS += -L$$PWD/Canvas -lcanvasplugin

#QTPLUGIN += canvasplugin

#LIBS += -L./CustomWidgets/Fridge-Whiteboard/Canvas -lcanvasplugin

# Please do not modify the following two lines. Required for deployment.
#include(qmlapplicationviewer/qmlapplicationviewer.pri)
#qtcAddDeployment()
