import QtQuick 1.0
import com.nokia.symbian 1.1

Page{
    anchors.fill: parent;
    signal about;
    Connections{
    target:application
    onUpdateUi: {
    time.hours=h;
    time.minutes=m;
    console.log("UI update "+h+" "+m);
    }
    }

    Rectangle{
    id:bg
    color:"#f1f1f3"
    anchors.top: statusBar.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: tb.bottom
    MyButton {
        id: btn
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.topMargin: 18;
        text: checked?strings[5]:strings[4]
        onBtnClicked: {
            if ((time.hours!=0||time.minutes!=0)||(btn.checked)) {btn.checked=!btn.checked;}
            if (checked) {
                application.Start(time.hours,time.minutes,s1.on,s2.on,s3.on);
            }
            else application.Stop();
        }
    }
    Rectangle{
        color: "#e7e7e9"
        y:grad.y+3
        x:0
        height:tb.y-grad.y-3;
        //anchors.top: grad.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.bottom: parent.bottom
    }
    Column{
        anchors.fill: bg
        spacing: 10;
        anchors.horizontalCenter: bg.horizontalCenter
        Text{
            id: logo
            height: 60
            anchors.top: parent.top
            anchors.topMargin: 20;
            anchors.left: parent.left
            anchors.leftMargin: 20
            verticalAlignment: Text.AlignTop
            font.pixelSize: 30
            text:"MusicStop"
            }
        TimePicker{
            y:15
            id:time;
            anchors.horizontalCenter: parent.horizontalCenter
        }
            Rectangle{
            id:grad
                width: parent.width
                anchors.left: parent.left
                anchors.right: parent.right
                height: 10
                gradient: Gradient{
                    GradientStop { position: 0.0; color: "#aaaaaa" }
                    GradientStop { position: 1.0; color: "#e7e7e9" }
                }
            }
            Row{
            spacing: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 10
            MySwitch{id:s1; anchors.verticalCenter: parent.verticalCenter; on:true; state:"on" }
            Text {
                height: s1.height
                text: strings[1]
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
            }
            }
            Row{
            spacing: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            MySwitch{id:s2; anchors.verticalCenter: parent.verticalCenter }
            Text {
                height: s1.height
                text: strings[2]
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
            }
            }
            Row{
            spacing: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 10
            MySwitch{id:s3; anchors.verticalCenter: parent.verticalCenter }
            Text {
                height: s1.height
                text: strings[3]
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
            }
            }
    }

    }

    StatusBar {
        id: statusBar
        y:0
        x:0
    }
    Image {
        id: tb
        source: "toolbar.svg"
        height: 60
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Row{
    id:btns
    anchors.left: tb.left;
    anchors.right: tb.right
    spacing: tb.width-(3*(backbtn.width+33))
    anchors.horizontalCenter: tb.horizontalCenter
    anchors.verticalCenter: tb.verticalCenter
    ToolButton {
        flat: true
        id:backbtn;
        iconSource: "back.svg"
        onClicked: {
        if (btn.checked) application.Hide()
        else Qt.quit();
        }
    }
    ToolButton {
        flat: true
        iconSource: "ovi.png"
        onClicked: {Qt.openUrlExternally("http://store.ovi.com/publisher/Alexander+Fokin/");}
    }
    ToolButton {
        flat: true
        id:aboutbtn;
        iconSource: "menu.png"
        onClicked: {about();}
    }
    }
}
