import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material
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
                    layer.enabled: false
                    layoutDirection: Qt.LeftToRight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: operationLabel
                        height: 30
                        width: row1.width / 2
                        text: qsTr("Operation: ")
                        minimumPixelSize: 6
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter

                    }
                    ComboBox{
                        id: operationComboBox
                        font.family: "Arial"
                        Layout.preferredWidth: 2* parent.width/3
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox{
                        id: requestComboBox
                        font.family: "Arial"
                        Layout.preferredWidth: 2* parent.width/3
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField{
                        id: cupField
                        width: parent.width / 2
                        text: "0"
                        horizontalAlignment: Text.AlignHRight
                        font.family: "Arial"
                        validator: IntValidator {bottom: 0; top: 100000}
                        Layout.preferredWidth: 2* parent.width/3
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField{
                        id: productField
                        text: "0"
                        horizontalAlignment: Text.AlignHRight
                        font.family: "Arial"
                        validator: IntValidator {bottom: 0; top: 100000}
                        Layout.preferredWidth: 2* parent.width/3
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter

                    }
                    ComboBox{
                        id: storageCol
                        font.family: "Arial"
                        displayText: "column"
                        Layout.preferredWidth: parent.width/4
                        Layout.preferredHeight: parent.height
                    }
                    ComboBox{
                        id: storageRow
                        font.family: "Arial"
                        displayText: "row"
                        Layout.preferredWidth: parent.width/4
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox{
                        id: cupPositionComboBox
                        font.family: "Arial"
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height                    }
                }

                RowLayout{
                    id: row7
                    height: 40
                    anchors.top: row6.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: noteLabel
                        text: qsTr("Note: Cup ID or Product ID must be set.")
                        fontSizeMode: Text.HorizontalFit
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter

                    }
                    Button {
                        id: sendButton
                        text: "send"
                        font.family: "Arial"
                        enabled: false
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
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
                        text: qsTr("Operation: ")
                        minimumPixelSize: 6
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter                    }
                    ComboBox{
                        id: paletteOperationComboBox
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
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
                        width: parent.width / 2
                        text: qsTr("Request Type: ")
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
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
                        width: parent.width / 2
                        text: qsTr("Cup ID: ")
                        font.italic: true
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter                    }

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
                        text: qsTr("Product ID: ")
                        font.italic: true
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter                    }

                }

                RowLayout{
                    id: paletteRow5
                    height: 40
                    anchors.top: paletteRow4.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: paletteStorageLabel
                        text: qsTr("Storage Position (optional): ")
                        font.italic: true
                        fontSizeMode: Text.HorizontalFit
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox{
                        id: paletteStorageCol
                        Layout.preferredWidth: parent.width/4
                        Layout.preferredHeight: parent.height
                        displayText: "column"
                    }
                    ComboBox{
                        id: paletteStorageRow
                        Layout.preferredWidth: parent.width/4
                        Layout.preferredHeight: parent.height
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
                        text: qsTr("Cup Position (optional): ")
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox{
                        id: paletteCupPositionComboBox
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
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
                        text: qsTr("")
                        fontSizeMode: Text.HorizontalFit
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter

                    }
                    Button {
                        id: paletteSendButton
                        text: "send"
                        enabled: false
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Operation: ")
                        minimumPixelSize: 6
                    }
                    ComboBox{
                        id: cupOperationComboBox
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height                    }
                }

                RowLayout{
                    id: cupRow2
                    height: 40
                    anchors.top: cupRow1.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text {
                        id: cupRequestLabel
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Request Type: ")
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
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Cup ID: ")
                        font.italic: true
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
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Product ID: ")
                        font.italic: true
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
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Storage Position (optional): ")
                        font.italic: true
                        fontSizeMode: Text.HorizontalFit

                    }
                    ComboBox{
                        id: cupStorageCol
                        Layout.preferredWidth: parent.width/4
                        Layout.preferredHeight: parent.height
                        displayText: "column"
                    }
                    ComboBox{
                        id: cupStorageRow
                        Layout.preferredWidth: parent.width/4
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Cup Position (optional): ")
                    }
                    ComboBox{
                        id: cupCupPositionComboBox
                        Layout.preferredWidth: parent.width/2
                        Layout.preferredHeight: parent.height
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
                        Layout.preferredWidth: 2*parent.width/3
                        Layout.preferredHeight: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("")
                        fontSizeMode: Text.HorizontalFit

                    }
                    Button {
                        id: cupSendButton
                        text: "send"
                        enabled: false
                        Layout.preferredWidth: parent.width/3
                        Layout.preferredHeight: parent.height
                    }
                }
            }
        }
    }


}


