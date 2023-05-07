import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15



Rectangle {
    id: productSlot
    width: parent.width
    height: parent.height
    radius: 10
    border.width: 2
    border.color: "#546E7A"

    property string name: "ProductSlot"

    Text {
        id: title
        text: name
        width: parent.width
        height: 20
        verticalAlignment: Text.AlignVCenter
        minimumPixelSize: 6
        horizontalAlignment: Text.AlignHCenter
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 10
            topMargin: 5
        }

        fontSizeMode: Text.HorizontalFit
        font.bold: true
    }


    RowLayout {
        id: boxRow
        anchors{
            top: title.bottom
            left: parent.left
            right: parent.right
        }

        CheckBox{
            id: detailBox
            checked: false
            text: "Edit"
            font.pixelSize: 12

        }

        CheckBox{
            id: editBox
            checked: false
            text: "Show Details"
            font.pixelSize: 12
        }

    }

    Rectangle {
        id: seperator01
        width:  parent.width
        height: 1
        color: "#546E7A"
        anchors {
            top: boxRow.bottom
            left: parent.left
            topMargin: 0
        }
    }

    Rectangle {
        id: greySpace
        height: parent.height
        width: parent.width
        anchors {
            top: seperator01.bottom
            left: parent.left
            bottom: parent.bottom
            right: parent.right
            margins: 5
        }
        radius: 5
        color: "#607D8B"
        antialiasing: true
        border.width: 1
        border.color: "#263238"
    }
}
