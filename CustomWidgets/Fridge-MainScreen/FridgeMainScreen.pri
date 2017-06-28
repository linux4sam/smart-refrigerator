INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

#
# Add more folders to ship with the application, here
#
mainscreen.source = CustomWidgets/Fridge-MainScreen/qml/FridgeMainScreen
mainscreen.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen/qml
smallmainscreen.source = CustomWidgets/Fridge-MainScreen/qml/smallFridgeMainScreen
smallmainscreen.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen/qml
mainscreen2.source = CustomWidgets/Fridge-MainScreen/fridge_screens_list.xml
mainscreen2.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen
smallmainscreen2.source = CustomWidgets/Fridge-MainScreen/smallfridge_screens_list.xml
smallmainscreen2.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen
screens.source = CustomWidgets/Fridge-MainScreen/applications
screens.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen
background.source = CustomWidgets/Fridge-MainScreen/resources
background.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen
smallbackground.source = CustomWidgets/Fridge-MainScreen/smallResources
smallbackground.target = output/SmartRefrigerator/CustomWidgets/Fridge-MainScreen
DEPLOYMENTFOLDERS += mainscreen smallmainscreen mainscreen2 smallmainscreen2 screens background smallbackground


#CONFIG += qdeclarative-boostable
#QT += core gui declarative


OTHER_FILES += \
    CustomWidgets/Fridge-MainScreen/qml/FridgeMainScreen/RssModel.qml \
    CustomWidgets/Fridge-MainScreen/qml/FridgeMainScreen/Page.qml \
    CustomWidgets/Fridge-MainScreen/qml/FridgeMainScreen/main.qml \
    CustomWidgets/Fridge-MainScreen/qml/FridgeMainScreen/ApplicationDelegate.qml \
    CustomWidgets/Fridge-MainScreen/qml/smallFridgeMainScreen/RssModel.qml \
    CustomWidgets/Fridge-MainScreen/qml/smallFridgeMainScreen/Page.qml \
    CustomWidgets/Fridge-MainScreen/qml/smallFridgeMainScreen/main.qml \
    CustomWidgets/Fridge-MainScreen/qml/smallFridgeMainScreen/ApplicationDelegate.qml \
    CustomWidgets/Fridge-MainScreen/smallfridge_screens_list.xml

RESOURCES += \
    CustomWidgets/Fridge-MainScreen/MainScreenResources.qrc

