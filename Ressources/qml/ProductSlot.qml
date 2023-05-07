import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15



Rectangle {
    id: productSlot
    width: 200
    height: 400
    radius: 10
    border.width: 2
    border.color: "#546E7A"

    property string name: "ProductSlot"
    property string cupA: ""
    property string prodA: ""
    property string nameA: ""
    property string cupB: ""
    property string prodB: ""
    property string nameB: ""

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
        id: greySpace
        height: parent.height
        width: parent.width
        anchors {
            top: boxRow.bottom
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
        ColumnLayout{
            anchors.fill: parent
            spacing: 2
            Rectangle{
                implicitHeight: parent.height/2-10
                implicitWidth: parent.width
                color: "white"
                border.color: "#546E7A"
                border.width: 2
                radius: 5
                ColumnLayout{
                   anchors.fill: parent
                   Text{
                       text:"Cup ID: "+cupA
                       horizontalAlignment: Text.AlignHCenter
                       Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                   }
                   Text{
                       text:"Produkt ID: "+prodA
                       horizontalAlignment: Text.AlignHCenter
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                   }
                   Text{
                       text:nameA
                       horizontalAlignment: Text.AlignHCenter
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                   }

                }
            }
            Rectangle{
                implicitHeight: parent.height/2-10
                implicitWidth: parent.width
                color: "white"
                border.color: "#546E7A"
                border.width: 2
                radius: 5
                ColumnLayout{
                   anchors.fill: parent
                   Text{
                       width: parent.width
                       text:"Cup ID: "+cupB
                       horizontalAlignment: Text.AlignHCenter
                       Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                   }
                   Text{
                       width: parent.width
                       text:"Produkt ID: "+prodB
                       horizontalAlignment: Text.AlignHCenter
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                   }
                   Text{
                       width: parent.width
                       text:nameB
                       horizontalAlignment: Text.AlignHCenter
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                   }

                }
                Layout.fillHeight: parent
            }

        }
    }
}
