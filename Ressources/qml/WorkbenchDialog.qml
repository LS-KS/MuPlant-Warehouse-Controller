import QtQuick 2.15
import QtQuick.Dialogs
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.3

Dialog {
    id: editDialog
    title: "Override Workbench"
    property string source: ""
    ColumnLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true

        Row{
            Text {
                id: slotText
                width: parent.width/2
                text: qsTr("Product a or b: ")
                Layout.fillHeight: true
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter

            }
            ComboBox{
                id: setAB
                model: ["a","b"]
                Layout.fillHeight: true
                Layout.fillWidth: true
                onCurrentValueChanged: {
                    inventoryController.loadStorage(source, setAB.currentValue)
                }

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
                validator: IntValidator{
                    bottom: 0
                    top: 9999
                }
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
                    setProduct.currentIndex = 0
                    setCup.text = "0"
                }
            }

        }
    }

    standardButtons: Dialog.Ok | Dialog.Cancel
    onAccepted: {

        inventoryController.changeStorage(source, setAB.currentText, setCup.text, setProduct.currentText)
    }
    onRejected: console.log("Cancel clicked")

    Connections{
        target: inventoryController
        function onTransmitData(slot, cup, product){
            setCup.text = cup
            setProduct.editText = product
        }
    }
    onOpened: {
        function setValues(){
            console.log("function called")
            if (name === "Workbench"){
                console.log("recognized Workbench ")
                if(setAB ==='a'){
                    console.log("recognized a ")
                    setCup = workBench.cupA
                    setProduct = workBench.prodA
                } else {
                    console.log("recognized b ")
                    setCup = workBench.cupB
                    setProduct = workBench.prodB
                }
            }
            if (name === "Mobile Robot"){
                if(setAB ==='a'){
                    setCup.text = mobileRobot.cupA
                    setProduct.editText = mobileRobot.prodA
                } else {
                    setCup.text = mobileRobot.cupB
                    setProduct.editText = mobileRobot.prodB
                }

            }
        }
    }
}
