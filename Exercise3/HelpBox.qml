import QtQuick 2.0

Rectangle {
    id: frame

    Rectangle{
        id: textArea
        width: 500
        height: 430
        color: "darkseagreen"
        border.color: "black"
        Text {
            id: helpText
            text: qsTr("text")
        }

    }
    Rectangle{
        anchors.top: textArea.bottom
        anchors.topMargin: 5
        anchors.verticalCenter: textArea.verticalCenter
        color:"grey"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                frame.visible = false
            }
        }
    }
}
