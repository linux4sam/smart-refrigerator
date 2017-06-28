INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

#
# Add more folders to ship with the application, here
#
epi.source = CustomWidgets/Fridge-Epi/qml/FridgeEpi
epi.target = output/SmartRefrigerator/CustomWidgets/Fridge-Epi/qml
smallepi.source = CustomWidgets/Fridge-Epi/qml/smallFridgeEpi
smallepi.target = output/SmartRefrigerator/CustomWidgets/Fridge-Epi/qml
webpages.source = webpage
webpages.target = output/SmartRefrigerator
smallwebpages.source = webpage
smallwebpages.target = output/SmartRefrigerator
DEPLOYMENTFOLDERS += epi smallepi webpages smallwebpages

QT += core gui xml network declarative webkit webkitwidgets
greaterThan(QT_MAJOR_VERSION, 4) {
    QT += #quick
}

OTHER_FILES += \
    CustomWidgets/Fridge-Epi/qml/FridgeEpi/*.qml \
    CustomWidgets/Fridge-Epi/qml/FridgeEpi/content/*.qml \
    CustomWidgets/Fridge-Epi/qml/FridgeEpi/assets/*.qml \
    CustomWidgets/Fridge-Epi/qml/FridgeEpi/CountDownBusy.qml \
    CustomWidgets/Fridge-Epi/qml/smallFridgeEpi/*.qml \
    CustomWidgets/Fridge-Epi/qml/smallFridgeEpi/content/*.qml \
    CustomWidgets/Fridge-Epi/qml/smallFridgeEpi/assets/*.qml \
    CustomWidgets/Fridge-Epi/qml/smallFridgeEpi/CountDownBusy.qml

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES +=  \
    CustomWidgets/Fridge-Epi/mydeclarativewebview.cpp

HEADERS += \
    CustomWidgets/Fridge-Epi/mydeclarativewebview.h

