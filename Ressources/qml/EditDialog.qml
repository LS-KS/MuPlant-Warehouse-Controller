import QtQuick 2.15
import QtQuick.Dialogs
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.3

Dialog {
    id: editDialog
    title: "Override Storage"
    ColumnLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true

        Row{
            Text {
                id: location
                text: qsTr("Location: ")
                width: parent.width/2
                height: setLocation.height
                Layout.fillHeight: true
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter
            }
            ComboBox{
                id: setLocation
                model: ['L1', 'L2', 'L3', 'L4', 'L5', 'L6', 'L7', 'L8', 'L9', 'L10', 'L11', 'L12', 'L13', 'L14', 'L15', 'L16', 'L17', 'L18']
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Row{
            Text {
                id: product
                width: parent.width/2
                text: qsTr("Product a or b: ")
                Layout.fillHeight: true
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter

            }
            ComboBox{
                model: ["a","b"]
                Layout.fillHeight: true
                Layout.fillWidth: true

            }
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Row{
            Text {
                id: cupText
                width: parent.width/2
                text: qsTr("Set Cup ID: ")
                verticalAlignment: Text.AlignVCenter
            }
            TextField{
                id: setCup

            }
        }
        Row{
            Text {
                id: setProd
                width: parent.width/2
                text: qsTr("Set Product ID:")
                Layout.fillHeight: true
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter
            }
            ComboBox{
                id:setProduct
                model: productListModel
                textRole: 'id'
                Layout.fillHeight: true
                Layout.fillWidth: true

            }

        }
        DialogButtonBox{

            Button {
                id: clearButton
                text: "Clear"
                onClicked: {
                    console.log("Clear Clicked")
                    setProduct.currentIndex = 0
                    setCup.text = "0"
                }
            }

        }
    }

    standardButtons: Dialog.Ok | Dialog.Cancel
    onAccepted: console.log("Ok clicked")
    onRejected: console.log("Cancel clicked")


}
