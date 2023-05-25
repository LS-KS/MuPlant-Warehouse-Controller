import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material


Rectangle {
        id: window
        radius: 10
        color : "white"

        border.color: "#546E7A"
        border.width: 2

        property bool expanded : true
        property int ex_height : 125
        width: 400
        height: 140

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
                    seperator02.visible = seperator02.visible ? false : true
                    abbArmConfig.visible = abbArmConfig.visible ? false : true
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
            text: "ABB Robot Arm"
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

        ABBRobotArmConfig{
            id: abbArmConfig
            anchors.top : seperator01.bottom
            anchors.left: parent.left
            anchors.margins: 10
            Behavior on visible { PropertyAnimation{ duration: 50; easing.type: Easing.OutCubic}}
        }

        Rectangle {
            id: seperator02
            visible: true
            width : window.width - 10
            height: 1
            color: "#546E7A"
            anchors.top : abbArmConfig.bottom
            anchors.left: window.left
            anchors.margins : 5

            Behavior on visible { PropertyAnimation{ duration: 50; easing.type: Easing.OutCubic} }
        }
}
