import QtQuick
import QtQuick.Window

Window {
    width: 640
    minimumWidth : 480
    height: 480
    minimumHeight: 200
    visible: true
    title: qsTr("Warehouse Management")
    color: "#BDBDBD"


    HeaderLine {
        id: headerLine
    }

    ManualController {
        id: manCon01
        anchors.left : parent.left
        anchors.top : headerLine.bottom
    }

    ManualController {
        id: manCon02
        anchors.left : parent.left
        anchors.top : manCon01.bottom
    }


}
