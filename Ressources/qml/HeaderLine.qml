import QtQuick 2.15

Rectangle {
        id: headerLine
        width: parent.width
        height: 60
        color : "white"
        anchors.top : parent.top
        anchors.left : parent.left

        Image {
            id: uniKassel
            source: "../assets/logo_unikassel.jpg"
            height: parent.height / 2 -10
            fillMode: Image.PreserveAspectFit
            anchors.left : parent.left
            anchors.top : parent.top
            anchors.margins: 5
        }

        Image {
            id: mrt
            source: "../assets/logo_mrt.png"
            height: parent.height / 2 -10
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter : uniKassel.horizontalCenter
            anchors.top : uniKassel.bottom
            anchors.margins: 5
        }

        Text {
            id: titleText
            width: headerLine.width / 2
            height: headerLine.height
            text: "μPlant Model Factory: Warehouse"
            anchors.left : uniKassel.right
            anchors.top : headerLine.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Image {
            id: muPlant
            source: "../assets/logo_uPlant.png"
            height: headerLine.height -10
            fillMode: Image.PreserveAspectFit
            anchors.right : headerLine.right
            anchors.top : headerLine.top
            anchors.margins: 5
        }

    }