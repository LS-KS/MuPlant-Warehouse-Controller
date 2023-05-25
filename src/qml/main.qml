import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

/*
  Create ApplicationWindow object as base which stores all other elements
  */

ApplicationWindow {

    property bool init: false
    id: mainWindow
    width: Screen.width
    minimumWidth : 480
    height: Screen.height
    minimumHeight: 200
    visible: true
    title: qsTr("Warehouse Management")
    color: "#BDBDBD"

    // custom QML Item which holds logo and welcome String
    HeaderLine {
        id: headerLine
    }

    // custom QML Item which stores all GUI elements to perform manual operations in storage
    ManualController {
        id: manCon01
        anchors.left : parent.left
        anchors.top : headerLine.bottom
    }

    // custom QML Item where users can eprform all necessary configurations regarding the ABB robottic arm
    ABBRobotConfig {
        id: abbConfig
        anchors.top: manCon01.bottom
        anchors.left: parent.left
    }

    // custom QML Item which shows all possible products (product id and name)
    ProductList {
        id: productlist
        anchors.top: abbConfig.bottom
        anchors.bottom: parent.bottom
    }

    // cutsom QML Item which stores a symbolic picture of the robotic arm and the storage of turtle bot and workbench
    ABBRobot {
        id: roboShow
        x: manCon01.width
        anchors.top: headerLine.bottom
    }

    // custom QML Item which shows events happening in the program.
    Eventlogger {
        id: eventlogger
        anchors {
            right: parent.right
            bottom: parent.bottom
            left: roboShow.right
            top: roboShow.bottom
        }
    }

    // custom QML Item which shows a list with product id, name and quantitiy in storage
    Inventory {
        width: roboShow.width
        height: parent.height - roboShow.height - headerLine.height
        anchors{
            top: roboShow.bottom
            left: roboShow.left
            right: roboShow.right
        }
    }

    // custom QML Item which visualizes the rows, columns and pallet content in storage
    Storage {
        id: storage
        anchors {
            left: roboShow.right
            top:  headerLine.bottom
            right: parent.right
            bottom: roboShow.bottom

        }
    }

    // if the GUI has rendered every Item, pass an event to eventlogger
    onAfterRendering: {
        if (!init){
            eventLogController.writeEvent("QML", "Program GUI fully rendered")
            init = true
        }
    }
}
