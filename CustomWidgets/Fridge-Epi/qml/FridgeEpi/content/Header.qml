/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

Image {
    id: header
    width: parent.width

    property bool urlChanged: false

    source: "pics/titlebar-bg.png"; fillMode: Image.TileHorizontally

    Column {
        width: parent.width

        Item {
            width: parent.width; height: 20
            Text {
                anchors.centerIn: parent
                text: webView.title; font.pixelSize: 14; font.bold: true
                color: "white"; styleColor: "black"; style: Text.Sunken
            }
        }

        Item {
            width: parent.width; height: 40

            Button {
                id: backButton
                action: webView.back; image: "pics/go-previous-view.png"
                anchors { right: nextButton.left; bottom: parent.bottom; rightMargin: 10}
            }

            Button {
                id: nextButton
                anchors { right: reloadButton.left; rightMargin: 10 }
                action: webView.forward; image: "pics/go-next-view.png"
            }

            Button {
                id: reloadButton
                anchors { right: flipBackButton.left; rightMargin: 10 }
                action: webView.reload; image: "pics/view-refresh.png"
                visible: webView.progress == 1.0
            }

            Button {
                id: stopButton
                anchors { right: flipBackButton.left;  rightMargin: 10 }
                action: webView.stop; image: "pics/edit-delete.png"
                visible: webView.progress < 1.0
            }

            Button {
                id: flipBackButton
                anchors { right: parent.right; rightMargin: 30}

                onClicked: {

                    header.urlChanged = false
                    recepieFlip.state = "baseState"
                }
                image: "pics/button-done.png"
            }
        }
    }
}
