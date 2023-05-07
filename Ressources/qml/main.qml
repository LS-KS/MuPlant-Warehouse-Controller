import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


Window {
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

    Rectangle{
        id: eventWindow
        anchors {
            right: parent.right
            bottom: parent.bottom
            left: roboShow.right
            top: roboShow.bottom
        }


        ManualEventLog{
            id: eventLog
            anchors{
                top: parent.top
                bottom: parent.bottom
                right: parent.right
                left: parent.left
                topMargin: 5
                rightMargin: 5
                bottomMargin: 5
                leftMargin: 5
            }

        }

        Button {
            id:clearButton
            width: 100
            height: 30
            text: "clear"
            anchors {
                top: parent.top
                right: parent.right
                margins: 10
            }

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
