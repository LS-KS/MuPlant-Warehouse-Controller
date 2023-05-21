import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15


Window {
    id: window
    title: "Warehouse Management - Camera Application"
    color: "white"
    width: 800
    height: 800
    visibility: "Maximized"
    visible: true

    Rectangle {
        id: baseRect
        visible: true
        color: "white"
        anchors.fill: parent
        anchors.margins: 10
        border.color: "#546E7A"
        border.width: 2
        radius: 10

        Rectangle{
            id: imRim
            width: baseRect.width
            height: baseRect.height * 0.7
            anchors{
                top: baseRect.top
                left: baseRect.left
                right: baseRect.right
            }
            border.color: "#546E7A"
            border.width: 2
            radius: 10
            Image {
                id: camImage
                width: parent.width
                height: parent.height
                anchors.fill: parent
                anchors.margins: 10
                source: "image://camApp/img"
                property bool counter: false
            }
            Connections{
                target: camApp
                function onImageChanged(image){
                    console.log("new image emitted")
                    camImage.counter = !camImage.counter
                    camImage.source = "image://camApp/img?id="+camImage.counter
                }
            }

        }

        Text {
            text: "arUco Camera Application"
            font.pixelSize: 24
            font.bold: true
            anchors.left: baseRect.left
            anchors.right: baseRect.right
            anchors.top: baseRect.top
            anchors.topMargin: 20
            horizontalAlignment: Text.AlignHCenter
        }

        RowLayout{
            id: buttonBar
            anchors.left: imRim.left
            anchors.right: imRim.right
            anchors.top: imRim.bottom
            height: 100
            anchors.rightMargin: 100
            anchors.leftMargin: 100
            anchors.topMargin: 10

            Row{
                Button{
                    text: "Camera Start"
                    width: 200
                    height: 50
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        camApp.start()
                    }
                }

                Button{
                    text: "Detection Start"
                    width: 200
                    height: 50
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                }

                Button{
                    text: "Camera Stop"
                    width: 200
                    height: 50
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    onClicked: {
                        camApp.stop()
                    }
                }

                Layout.alignment: Qt.AlignHCenter
            }
        }

    }

    onClosing: {
        camAppLoader.source = ""
        camApp.stop()
    }
}

