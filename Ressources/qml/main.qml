import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import inventorycontroller 1.0
import eventlogcontroller 1.0


Window {

    InvController {
        id: invController
    }
    EventController{
        id: eventController
    }

    width: Screen.width
    minimumWidth : 480
    height: Screen.height
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

    ABBRobotConfig {
        id: abbConfig
        anchors.top: manCon01.bottom
        anchors.left: parent.left
    }

    ProduktList {
        id: productlist
        anchors.top: abbConfig.bottom
        anchors.bottom: parent.bottom
    }

    ABBRobot {
        id: roboShow
        x: manCon01.width
        anchors.top: headerLine.bottom
    }

    Eventlogger {
        id: eventlogger
        anchors {
            right: parent.right
            bottom: parent.bottom
            left: roboShow.right
            top: roboShow.bottom
        }
    }

    Inventory {
        width: roboShow.width
        height: parent.height - roboShow.height - headerLine.height
        anchors{
            top: roboShow.bottom
            left: roboShow.left
            right: roboShow.right
        }
    }

    Storage {
        id: storage
        anchors {
            left: roboShow.right
            top:  headerLine.bottom
            right: parent.right
            bottom: roboShow.bottom

        }
    }

}
