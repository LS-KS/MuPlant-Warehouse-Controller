import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import InventoryController 1.0



Rectangle{
    InvController {
        id: invController
    }
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

            ListView {
                id: inventoryList
                model: productSummaryModel
                anchors.fill: parent
                anchors.margins: 10
                delegate: Rectangle{
                            id: rect1
                            border.width: 1
                            border.color: "#546E7A"
                            implicitHeight: 50
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            RowLayout{
                                id: row
                                Text {
                                    id: id
                                    text: model.id
                                    font.pixelSize: 20
                                    Layout.preferredWidth: 50
                                }
                                Text {
                                    id: name
                                    text: model.name
                                    font.pixelSize: 20
                                    Layout.preferredWidth: 400
                                }
                                Text {
                                    id: quantity
                                    text: model.quantity
                                    font.pixelSize: 20
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
                clip: true
            }
        }


    }
}
