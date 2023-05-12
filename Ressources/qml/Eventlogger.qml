import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Rectangle{
    id: eventWindow
    anchors {
        right: parent.right
        bottom: parent.bottom
        left: parent.right
        top: parent.bottom
    }


    Rectangle {
        id: pane
        radius: 10
        border.color: "#546E7A"
        border.width: 2
        anchors.fill: parent
        property string dateTimeFormat: "yyyy-MM-dd hh:mm:ss"

        Text {
            id: eventLogTitle
            text: qsTr("Event Log:")
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 30
            verticalAlignment: Text.AlignVCenter
        }

        ScrollView {
            id: eventScrollView
            width: parent.width
            anchors.top: eventLogTitle.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10

            TextArea {
                id: eventLogTextArea
                width: parent.width
                height: parent.height
                anchors.fill: parent
                readOnly: true

            }
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
        onClicked: {
            eventLogTextArea.text = ""
        }

    }
    Connections{
        target: eventLogController
        function onNewSignal(message){
            eventLogTextArea.text = message+ "\n"+ eventLogTextArea.text
        }
    }
}
