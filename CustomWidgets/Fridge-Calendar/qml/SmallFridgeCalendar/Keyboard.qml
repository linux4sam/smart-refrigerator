
import QtQuick 1.1
import "assets"

Rectangle {
    id: top_canvas
    transformOrigin: Item.Center
    width: 480
    height: 240
    color: "transparent"
    opacity: 1


    signal sigEnterButtonPressed (string key)

    Rectangle {
        id: root
        transformOrigin: Item.Center
        color: "transparent"
        opacity: 1

        KeyboardLogic {
            id: kbd
            anchors.bottom: parent.bottom
//            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle1
            y:10
            width: parent.width - 100
            anchors.bottom: kbd.top
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            color: "white"
            radius: 8
            border.color: "#000000"

            TextInput {
                id: text_input
                width: parent.width - 10
                height: parent.height * .5
                text: qsTr("text")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 9
                opacity: 0
            }
        }
    }

    state: "default"

    states: [
        State {
            name: "default"

            PropertyChanges {
                target: root
                width: parent.width
                height: 240
            }

            PropertyChanges {
                target: kbd;
                opacity: 1
            }

            PropertyChanges {
                target: text_input
                opacity: 1
            }

        }
    ]

    function presetText(text)
    {
        text_input.text=text;
    }

}

