import QtQuick 2.9
import QtQuick.Controls 2.5
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
            height: 40
            width: parent.width /2
            text: "Cup ID"
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
        }

        TextField {
            id: cupIdField
            height: 40
            text: "0"
            anchors.left: cupLabel.right
            anchors.top: parent.top
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHRight
            validator: IntValidator{bottom: 0; top: 100000}

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
            height: 40
            width: parent.width /2
            text: "Cup Size (optional)"
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
        }

        ComboBox {
            id: cupSizeField
            height: 40
            displayText: "Any"
            anchors.left: cupSizeLabel.right
            anchors.top: parent.top
            anchors.right: parent.right
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
            height: 40
            width: parent.width /2
            text: "Product ID (optional)"
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
        }

        TextField {
            id: productIDField
            height: 40
            text: "0"
            anchors.left: produktIDLabel.right
            anchors.top: parent.top
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHRight
            validator: IntValidator{bottom: 0; top: 100000}
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
