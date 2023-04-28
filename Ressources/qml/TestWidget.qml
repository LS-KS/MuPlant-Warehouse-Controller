import QtQuick 2.15

Rectangle {
    id: testRect
    width: 200
    height: 100
    color: "#8c8282"

    Text {
        id: text1
        x: 20
        y: 20
        width: 157
        height: 52
        color: "#c32929"
        text: qsTr("Ich bin ein TestWidget")
        font.pixelSize: 12
        rightPadding: 15
        leftPadding: 15
        bottomPadding: 15
        topPadding: 15
        styleColor: "#5b2222"
        textFormat: Text.PlainText
        font.weight: Font.DemiBold
        font.family: "Times New Roman"
    }
}
