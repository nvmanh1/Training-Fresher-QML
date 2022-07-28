import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import custom.model 1.0

Item {
    width: 700
    height: 700
    property int listIdx: -1
    function getIdxRole(roleInfo)
    {
        if(roleInfo == '#ffff00')
            return 0;
        else if(roleInfo == '#0000ff')
            return 1;
        else if(roleInfo == '#ff0000')
            return 2;
        else if(roleInfo == '#008000')
            return 3;
        return 4;
    }
    Rectangle{
        id: memList
        anchors.top: parent.top
        anchors.topMargin: 51
        anchors.left: parent.left
        anchors.leftMargin: 21
        width: 346
        height: 479
        border.color: "black"
        MyMemModel {
            id: mymodel
        }

        ListView{
            id: list
            x: 0
            y: 8
            width: 338
            height: 463
            model: mymodel
            spacing: 3
            clip: true
            currentIndex: -1
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
                    id: nameList
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: recColor.right
                    anchors.leftMargin: 10
                    font.pixelSize: 15
                    color: "black"
                    text: name
                }
                Text {
                    id: ageList
                    anchors.top: name.top
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    font.pixelSize: 15
                    text: age
                }
                MouseArea{
                    anchors.fill: parent
                    id: memMouse
                    onClicked: {
                      info.nameInfo = nameList.text
                      info.ageInfo = ageList.text
                      info.idxRole = getIdxRole(recColor.color)
                      list.currentIndex = index;
                      listIdx = list.currentIndex;
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
                    mymodel.addMember(valName, valAge, valColor);
                    console.log("color: ", valColor, "age: ", valAge)
                     mymodel.saveListModelToFile()
                }
            }
        }
    }

    Infor{
        id: info
        width: 300
        height: 300
        anchors.top: memList.top
        anchors.left: memList.right
        anchors.leftMargin: 10
        onSelectDeleted: {
            mymodel.remove(listIdx)
            mymodel.saveListModelToFile()
        }
        onSelectUpdated: {

           mymodel.upDateData(listIdx, info.nameInfo, "yellow", 0)
           console.log("nameinf: ", info.nameInfo)


        }

    }


}
