import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.3
/*
  This QML Item shows a symbolic imgage of the robotic arm and visualizes product information in workbench and turtle bot.
  A Rectangle is basic parent for evry qml item.
  */
Rectangle{
    width: parent.width /3
    height: parent.height /2
    color: "white"
    // The startButton is meant to start the Application.
    Button{
        id: startButton
        text: "START"
        width:  parent.width/4
        height: 60 < parent.height/10 ? 60: parent.height/10
        font.pixelSize: 12
        font.bold: true
        anchors {
            left: parent.left
            top: parent.top
            margins: 5
        }
    }
    // This displays the symbolic picture of the robotic arm.
    Image {
        id: roboImage
        source: "../assets/robot_ref_img.png"
        anchors{
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            margins: 10
        }

        height: 0.5*parent.height
        fillMode: Image.PreserveAspectFit
    }
    // Custom QML Item which shows product id's, cup id'S and if there is a pallet or not. Enables the user to manually override the storage in turtle bot.
    ProductSlot {
        id : mobileRobot
        width: parent.width/3
        height: parent.height/3 > 210? parent.height/3 : 210
        name: "Mobile Robot"
        anchors{
            bottom: parent.bottom
            left:  parent.left
            margins: 20
        }
    }
    // Custom QML Item which shows product id's, cup id's and if there is a pallet or not. Enables the user to manually override the storage in workbench.
    ProductSlot {
        id : workBench
        width: parent.width/3
        height: parent.height/3 > 210? parent.height/3 : 210
        name: "Work Bench"
        anchors{
            bottom: parent.bottom
            right:  parent.right
            margins: 20
        }

    }
}
