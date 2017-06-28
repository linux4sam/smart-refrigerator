
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

    width: 200
    height: Math.floor( model.length / 3 ) * 200
    y: -20
   delegate: Text {
        font.family: "Arial"
        font.bold: true
        smooth: false
        color: modelData !== "SELECT" ? "black" : "yellow"
        text: modelData
        anchors {horizontalCenter: parent.horizontalCenter; horizontalCenterOffset: 15}
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Component.onCompleted: {
            font.pixelSize = 22
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
        y: 40
        width: 200
        height: 59
        onClicked: food_path_view.incrementCurrentIndex()
    }
    MouseArea {
        id: bottomArea
        x: 0
        y: 180
        width: 200
        height: 59
        onClicked: food_path_view.decrementCurrentIndex()
    }
}
