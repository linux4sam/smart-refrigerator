/****************************************************************************
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** This qml component is derivative of work done in meego for N950
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.1

Rectangle  {
    x: -190
    y: -115
    height: 230
    width: 300
    id:calendarView
    property int month: today().getMonth()
    property int year: today().getFullYear()
    property date firstDayOfMonth:new Date(year, month, 1)
    property int weekDayOfFirst:firstDayOfMonth.getDay()
    property Rectangle prevCircle
    property Text prevText
    property color background: "#dea2dc"
    property color selectedDayColor: "#23d72c"
    property string currentMonth: getMonthName(today()) + " " + year


    color:  background


    function clone(dateCloned)
    {
        return new Date(dateCloned.getTime());
    }

    function getDayOfMonth(date, offset)
    {
        var day = clone(date);
        day.setDate(offset);
        return day.getDate();
    }

    function getDayOfWeek(date, offset)
    {
        var day = clone(date);
        day.setDate(offset);

        var m = [ "Sun","Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        return m[day.getDay()];
    }

    function getColorOfDay(date, offset)
    {

        var newDay = clone(date);
        newDay.setDate(offset);
        if (newDay.getMonth() === date.getMonth())
            return "black";
        else
            return "#848284";

    }

    function isToday(date, offset)
    {

        var newDay = clone(date);
        newDay.setDate(offset);
        var today = new Date();
        return newDay.toDateString() === today.toDateString();
    }

    function isTodayYear(date, offset, monthClicked, yearClicked)
    {
        var newDay = clone(date);
        newDay.setDate(offset);
        var today = new Date();
        if(getMonthNoShort(newDay.getMonth()) === monthClicked && (newDay.getYear()+1900) === yearClicked && newDay.toDateString() === today.toDateString())
            return true;
        else
            return false;
    }

    function getMonthName(date)
    {
        var m = ['January','February','March','April','May','June','July',
        'August','September','October','November','December'];
        return m[date.getMonth()];
    }

    function getMonthNo(monthNo)
    {
        var m = ['January','February','March','April','May','June','July',
        'August','September','October','November','December'];
        return m[monthNo];
    }

    function getMonthNoShort(monthNo)
    {
        var m = ['Jan','Feb','Mar','Apr','May','Jun','Jul',
        'Aug','Sep','Oct','Nov','Dec'];
        return m[monthNo];
    }

    function today()
    {
        return new Date();

    }

    Rectangle {
        width: parent.width
        color: background
        height: 30
        anchors.top: parent.top
        id: header

        Button {
            id: left
            y: 2
            width: 40
            anchors { left: parent.left; leftMargin: 5}
            buttonImageFront: "qrc:///qml/smallFridgeContents/resources/arrow-left.png"

            onButtonClicked: {
                if (month > 0)
                    month--
                else {
                    year--;
                    month = 11;
                }

                firstDayOfMonth = new Date(year, month, 1);
                weekDayOfFirst = firstDayOfMonth.getDay();
                month = firstDayOfMonth.getMonth();
                year = firstDayOfMonth.getFullYear();
                currentMonth = getMonthName(firstDayOfMonth) + " " + year;
            }
        }

        Button {
            id: right
            y: 2
            width: 40
            anchors { right: parent.right; rightMargin: 5}
            buttonImageFront: "qrc:///qml/smallFridgeContents/resources/arrow-right.png"

            onButtonClicked: {
                    if (month < 11)
                        month++
                    else {
                        year++;
                        month = 0;
                    }

                    firstDayOfMonth = new Date(year, month, 1);
                    weekDayOfFirst = firstDayOfMonth.getDay();
                    month = firstDayOfMonth.getMonth();
                    year = firstDayOfMonth.getFullYear();
                    currentMonth = getMonthName(firstDayOfMonth) + " " + year;

            }

        }

        Text {
            id: monthTitle
            y: 5
            text: currentMonth
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 7
        }
    }

    Grid {
        id:container
        anchors.fill: parent
        anchors.topMargin: 30

        columns: 7
        Repeater {
            model:[ "Sat", "Sun","Mon", "Tue", "Wed", "Thu", "Fri"]
            Rectangle {
                width: container.width / 7
                height: 17
                color: background

                Text {
                    text: modelData
                    verticalAlignment: Text.AlignVCenter
                    anchors.centerIn: parent
                    color: (index < 2)?"yellow":"#737573"
                }
            }
        }

        Repeater {
            model: 42
            Rectangle {

               id:dayContainer
               width: container.width / 7
               height: (container.height - 35) / 7

               Rectangle {

                   id: circle
                   radius: 8
                   color: selectedDayColor
                   width: parent.width / 2
                   height: parent.height / 2
                   anchors.centerIn: parent
                   visible: {
                       if (isTodayYear(today(),   index - weekDayOfFirst, getMonthNoShort(month), year)) {
                           prevCircle = circle;
                           return true;
                       }
                       return false;

                   }

               }

               Text {

                   id: journey;
                   text: getDayOfMonth(firstDayOfMonth,   index - weekDayOfFirst )

                   font.pointSize: 12
                   anchors.centerIn: parent
                   color: {
                       if (circle.visible) return "white";
                       else
                           return getColorOfDay(firstDayOfMonth,   index - weekDayOfFirst );
                   }

               }


               MouseArea {
                   id: mouseArea
                   hoverEnabled:true
                   anchors.fill: parent

                   onClicked: {
                        onScreenBox.expExpDate = getMonthNoShort(month) + " " + journey.text + ", " + year
                        onScreenBox.unloadCalendar()

                   }

               }
            }
        }
    }

    // Close button for the calendar
    Button {
        id: closeButton
        width: 36
        height: 36
        x: parent.width - 18
        y: -18
        buttonImageFront: "qrc:///qml/smallFridgeContents/resources/buttons/button-close-72px.png"

        onButtonClicked: {
            onScreenBox.unloadCalendar()
        }
    }
}
