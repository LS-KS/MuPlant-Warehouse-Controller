import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material
import QtQuick.Layouts 1.3

Rectangle {
    id: manRfidServer
    width: parent.width
    height: 200
    radius: 5
    border.color: "#546E7A"
    border.width: 2
    Text {
        id: title
        text: "RFID Server"
        width: parent.width
        height: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.top: parent.top    }
        anchors.margins: 5
    RowLayout{
        id: row1
        width:parent.width
        height: 40
        anchors.top: title.bottom
        anchors.left:parent.left
        anchors.right: parent.right
        anchors.margins: 5


        Text {
            id: cupLabel
            text: "Cup ID"
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: parent.height
            Layout.preferredWidth:  parent.width/2
        }

        TextField {
            id: cupIdField
            text: "0"
            horizontalAlignment: Text.AlignHRight
            validator: IntValidator{bottom: 0; top: 100000}
            Layout.preferredHeight: parent.height
            Layout.preferredWidth:  parent.width/2
        }
    }

    RowLayout{
        id: row2
        width:parent.width
        height: 40
        anchors.top: row1.bottom
        anchors.left:parent.left
        anchors.right: parent.right
        anchors.margins: 5


        Text {
            id: cupSizeLabel
            text: "Cup Size (optional)"
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: parent.height
            Layout.preferredWidth:  parent.width/2
        }

        ComboBox {
            id: cupSizeField
            displayText: "Any"
            Layout.preferredHeight: parent.height
            Layout.preferredWidth:  parent.width/2
        }
    }

    RowLayout{
        id: row3
        width:parent.width
        height: 40
        anchors.top: row2.bottom
        anchors.left:parent.left
        anchors.right: parent.right
        anchors.margins: 5


        Text {
            id: produktIDLabel
            text: "Product ID (optional)"
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: parent.height
            Layout.preferredWidth:  parent.width/2
        }

        TextField {
            id: productIDField
            text: "0"
            horizontalAlignment: Text.AlignHRight
            validator: IntValidator{bottom: 0; top: 100000}
            Layout.preferredHeight: parent.height
            Layout.preferredWidth:  parent.width/2
        }
    }
    Button {
        id: sendButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        enabled: false
        text: "Send"
        anchors.margins: 5

    }
}
