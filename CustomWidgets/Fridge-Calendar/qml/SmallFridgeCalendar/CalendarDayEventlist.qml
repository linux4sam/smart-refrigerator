import QtQuick 1.1

Item
{
    id: calendarEventlistRoot
    property Item rootElement: null
    property int repeaterIndex: 0

    function createRect(varY)
    {
        var component = Qt.createComponent("CalendarDayEvent.qml");
        var rect = component.createObject(calendarEventlistRoot,{"width": parent.width
                                              ,"height": mainCalendarRect.hourHeight, "y": varY});
    }

    function timeToPosition(hours, minutes)
    {
        var newYPos = 0;
        var percentageMinutes = (minutes / 59)
        newYPos += (hours * hourHeight) + (hourHeight * percentageMinutes)

        return newYPos
    }

    function timeBlockToPosition(numberOfHours, numberOfQuarters)
    {
        var hoursPos = numberOfHours * hourHeight
        var quarterPos = numberOfQuarters * 13

        if(numberOfQuarters < 2)
        {
            quarterPos += 1
        }
        else if(numberOfQuarters >= 2)
        {
            quarterPos += 2
        }

        return hoursPos + quarterPos
    }

    function mouseToTimePosition(mouseY)
    {
        if(mouseY < 0 || mouseY > data.height) return;

        var numberOfHours = Math.floor(mouseY / hourHeight)
        var remainingPosition = mouseY % hourHeight
        var numberOfQuarters = Math.floor(remainingPosition / 13)

        return {numOfHours: numberOfHours, numOfQuarters: numberOfQuarters}
    }

    // convenient function so that i only need one call to get the position
    function mouseToPosition(mouseY)
    {
        var cellData = mouseToTimePosition(mouseY)
        return timeBlockToPosition(cellData.numOfHours, cellData.numOfQuarters)
    }

    Component
    {
        id: hourDelegate

        Rectangle
        {
            width: calendarEventlistRoot.width
            height: mainCalendarRect.hourHeight
            color: "transparent"

            Column
            {
                anchors.fill: parent

                // Top silver line
                Rectangle
                {
                    height: 1
                    width: parent.width
                    color: "silver"
                }

                // first half hour
                Rectangle
                {
                    height: mainCalendarRect.halfHourHeight
                    width: parent.width
                    color: "white"
                }

                // half hour devider
                Rectangle
                {
                    height: 1
                    width: parent.width
                    color: "#E6E6E6"
                }

                // last half hour
                Rectangle
                {
                    height: mainCalendarRect.halfHourHeight
                    width: parent.width
                    color: "white"
                }
            }
        }
    }

    Column
    {
        id: data
        width: calendarEventlistRoot.width
        Repeater
        {
            model: 24 // A day has 24 hours..
            delegate: hourDelegate
        }

        // Bottom silver line
        Rectangle
        {
            height: 1
            width: parent.width
            color: "silver"
        }
    }



    MouseArea
    {
        acceptedButtons: Qt.LeftButton
        width: parent.width
        height: parent.height
        enabled: true
        id: encapsulatingMouseArea
        preventStealing: true
        property int yStartPosition: 0

        signal enableArea()
        signal disableArea()

        onEnableArea:
        {
            enabled = true
        }

        onDisableArea:
        {
            enabled = false
        }

        onPressed:
        {
            yStartPosition = mouseY
            createRect(calendarEventlistRoot.mouseToPosition(mouseY))
        }
    }

    CalendarDayEvent
    {
        Component.onCompleted:
        {
            visible = true
        }

        width: calendarEventlistRoot.width
        listIndex: calendarEventlistRoot.repeaterIndex
    }
}
