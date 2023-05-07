import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Rectangle{

    Rectangle{
        id: window
        color: "white"
        radius: 10

        border.color: "#546E7A"
        border.width: 2
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 5
        }

        Text {
            id: label
            text: "Inventory"
            font.pixelSize: 12
            font.bold: true
            anchors{
                top: parent.top
                left: parent.left
                margins: 15

            }
        }

        CheckBox {
            id: showEmpty
            checked:  true
            text: "Show empty Entries"
            font.pixelSize: 12
            anchors{
                top: parent.top
                right: parent.right
            }
        }

        Rectangle{
            color: "white"
            radius: 5

            border.color: "#546E7A"
            border.width: 1
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right

                topMargin: 40
                bottomMargin: 10
                leftMargin: 10
                rightMargin: 10
            }

            TableView{
                id: inventoryTable

                anchors.fill: parent
                clip: true
                interactive: true
                columnSpacing: 5
                rowSpacing: 5
                model: inventoryModel

                delegate: Component {
                    id: namedelegate
                    Rectangle{
                        implicitHeight: 100
                        implicitWidth: 100
                        Text {
                            id: element
                            text: "Cup"+ model.a_CupID
                        }
                        border.color: "black"
                        border.width: 2
                    }
                }
            }
        }


    }
}
