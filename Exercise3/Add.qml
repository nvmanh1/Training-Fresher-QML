
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import custom.model 1.0

Item {
    id: addBox
    width: 690
    height: 690
    property string aName: "mon"
    property int aAge: 25
    property int aRole: -1
    property string aRoleColor: " "
    signal exitSelected()
    function getRoleColor(valRole)
    {
        if(valRole === 0)
        {
            aRoleColor = "yellow"
        }
        else if(valRole === 1){
            aRoleColor = "blue"
        }
        else if(valRole === 2){
            aRoleColor = "red"
        }
        else if(valRole === 3){
            aRoleColor = "green"
        }
    }

 Rectangle{
     id: recAdd
     y: 1
     x: 1
     width: 690
     height: 690
     color: "#55557f"
     anchors.left: parent.left
     anchors.leftMargin: 5
     MyMemModel {
         id: mymodel
     }
     Text{
         id: ageId
         x: 36
         y: 70
         width: 69
         height: 46
         font.pointSize: 14
         text: qsTr("Name:")

     }
     Text {
         id: nameId
         x: 36
         y: 170
         width: 69
         height: 46
         text: qsTr("Age:")
         font.pointSize: 14
     }
     TextInput{
         id: inputName
         x: 110
         y: 67
         width: 294
         height: 37
         color: "black"
         cursorVisible: true
         font.pixelSize: 25
         focus: true
         text: ""
         onAccepted: {
             aName = inputName.text.toString()
         }
      }

     TextInput{
         id: inputAge
         x: 110
         y: 167
         width: 268
         height: 34
         color: "black"
         cursorVisible: true
         font.pixelSize: 25
         focus: true
         text: ""
         onTextEdited: {
             aAge = inputAge.text
         }
     }
     RoleBox{
         width: 150
         height: 34
         anchors.left: inputAge.left
         anchors.top: inputAge.bottom
         anchors.topMargin: 100
         onSelected: {
             aRole = idx;
             getRoleColor(aRole)
         }

     }

   }
 Row{
     spacing: 5
     anchors.bottom: recAdd.bottom
     anchors.bottomMargin: 10
     anchors.left: recAdd.left
     anchors.leftMargin:  290
     Rectangle{
         id: rectangle
         width: 50
         height: 30
         color: "darkseagreen"
         Text{
             anchors.centerIn: parent.Center
             text:"Save"
             anchors.left: parent.left
             anchors.top: parent.top
             color: "black"
             font.pixelSize: 12
             anchors.topMargin: 5
             anchors.leftMargin: 5
         }
         MouseArea{
             anchors.fill: parent
             onClicked: {
                  mymodel.addMember(aName, aAge, aRoleColor)
               //  console.log(aName, aAge, role)
                 mymodel.saveListModelToFile("datalist.json")
             }
         }
     }
     Rectangle{
         id: rectangle1
         width: 50
         height: 30
         color: "darkseagreen"
         Text{
             anchors.centerIn: parent.Center
             text:"Exit"
             anchors.left: parent.left
             anchors.top: parent.top
             color: "black"
             font.pixelSize: 12
             anchors.topMargin: 5
             anchors.leftMargin: 5
         }
         MouseArea{
             anchors.fill: parent    
             onClicked: {
               exitSelected()
             }

         }
    }
 }
}
