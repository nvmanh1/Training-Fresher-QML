import QtQuick 2.0
import org.example 1.0

Item {
    clip: true
    property string valname: "mua hahaha";
    property string valcolor: "red"
    property int valAge: 13

    MyMemModel {
        id: mymodel
    }

    ListView{
        id: list
        width: 300
        height: 600
        model: mymodel
        spacing: 5
        clip: true
        delegate: Rectangle{
            width: 250
            height: 30
            Rectangle{
                id: recColor
                width: 30
                height: 30
                color: mcolor
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: recColor.right
                anchors.leftMargin: 10
                font.pixelSize: 15
                color: "black"
                text: name
            }
            Text {
                anchors.top: name.top
                anchors.right: parent.right
                anchors.rightMargin: 5
                font.pixelSize: 15
                text: age
            }
            MouseArea{
                id: memMouse
                onClicked: {

                }
            }
        }
    }
    Rectangle{
        id: rectangle
        x: 143
        y: 34
        width: 45
        height: 37
        color: "darkseagreen"
        Text{
            anchors.left: parent.left
            color: "black"
            text: "button"
            font.pixelSize: 12
            anchors.topMargin: 5
            anchors.leftMargin: 5
        }
        MouseArea{
            anchors.fill: parent

            onClicked: {
                mymodel.addMember(valname, valAge, valcolor);
                console.log("dmm")
            }
        }
    }
}



