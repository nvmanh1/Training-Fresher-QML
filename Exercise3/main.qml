import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import custom.model 1.0
Window {
    width: 700
    height: 700
    visible: true
    title: qsTr("Hello World")
    property string valName: "nv manh"
    property string valColor: "red"
    property int valAge: 19
    MyMemModel {
        id: mymodel
    }
    MenuBar{
        id: menu
        Menu {
            id: file
            title: "File"
            MenuItem{
                text: "Add New Member"
                shortcut: "Ctrl+A"
                onTriggered: {
                    load.sourceComponent = add
                }
            }
            MenuItem{
                text: "Quit"
                shortcut: "Ctrl+Q"
                onTriggered: {
                     Qt.callLater(Qt.quit)
                }
            }
        }
        Menu {
            id: help
            title: "Help"
            MenuItem{
                text: "Information"
                onTriggered: {
                    load.sourceComponent = helpBox
                }
            }
        }

    }
    Component{
        id: mainView
        MainView{
            anchors.fill: parent
            width: 700
            height: 700
        }
    }
    Component{
        id: add
        Add{
            id: addMem
            width: 690
            height: 690
            anchors.fill: parent
            onExitSelected: {
                load.sourceComponent = mainView
            }
        }
    }
    Component{
        id: helpBox
        HelpBox{
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: 5
            width: 690
            height: 690
            onQuitSelected: {
                load.sourceComponent = mainView
            }
        }
    }

    Loader{
        id: load
    }
    Component.onCompleted: {
        load.sourceComponent = mainView

    }

}
