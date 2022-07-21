import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle{
        id: memList
        anchors.top: parent.top
        anchors.topMargin: 70
        anchors.left: parent.left
        anchors.leftMargin: 21
        width: 300
        height: 400
        border.color: "black"
        MemberList{
            id: disList
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
        }
    }
    MenuBar{
        id: menu
      //  width: 640
        Menu {
            id: file
            title: "File"
            MenuItem{
                text: "Add New Member"
                shortcut: "Ctrl+A"
                onTriggered: {
                    load.source = "Add.qml"
                }
            }
            MenuItem{
                text: "Quit"
                shortcut: "Ctrl+Q"
                onTriggered: {
                    Qt.quit()
                }
            }
        }
        Menu {
            id: help
            title: "Help"
            MenuItem{
                onTriggered: {
                    ///
                }
            }
        }

    }
    Loader{
        id: load
    }

}
