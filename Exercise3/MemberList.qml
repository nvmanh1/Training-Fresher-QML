import QtQuick 2.0

Item {

    ListModel{
        id: memModel
        ListElement{
            roleColor: "red"
            memName: "nguyen van manh"
            memAge: "18"
        }
    }
    Component{
        id: recList
        Rectangle{
            border.color: "black"
            width: 250
            height: 30
            Rectangle{
                id: recColor
                width: 30
                height: 30
                color: roleColor
            }
            Text {
                id: name
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: recColor.right
                anchors.leftMargin: 10
                font.pixelSize: 15
                color: "black"
                text: memName
            }
            Text {
                id: age
                anchors.top: name.top
                anchors.right: parent.right
                anchors.rightMargin: 5
                font.pixelSize: name.font.pixelSize
                text: memAge
            }
            MouseArea{
                id: memMouse
                onClicked: {

                }
            }
        }
    }
    ListView{
        id: list
        model: memModel
        delegate: recList
    }
}

