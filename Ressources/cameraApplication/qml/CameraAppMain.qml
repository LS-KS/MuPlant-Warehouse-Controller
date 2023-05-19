import QtQuick 2.15
import QtQuick.Controls 2.15


Window {
    title: "Camera Application"
    color: "white"
    width: 800
    height: 800
    visibility: "Maximized"
    visible: true

    Rectangle {
        id: baseRect
        color: "white"
        anchors.fill: parent
        anchors.margins: 10
        border.color: "#546E7A"
        border.width: 2
        radius: 10
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
    onClosing: {
        camAppLoader.source = ""
    }
}

