import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.3
import inventorycontroller 1.0

Rectangle{
    width: parent.width /3
    height: parent.height /2
    color: "white"

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

    Image {
        id: roboImage
        source: "../assets/robot_ref_img.png"
        anchors{
            top: parent.top
            right: parent.right
            margins: 10
        }

        height: 0.5*parent.height
        fillMode: Image.PreserveAspectFit
    }

    ProductSlot {
        id : mobileRobot
        width: parent.width/3
        height: parent.height/3
        name: "Mobile Robot"
        anchors{
            bottom: parent.bottom
            left:  parent.left
            margins: 20
        }
    }

    ProductSlot {
        id : workBench
        width: parent.width/3
        height: parent.height/3
        name: "Work Bench"
        anchors{
            bottom: parent.bottom
            right:  parent.right
            margins: 20
        }

    }
}
