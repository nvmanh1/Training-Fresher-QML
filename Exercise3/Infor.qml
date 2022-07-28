import QtQuick 2.12
import custom.model 1.0
Item {
    width: 300
    height: 300
    property string nameInfo:""
    property int ageInfo: 0
    property int idxRole: -1
    property string roleInfo: ""
    signal selectDeleted()
    signal selectUpdated()


    Rectangle{
        width: 300
        height: 300
        color: "#55aaff"
        border.color: "black"
        Text {
            id: nameMem
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.pixelSize: 15
            color: "black"
            focus: true
            text: "Name: " + nameInfo
            onEditingFinished:{
                nameInfo = nameMem.text
            }
        }
        TextEdit{
            id: ageMem
            anchors.top: nameMem.bottom
            anchors.topMargin: 30
            anchors.left: nameMem.left
            font.pixelSize: 15
            color: "black"
            focus: true
            text: "Age: " + ageInfo
            onEditingFinished:{
                ageInfo = ageMem.text
            }
        }
        Text{
            id: roleMem
            anchors.top: ageMem.bottom
            anchors.topMargin: 30
            anchors.left: nameMem.left
            font.pixelSize: 15
            color: "black"
            text: "Role: "
        }
        RoleBox{
            width: 140
            height: 50
            anchors.left: roleMem.right
            anchors.leftMargin: 25
            anchors.verticalCenter: roleMem.verticalCenter
            roleIdx: idxRole;

        }

        Row{
            spacing:20
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10
            Rectangle{
                id: upBut
                color:"grey"
                width: 50
                height: 25
                Text {
                    font.pixelSize: 13
                    color: "black"
                    anchors.centerIn: parent.Center
                    text: qsTr("UPDATE")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        selectUpdated()
                    }
                }
            }

            Rectangle{
                id: deBut
                color:"grey"
                width: 50
                height: 25
                Text {
                    font.pixelSize: 13
                    color: "black"
                    anchors.centerIn: parent.Center
                    text: qsTr("DELETE")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                       selectDeleted()
                    }
                }
            }
        }
    }

}
