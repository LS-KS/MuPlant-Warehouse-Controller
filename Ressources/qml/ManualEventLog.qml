import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material
import QtQuick.Layouts 1.3

Rectangle {
    id: pane
    width: parent.width
    height: 200
    radius: 10
    border.color: "#546E7A"
    border.width: 2

    Text {
        id: manEventLogTitle
        text: qsTr("Event Log:")
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 30
        verticalAlignment: Text.AlignVCenter
    }

    ScrollView {
        id: scrollView
        width: parent.width
        anchors.top: manEventLogTitle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        TextArea {
            id: manEventLog
            width: parent.width
            height: parent.height
            anchors.fill: parent
        }
    }


}
