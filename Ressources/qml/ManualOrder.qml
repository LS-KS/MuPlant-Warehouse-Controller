import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {
    width: parent.width
    height: 330

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
                    anchors.top: parent.top
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

                    }
                    ComboBox{
                        id: storageCol
                        height: 30
                        width: parent.width /3 -10
                        displayText: "column"
                    }
                    ComboBox{
                        id: storageRow
                        height: 30
                        width: parent.width /3 -10
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
                    }
                }
            }
        }

        Item {
            id: paletteItem
            width: parent.width
            height: parent.height
            Rectangle {
                width: parent.width
                height: parent.height
                RowLayout{
                    id: paletteRow1
                    height: 40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteOperationLabel
                        height: 30
                        width: paletteRow1.width / 2
                        text: qsTr("Operation: ")
                        minimumPixelSize: 6
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: paletteOperationComboBox
                        height: 30
                    }
                }

                RowLayout{
                    id: paletteRow2
                    height: 40
                    anchors.top: paletteRow1.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteRequestLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Request Type: ")
                        layer.sourceRect.width: parent.width / 2
                    }

                }

                RowLayout{
                    id: paletteRow3
                    height: 40
                    anchors.top: paletteRow2.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteCupLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Cup ID: ")
                        font.italic: true
                        layer.sourceRect.width: parent.width/2
                    }

                }

                RowLayout{
                    id: paletteRow4
                    height: 40
                    width: parent.width / 2
                    anchors.top: paletteRow3.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteProductLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Product ID: ")
                        font.italic: true
                        layer.sourceRect.width: parent.width/2
                    }

                }

                RowLayout{
                    id: paletteRow5
                    height: 40
                    anchors.top: paletteRow4.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteStorageLabel
                        height: 30
                        width: parent.width /3 -10
                        text: qsTr("Storage Position (optional): ")
                        font.italic: true
                        fontSizeMode: Text.HorizontalFit
                    }
                    ComboBox{
                        id: paletteStorageCol
                        height: 30
                        width: parent.width /3 -10
                        displayText: "column"
                    }
                    ComboBox{
                        id: paletteStorageRow
                        height: 30
                        width: parent.width /3 -10
                        displayText: "row"
                    }
                }

                RowLayout{
                    id: paletteRow6
                    height: 40
                    anchors.top: paletteRow5.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text {
                        id: paletteCupPositionLabel
                        height: 30
                        width: row1.width / 2
                        text: qsTr("Cup Position (optional): ")
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: paletteCupPositionComboBox
                        height: 30
                    }
                }

                RowLayout{
                    id: paletteRow7
                    height: 40
                    anchors.top: paletteRow6.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteNoteLabel
                        height: 30
                        text: qsTr("")
                        fontSizeMode: Text.HorizontalFit

                    }
                    Button {
                        id: paletteSendButton
                        text: "send"
                        enabled: false
                    }
                }
            }
        }

        Item {
            id: cupItem
            width: parent.width
            height: parent.height
            Rectangle {
                width: parent.width
                height: parent.height
                RowLayout{
                    id: cupRow1
                    height: 40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupOperationLabel
                        height: 30
                        width: paletteRow1.width / 2
                        text: qsTr("Operation: ")
                        minimumPixelSize: 6
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: cupOperationComboBox
                        height: 30
                    }
                }

                RowLayout{
                    id: cupRow2
                    height: 40
                    anchors.top: cupRow1.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupRequestLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Request Type: ")
                        layer.sourceRect.width: parent.width / 2
                    }

                }

                RowLayout{
                    id: cupRow3
                    height: 40
                    anchors.top: cupRow2.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupCupLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Cup ID: ")
                        font.italic: true
                        layer.sourceRect.width: parent.width/2
                    }

                }

                RowLayout{
                    id: cupRow4
                    height: 40
                    width: parent.width / 2
                    anchors.top: cupRow3.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupProductLabel
                        height: 30
                        width: parent.width / 2
                        text: qsTr("Product ID: ")
                        font.italic: true
                        layer.sourceRect.width: parent.width/2
                    }

                }

                RowLayout{
                    id: cupRow5
                    height: 40
                    anchors.top: cupRow4.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupStorageLabel
                        height: 30
                        width: parent.width /3 -10
                        text: qsTr("Storage Position (optional): ")
                        font.italic: true
                        fontSizeMode: Text.HorizontalFit

                    }
                    ComboBox{
                        id: cupStorageCol
                        height: 30
                        width: parent.width /3 -10
                        displayText: "column"
                    }
                    ComboBox{
                        id: cupStorageRow
                        height: 30
                        width: parent.width /3 -10
                        displayText: "row"
                    }
                }

                RowLayout{
                    id: cupRow6
                    height: 40
                    anchors.top: cupRow5.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text {
                        id: cupCupPositionLabel
                        height: 30
                        width: row1.width / 2
                        text: qsTr("Cup Position (optional): ")
                        layer.sourceRect.width: parent.width / 2
                    }
                    ComboBox{
                        id: cupCupPositionComboBox
                        height: 30
                    }
                }

                RowLayout{
                    id: cupRow7
                    height: 40
                    anchors.top: cupRow6.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupNoteLabel
                        height: 30
                        text: qsTr("")
                        fontSizeMode: Text.HorizontalFit

                    }
                    Button {
                        id: cupSendButton
                        text: "send"
                        enabled: false
                    }
                }
            }
        }
    }


}


