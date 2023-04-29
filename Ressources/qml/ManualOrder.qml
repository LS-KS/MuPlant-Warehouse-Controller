import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {
    width: parent.width
    height: parent.height

    TabBar {
        id: tabBar
        width: parent.width

        TabButton {
            text: "Basic"
            onClicked: stackLayout.currentIndex = 0
        }

        TabButton {
            text: "Palette"
            onClicked: stackLayout.currentIndex = 1
        }

        TabButton {
            text: "Cup"
            onClicked: stackLayout.currentIndex = 2
        }
    }

    StackLayout {
        id: stackLayout
        anchors.top: tabBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        width: parent.width
        height: parent.height
        Item {
            id: basicItem
            width: parent.width
            height: parent.height
            Rectangle {
                width: parent.width
                height: parent.height
                RowLayout{
                    id: row1
                    height: 40
                    anchors.top: tabBar.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: operationLabel
                        height: 30
                        width: row1.width / 2
                        text: qsTr("Operation: ")
                        minimumPixelSize: 6
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: operationComboBox
                        height: 30
                        anchors.right: parent.right
                        anchors.left: operationLabel.right
                    }
                }

                RowLayout{
                    id: row2
                    height: 40
                    anchors.top: row1.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: requestLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Request Type: ")
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: requestComboBox
                        height: 30
                        anchors.right: parent.right
                        anchors.left: requestLabel.right
                    }
                }

                RowLayout{
                    id: row3
                    height: 40
                    anchors.top: row2.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Cup ID: ")
                        font.italic: true
                        layer.sourceRect.width: parent.width/2
                    }
                    TextField{
                        id: cupField
                        height: 30
                        width: parent.width / 2
                        anchors.right: parent.right
                        anchors.left: cupLabel.right
                        text: "0"
                        horizontalAlignment: Text.AlignHRight
                        validator: IntValidator {bottom: 0; top: 100000}
                    }
                }

                RowLayout{
                    id: row4
                    height: 40
                    width: parent.width / 2
                    anchors.top: row3.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: productLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Product ID: ")
                        font.italic: true
                        layer.sourceRect.width: parent.width/2
                    }
                    TextField{
                        id: productField
                        height: 30
                        anchors.right: parent.right
                        anchors.left: productLabel.right
                        text: "0"
                        horizontalAlignment: Text.AlignHRight
                        validator: IntValidator {bottom: 0; top: 100000}
                    }
                }

                RowLayout{
                    id: row5
                    height: 40
                    anchors.top: row4.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: storageLabel
                        height: 30
                        width: parent.width /3 -10
                        text: qsTr("Storage Position (optional): ")
                        font.italic: true
                        fontSizeMode: Text.HorizontalFit
                        anchors.left: parent.left

                    }
                    ComboBox{
                        id: storageCol
                        height: 30
                        width: parent.width /3 -10
                        anchors.left: storageLabel.right
                        anchors.margins: 5
                        displayText: "column"
                    }
                    ComboBox{
                        id: storageRow
                        height: 30
                        width: parent.width /3 -10
                        anchors.left: storageCol.right
                        anchors.right: parent.right
                        anchors.margins: 5
                        displayText: "row"
                    }
                }

                RowLayout{
                    id: row6
                    height: 40
                    anchors.top: row5.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text {
                        id: cupPositionLabel
                        height: 30
                        width: row1.width / 2
                        text: qsTr("Cup Position (optional): ")
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: cupPositionComboBox
                        height: 30
                        anchors.right: parent.right
                        anchors.left: cupPositionLabel.right
                    }
                }

                RowLayout{
                    id: row7
                    height: 40
                    anchors.top: row6.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: noteLabel
                        height: 30
                        text: qsTr("Note: Cup ID or Product ID must be set.")
                        fontSizeMode: Text.HorizontalFit

                    }
                    Button {
                        id: sendButton
                        text: "send"
                        enabled: false
                        anchors.right: parent.right
                    }
                }
            }
        }

        Item {
            id: paletteItem
            Rectangle {
                color: "green"
                width: parent.width
                height: parent.height
            }
        }

        Item {
            id: cupItem
            Rectangle {
                color: "yellow"
                width: parent.width
                height: parent.height
            }
        }
    }


}


