import QtQuick 2.15

Rectangle{
    property alias text: displayText.text
    height: 50
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    border.color: "black"
    radius: 20
    Text {
        id: displayText
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.margins: 10
        horizontalAlignment: Text.AlignRight
        text: ""
        font.pixelSize: 24
    }
}


