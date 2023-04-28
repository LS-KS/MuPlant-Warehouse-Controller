import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {
    width: parent.width
    height: parent.height
    color: "blue"

    StackLayout {
        id: stackLayout
        anchors.fill: parent

        Item {
            id: basicItem
            Rectangle {
                color: "red"
                width: parent.width
                height: parent.height
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
}


