import QtQuick 1.0
import com.nokia.symbian 1.1

Page{
    signal back;
    anchors.fill: parent
        Rectangle{
        color: "#e7e7e9"
        width: parent.width
        anchors.top: statusBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
    Flickable {
        id: flickArea
        anchors.fill: parent
        //anchors.top: statusBar.bottom;
        //anchors.bottom: toolBar.top;
        //anchors.left: parent.left;
        //anchors.right: parent.right
        contentWidth: parent.width; contentHeight: c.height
        flickableDirection: Flickable.VerticalFlick
        clip: true
        Column{
            id:c
            spacing: 10;
            anchors.top: parent.top;
            anchors.topMargin: 50
            //anchors.bottom: parent.bottom//toolBar.top;
            anchors.left: parent.left;
            anchors.right: parent.right
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                id: logo
                source: "logo.png"
            }
            Text{
                text:"MusicStop v.1.0";
                color:"black"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                anchors.left: parent.left;
                anchors.right: parent.right
                font.pixelSize: 35;
                wrapMode: Text.WordWrap
            }

            Text{
                text:strings[0];
                color:"black"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                anchors.left: parent.left;
                anchors.right: parent.right
                font.pixelSize: 20;
                wrapMode: Text.WordWrap

            }
        }
        }
    StatusBar {
        id: statusBar
        y:0
        x:0
    }
    Image {
        id: toolBar
        source: "toolbar.svg"
        height: 60
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Row{
    id:btns
    anchors.left: toolBar.left;
    anchors.right: toolBar.right
    spacing: toolBar.width-(3*(backbtn.width+33))
    anchors.horizontalCenter: toolBar.horizontalCenter
    anchors.verticalCenter: toolBar.verticalCenter
    ToolButton {
        flat: true
        id:backbtn;
        iconSource: "back.svg"
        onClicked: {back();}
    }
    ToolButton {
        flat: true
        iconSource: "ovi.png"
        onClicked: {Qt.openUrlExternally("http://store.ovi.com/publisher/Alexander+Fokin/");}
    }
    ToolButton {
        flat: true
        id:aboutbtn;
        iconSource: ""
        onClicked: {}
    }
    }
    }

