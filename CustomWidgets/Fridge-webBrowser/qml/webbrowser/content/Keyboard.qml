
import QtQuick 1.0
import "assets"

Rectangle {
    id: keyboard
    transformOrigin: Item.Center
    width: 800
    height: 480
    color: "transparent"
    opacity: 1

    Rectangle {
        id: root
        transformOrigin: Item.Center
        color: "transparent"
        opacity: 1

        KeyboardLogic {
            id: kbd
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
/*
        TextInput {
            id: text_input
            x: 226
            y: 213
            text: qsTr("text")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            opacity: 100
        }*/
    }

    state: "default"

    states: [
        State {
            name: "default"

            PropertyChanges {
                target: root
                rotation: 0
                width: parent.width
                height: 300
                x: 0
                y: 0
            }

            PropertyChanges {
                target: kbd;
                opacity: 1
            }

 /*           PropertyChanges {
                target: text_input
                x: 133
                y: 25
                width: 519
                height: 41
                font.pixelSize: 22
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }*/

            PropertyChanges {
                target: keyboard
                height: 300
            }
        }
    ]

    function presetText(text)
    {
        urlText.text=text;
    }

}

