import QtQuick 2.0

Item {
    id: help
    width: 700
    height: 700
    signal quitSelected()
    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    Rectangle{
        id: rec
        width: 690
        height: 690
        clip: true
        border.color: "darkseagreen"
        Flickable{
            id: flick
            anchors.fill: parent
            contentWidth: 685
            contentHeight: rec.height*2
            clip: true

        Text {
            anchors.fill: parent
            id: helpText
            font.pixelSize: 15
            color:"black"
            text: openFile("qrc:///help.txt")
        }
        }
        Rectangle{
            color: "grey"
            width: 40
            height: 25
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent.Center
                font.pixelSize: 15
                text: qsTr("Quit")
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    quitSelected()
                }
            }
        }
    }
}
