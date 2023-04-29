import QtQuick 2.9
import QtQuick.Controls 2.5


Rectangle {
        id: window
        radius: 10
        color : "white"

        border.color: "#546E7A"
        border.width: 2

        property bool expanded : true
        property int ex_height : parent.height / 2
        width: 400
        height: 460


        Image {
            id: arrow
            source: "../assets/angle-small-up.png"
            height: 15
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 5
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    arrow.source = window.expanded ? "../assets/angle-small-down.png" : "../assets/angle-small-up.png"
                    window.expanded = window.expanded ? false : true
                    window.height = window.expanded? window.ex_height : 25
                    seperator01.visible = seperator01.visible ? false: true
                    modBusConfig.visible = modBusConfig.visible ? false : true
                    seperator02.visible = seperator02.visible ? false : true
                    manOrder.visible = manOrder.visible ? false : true
                }
            }
        }

        Text {
            id: title
            height: 15
            anchors.left: arrow. right
            anchors.top : parent.top
            anchors.right: parent.right
            anchors.margins : 5
            text: "Manual handling"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: seperator01
            visible: true
            width : window.width - 10
            height: 1
            color: "#546E7A"
            anchors.top : arrow.bottom
            anchors.left: window.left
            anchors.margins : 5

            Behavior on visible { PropertyAnimation{} }
        }

        ModBusConfig{
            id: modBusConfig
            anchors.top : seperator01.bottom
            anchors.left: parent.left
            anchors.margins: 5
            Behavior on visible { PropertyAnimation{ duration: 50; easing.type: Easing.OutCubic}}
        }

        Rectangle {
            id: seperator02
            visible: true
            width : window.width - 10
            height: 1
            color: "#546E7A"
            anchors.top : modBusConfig.bottom
            anchors.left: window.left
            anchors.margins : 5

            Behavior on visible { PropertyAnimation{ duration: 50; easing.type: Easing.OutCubic} }
        }

        ManualOrder{
            id: manOrder
            width : window.width - 1
            anchors.top: seperator02.bottom
            anchors.left: window.left
            anchors.right: window.right
            anchors.bottom: parent.bottom
            anchors.margins: 5
            Behavior on visible { PropertyAnimation{ duration: 50; easing.type: Easing.OutCubic} }
        }

}
