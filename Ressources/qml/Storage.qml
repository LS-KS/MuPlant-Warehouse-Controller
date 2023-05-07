import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Rectangle{

    color: "white"
    border.color: "#546E7A"
    border.width: 2
    radius: 10


    TableView {
        model: inventoryModel
        anchors.centerIn: parent
        anchors.fill: parent
        anchors.margins: 10
        boundsBehavior: Flickable.StopAtBounds
        columnSpacing: 10
        rowSpacing: 5
        clip: true
        delegate: ProductSlot{
                cupA: model.a_CupID
                prodA: model.a_ProductID
                nameA: model.a_Name
                cupB: model.b_cupID
                prodB: model.b_ProdID
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
