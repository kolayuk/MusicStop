import QtQuick 1.0

Rectangle {
    id: btn
    width: 132//110
    height: 42//35
    signal btnClicked;
    color:"transparent"
    property bool checked: false
    property string text:"txt"
    Image {
        id: im
        anchors.fill: parent
        source: m.pressed?(btn.checked?"Orange_Button_Pressed.svg":"Grey_Button_Pressed.svg"):(btn.checked?"Orange_Button.svg":"Grey_Button.svg")
    }
    Text {
        id: txt
        text: parent.text
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20;
        color: parent.checked?"white":"black"
    }
    MouseArea{
        id:m
        anchors.fill: parent
        onClicked: { btnClicked();}
    }
}
