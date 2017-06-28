INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

QT += core gui xml network #webkit

greaterThan(QT_MAJOR_VERSION, 4) {
    QT += #webkitwidgets #quick
}

OTHER_FILES += \
    CustomWidgets/Fridge-webBrowser/qml/webbrowser/*.qml \
    CustomWidgets/Fridge-webBrowser/qml/webbrowser/content/*.qml \
    CustomWidgets/Fridge-webBrowser/qml/webbrowser/content/assets/*.qml \
    CustomWidgets/Fridge-webBrowser/qml/smallwebbrowser/*.qml \
    CustomWidgets/Fridge-webBrowser/qml/smallwebbrowser/content/*.qml \
    CustomWidgets/Fridge-webBrowser/qml/smallwebbrowser/content/assets/*.qml


RESOURCES += \
    CustomWidgets/Fridge-webBrowser/webBrowserResources.qrc
