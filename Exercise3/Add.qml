
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Item {
    id: addBox
    width: 640
    height: 480
    property string name: " "
    property string age: " "
    property int role: -1
    property string roleColor: " "
    function getRoleColor(valRole)
    {
        if(valRole === 0)
        {
            roleColor = "yellow"
        }
        else if(valRole === 1){
            roleColor = "blue"
        }
        else if(valRole === 2){
            roleColor = "red"
        }
        else if(valRole === 3){
            roleColor = "green"
        }
    }

 Rectangle{
     id: recAdd
     y: 1
     x: 1
     width: 630
     height: 470
     color: "#55557f"
     anchors.left: parent.left
     anchors.leftMargin: 5
     Text{
         id: age
         x: 36
         y: 70
         width: 69
         height: 46
         font.pointSize: 14
         text: qsTr("Name:")

     }
     Text {
         id: name
         x: 36
         y: 170
         width: 69
         height: 46
         text: qsTr("Age:")
         font.pointSize: 14
     }
     ComboBox {
         id:box
         x: 36
         y: 270
         width: 140
         height: 50
         model: ListModel {

              ListElement {text: "Team Leader" }
              ListElement {text: "Deverloper" }
              ListElement {text: "BA" }
              ListElement {text: "Tester" }
          }
         onActivated: {
         //    getRoleColor(currentIndex)
         }
     }
     TextInput{
         id: inputAge
         x: 137
         y: 70
         width: 268
         height: 34
         anchors.centerIn: parent.Center
         color: "black"
         cursorVisible: true
         font.pixelSize: 25
         focus: true
         text: " "
         onEditingFinished: {
             age = inputAge.text
         }
     }
         TextInput{
             id: inputName
             x: 137
             y: 170
             width: 294
             height: 37
             anchors.left: age.right
             anchors.leftMargin: 5
             anchors.bottom: age.bottom
             color: "black"
             cursorVisible: true
             font.pixelSize: 25
             focus: true
             text: " "
             onEditingFinished: {
                 name = inputName.text
             }
     }
   }
 Row{
     spacing: 5
     anchors.bottom: recAdd.bottom
     anchors.horizontalCenter: parent.horizontalCenter
     Rectangle{
         id: rectangle
         width: 40
         height: 25
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
             anchors.topMargin: 76
             anchors.rightMargin: -135
             anchors.bottomMargin: -216
             onClicked: {
                 ///
             }
         }
     }
     Rectangle{
         id: rectangle1
         width: 40
         height: 25
         color: "darkseagreen"
         Text{
             anchors.centerIn: parent.Center
             text:"Exit"
             anchors.left: parent.left
             anchors.top: parent.top
             color: "black"
             font.pixelSize: 15
             anchors.topMargin: 5
             anchors.leftMargin: 5
         }
         MouseArea{
             anchors.fill: parent
             anchors.leftMargin: 108
             anchors.topMargin: 256
             anchors.rightMargin: -119
             anchors.bottomMargin: -256
             onClicked: {
                 ///
             }
         }
    }
 }
}
