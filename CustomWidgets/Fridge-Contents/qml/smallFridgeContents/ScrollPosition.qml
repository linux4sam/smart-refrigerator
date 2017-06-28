// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: scrollPosition

    property real position: 0.5
    property real zoom: 0.5
    property bool isScrollbarVisible: false
    property real scrollBarWidth: scrollInd.height - scrollBar.heigt

    function getY(position) {
        if (zoom == 1 || position < 0)
            return 0;
        else if (position > 1-zoom)
            return scrollInd.height-scrollBar.height;
        else
            return position / (1-zoom) *(scrollBar.height - scrollInd.height);
    }

    width: scrollInd.width

    // Background area
    Rectangle {
        id: scrollBar

        y: scrollInd.height / 2
        x: scrollInd.width / 2 - width /2
        color: "black"
        border.color:"white"
        border.width: 2
        width: 6
        height: parent.height - scrollInd.height
        radius: 2
        opacity: 0
    }

    // Knob that displays the relative position
    Image {
        id: scrollInd

//        source: "../images/scroll_indicator.png"
        y: getY(position)
        opacity: 0
    }

    states:
        State {
            name: "shown"
            when: isScrollbarVisible
            PropertyChanges{ target: scrollInd; opacity: 1 }
            PropertyChanges{ target: scrollBar; opacity: 0.2 }
        }

    transitions:
        Transition {
            NumberAnimation{ properties: "opacity"; easing.type: "InOutQuad"; duration: 400 }
        }
}
