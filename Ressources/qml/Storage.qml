import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Rectangle{
    id: storageRect

    color: "white"
    border.color: "#546E7A"
    border.width: 2
    radius: 10
    // TableView holds objects of StorageData.db which is read in InventoryModel
    TableView {
        model: inventoryModel
        anchors.fill: parent
        anchors.margins: 10
        columnSpacing: 10
        rowSpacing: 5
        clip: true
        delegate: SmallProductSlot{
            cupA: model.a_CupID
            prodA: model.a_ProductID
            nameA: model.a_Name
            cupB: model.b_CupID
            prodB: model.b_ProductID
            nameB: model.b_Name
            implicitHeight: 220
            implicitWidth: 200
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
}
