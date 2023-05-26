import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material
import QtQuick.Layouts 1.15
/*
This QML Item enables the user to configure The ModBus settings.
Rectangle is the parent which stores all other elements
*/
Rectangle{
    width: parent.width-20
    height: 90
    // Rowlayouts store each a label and a TextField or Combobox
    RowLayout{
        height: 30
        width: parent.width
        id: row1
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        Text {
            id: label_ip
            text: qsTr("IP Adress")
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: parent.width/3
            Layout.preferredHeight: parent.height
        }

        TextField {
            id: abbIp
            placeholderText:  "Enter ModBus IP"
            Layout.preferredWidth: 2*parent.width/3
            Layout.preferredHeight: parent.height
        }
    }

    RowLayout{
        id: row2
        height:30
        width:parent.width
        anchors.top: row1.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        Text {
            id: labelTries
            text: qsTr("Max. Tries")
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: parent.width/3
            Layout.preferredHeight: parent.height
        }

        TextField {
            id: maxTriesField
            placeholderText:  "Enter max. Tries"
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 2*parent.width/3
            Layout.preferredHeight: parent.height
        }
    }


    RowLayout{
        id: row3
        height: 30
        width: parent.width
        anchors.top: row2.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        Button {
            id: startButton
            text: "Start"
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight: parent.height
        }
        Button {
            id: modifyButton
            text: "Modify"
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight: parent.height
        }
    }

}
