/*
 * This file is part of MeeGo Keyboard
 *
 * Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies). All rights reserved.
 *
 * Contact: Mohammad Anwari <Mohammad.Anwari@nokia.com>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Nokia Corporation nor the names of its contributors may be
 * used to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import QtQuick 1.0

Column {
    property variant row1:["q1", "w2", "e3", "r4", "t5", "y6", "u7", "i8", "o9", "p0"]
    property variant row2: ["a*", "s#", "d+", "f-", "g=", "h(", "j)", "k?", "l!"]
    property variant row3: ["z@", "x~", "c/", "v\\", "b'", "n;", "m:"]
    property variant accents_row1: ["", "", "eèéêë", "", "tþ", "yý", "uûùúü", "iîïìí", "oöôòó", ""]
    property variant accents_row2: ["aäàâáãå", "", "dð", "", "", "", "", "", ""]
    property variant accents_row3: ["", "", "cç", "", "", "nñ", ""]

    property int columns: Math.max(row1.length, row2.length, row3.length)
    property int keyWidth: (columns == 11) ? 65 : 70
    property int keyHeight: 46
    property int keyMargin: (columns == 11) ? 3 : 5
    property bool isShifted: false
    property bool inSymView: false

    Rectangle { //VKB background
        id: vkb
        color: "#222"
        width: 800
        height: 230
        z: 100

        Column { //Holder for the VKB rows
            anchors.fill: parent
            anchors.topMargin: 4
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            Row { //Row 1
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: keyMargin
                Repeater {
                    model: row1
                    CharacterKey {
                        width: keyWidth; height: keyHeight
                        caption: row1[index][0]
                        captionShifted: row1[index][0].toUpperCase()
                        symView: row1[index][1]
                    }
                }

            } //end Row1

            Row { //Row 2
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: keyMargin
                Repeater {
                    model: row2
                    CharacterKey {
                        width: keyWidth; height: keyHeight
                        caption: row2[index][0]
                        captionShifted: row2[index][0].toUpperCase()
                        symView: row2[index][1]
                    }
                }
            } //end Row2

            Row { //Row 3
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: (columns == 11) ? 54 : 26
                FunctionKey {
                    width: 80; height: keyHeight
                    icon: (isShifted) ? "icon-m-input-methods-shift-uppercase.svg" : "icon-m-input-methods-shift-lowercase.svg"
                    onClickedPass: { isShifted = (!isShifted) }
                }
                Row {
                    spacing: keyMargin
                    Repeater {
                        model: row3
                        CharacterKey {
                            width: keyWidth; height: keyHeight
                            caption: row3[index][0]
                            captionShifted: row3[index][0].toUpperCase()
                            symView: row3[index][1]
                        }
                    }
                }
                FunctionKey {
                    width: 80; height: keyHeight
                    icon: "icon-m-input-methods-backspace.svg"
                    onClickedPass: { foodText.selectAll(); foodText.select(0,foodText.selectionEnd-1); foodText.text = foodText.selectedText; }
                }
            } //end Row3

            Row { //Row 4
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: (columns == 11) ? 32 : 26
                FunctionKey {
                    width: 110; height: keyHeight
                    caption: "?123"
                    onClickedPass: { inSymView = (!inSymView) }
                }
                Row {
                    spacing: keyMargin
                    CharacterKey { caption: ","; captionShifted: ","; width: 120; height: keyHeight }
                    CharacterKey { caption: " "; captionShifted: " "; width: 228; height: keyHeight }
                    CharacterKey { caption: "."; captionShifted: "."; width: 120; height: keyHeight }
                }
                FunctionKey {
                    width: 110; height: keyHeight
                    icon: "icon-m-input-methods-enter.svg"
                    onReleased: {

/*
                        if (foodText.text[0] == "/") foodText.text = "file://"+foodText.text
                        if (foodText.text.indexOf(":")<0) {
                            if (foodText.text.indexOf(".")<0 || foodText.text.indexOf(" ")>=0) {
                                // Fall back to a search engine; hard-code Wikipedia
                                foodText.text =  "http://www.epicurious.com/search?q="+foodText.text
                            } else {
                                foodText.text =  "http://"+foodText.text
                            }
                        }*/

                        foodContainer.foodEntered(foodText.text)
                        //webView.focus = true
                        keyboard.visible = false;

                    }
                }
            } //end Row4
        }//end Column
    } //end VKB area
} //end VKB
