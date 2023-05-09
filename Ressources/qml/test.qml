import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle{
    id: rect1
    border.width: 1
    border.color: "#546E7A"
    implicitHeight: 50
    Layout.fillWidth: true
    Layout.fillHeight: true
    RowLayout{
        id: row
        anchors.fill: parent
        Text {
            id: id
            text: model.id
            font.pixelSize: 20
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 50
        }
        Text {
            id: name
            text: model.name
            font.pixelSize: 20
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 400
        }
        Text {
            id: quantity
            text: model.quantity
            font.pixelSize: 20
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 100
        }
    }
    MouseArea {
        anchors.fill: rect1
        onClicked: {
            invController.clickMe("Here am I!")
            clickedDelegateSignal()
        }
    }
}
