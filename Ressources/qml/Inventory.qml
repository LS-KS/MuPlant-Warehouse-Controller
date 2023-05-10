import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import inventorycontroller 1.0

//Uses InventoryModel.py DataModel consisting of Produkte.db and StorageData to render ListView
//with id, name and quantity

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
            onCheckedChanged: {
                    console.log("checkstatechanged!")
                    if (checked) {
                        inventoryFilterModel.setShowZero(true)
                    } else {
                        inventoryFilterModel.setShowZero(false)
                    }
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
                //model: productSummaryModel
                model: inventoryFilterModel
                anchors.fill: parent
                anchors.margins: 10
                clip: true
                spacing: 5
                Layout.fillWidth: true
                delegate:Rectangle{
                    id: rect1
                    width: ListView.view.width
                    height: 50
                    property bool selected: false
                    color: selected ? "#4FC3F7": "white"

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
                        anchors.fill: parent
                        onClicked: {
                            if(!rect1.selected) {
                                invController.clickMe(model.id)
                                rect1.selected= true
                            }
                        }
                    }
                    Connections {
                        target: invController
                        function onRowClicked(message) {
                            if (model.id !== message) {
                                rect1.selected = false
                            }
                            if(parseInt(model.id) === parseInt(message)) {
                                rect1.selected = true
                            }
                        }
                    }
                }
            }
        }
    }
}
