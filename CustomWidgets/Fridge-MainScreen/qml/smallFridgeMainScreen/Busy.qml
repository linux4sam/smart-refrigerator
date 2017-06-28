
import QtQuick 1.1

Image {
    id: loading
    property bool active: false

    source: "../../applications/smallResources/busy.png"; visible: loading.active
    NumberAnimation on rotation { running: loading.active; from: 0; to: 360; loops: Animation.Infinite; duration: 1000 }
}
