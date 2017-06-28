
import QtQuick 1.1

PathView {
    id: food_path_view

    property variant currentValue


    function setCurrentValue(value) {
        for ( var i = 0; i < model.length; i++ ) {
            if ( model[i] === value ) {
                i -= 2
                if ( i < 0 )
                    i += model.length
                currentIndex = i
                break
            }
        }
    }

    width: 130
    height: Math.floor( model.length / 3 ) * 130
    y: -10
   delegate: Text {
        font.family: "Arial"
        font.bold: true
        smooth: false
        color: modelData !== "SELECT" ? "black" : "yellow"
        text: modelData
        anchors {horizontalCenter: parent.horizontalCenter; horizontalCenterOffset: 7}
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Component.onCompleted: {
            font.pixelSize = 11
        }
    }

    // The vertical path is defined here.
    path: Path {
        id: path
        startX: food_path_view.width / 2
        PathLine {
            x: path.startX
            y: food_path_view.height
        }
    }

    // if the currentIndex changes we set the current value appropriate
    onCurrentIndexChanged: {
        var index = ( currentIndex + 2 ) % model.length
        currentValue = model[ index]
    }

    MouseArea {
        id: topArea
        x: 0
        y: 20
        width: 100
        height: 29
        onClicked: food_path_view.incrementCurrentIndex()
    }
    MouseArea {
        id: bottomArea
        x: 0
        y: 90
        width: 100
        height: 29
        onClicked: food_path_view.decrementCurrentIndex()
    }
}
