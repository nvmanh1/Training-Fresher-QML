import QtQuick 2.4
import QtQuick.Controls 2.12

Item {
    signal selected(var idx)
    property int roleIdx: -1
        width: 140
        height: 50
        ComboBox {
            id:box
            anchors.fill: parent
            width: 140
            height: 50
            currentIndex: roleIdx
            model: ListModel {

                 ListElement {text: "Team Leader" }
                 ListElement {text: "Deverloper" }
                 ListElement {text: "BA" }
                 ListElement {text: "Tester" }
             }
            onActivated: {
                selected(currentIndex);
            }
        }

}
