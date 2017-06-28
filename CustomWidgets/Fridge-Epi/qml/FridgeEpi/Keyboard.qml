
import QtQuick 1.1
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

            PropertyChanges {
                target: keyboard
                height: 300
            }
        }
    ]

    function presetText(text)
    {
        foodText.text=text;
    }

}

