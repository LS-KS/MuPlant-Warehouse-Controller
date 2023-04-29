import QtQuick 2.15
import QtQuick.Controls 2.5
Rectangle{
    width: parent.width -10
    height: 80
    Text {
        id: label_ModBusConfiguration
        width: window.width
        height: 15
        text: qsTr("ModBus Configuration")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Text {
        id: label_ip
        text: qsTr("IP Adress")
        width : parent.width /3 -5
        height: 30
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.top: label_ModBusConfiguration.bottom
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: label_port
        text: qsTr("Port:")
        width : parent.width /5-5
        height: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.left: label_ip.right
        anchors.top: label_ModBusConfiguration.bottom
    }

    Text {
        id: label_connect
        height: 30
        text: qsTr("Disconnected")
        verticalAlignment: Text.AlignVCenter
        font.styleName: "Semibold"
        horizontalAlignment: Text.AlignHCenter
        anchors.right:parent.right
        anchors.rightMargin: 10
        anchors.left: label_port.right
        anchors.leftMargin: 10
        anchors.top: label_ModBusConfiguration.bottom
        font.bold: true
        font.weight: 10
    }
    TextField {
        width: label_ip.width
        height: label_ip.height
        anchors.left: label_ip.left
        anchors.top: label_ip.bottom
        placeholderText:  "Enter ModBus IP"
    }
    TextField {
        width: label_port.width
        height: label_port.height
        anchors.left: label_port.left
        anchors.top: label_port.bottom
        placeholderText: "Enter Port"
    }

    Button {
        text: "Start"
        width: label_connect.width -5
        height: label_port.height
        anchors.right: label_connect.right
        anchors.top : label_ip.bottom
        anchors.rightMargin: 10
    }
}
