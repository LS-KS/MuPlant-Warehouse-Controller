import QtQuick 2.15
import QtQuick.Controls 2.5
Rectangle{
    width: parent.width -10
    height: 90

    Text {
        id: label_ip
        text: qsTr("IP Adress")
        height: 30
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: abbIp.left
        anchors.bottom: labelTries.top
        horizontalAlignment: Text.AlignHCenter
    }

    TextField {
        id: abbIp
        height: 30
        anchors.left: label_ip.right
        anchors.right: parent.right
        placeholderText:  "Enter ModBus IP"
    }

    Text {
        id: labelTries
        y: 30
        text: qsTr("Max. Tries")
        height: 30
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.top: label_ip.bottom
        anchors.right: maxTriesField.left
    }

    TextField {
        id: maxTriesField
        height: 30
        anchors.top: abbIp.bottom
        anchors.left: label_ip.right
        anchors.right: parent.right
        placeholderText:  "Enter max. Tries"
    }

    Button {
        id: startButton
        text: "Start"
        height: 30
        anchors.left: maxTriesField.left
        anchors.top : maxTriesField.bottom
        anchors.rightMargin: 10
    }
    Button {
        id: modifyButton
        text: "Modify"
        height: 30
        anchors.right: parent.right
        anchors.top : maxTriesField.bottom
        anchors.left: startButton.right
    }
}
