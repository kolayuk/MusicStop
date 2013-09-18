import QtQuick 1.0

Item {
    id: timePicker

    width: 300
    height: 300

    property int hours: 0
    property int minutes: 0

    property alias backgroundImage: bg.source
    property alias hourDotImage: hourDot.source
    property alias minutesDotImage: minuteDot.source

    onHoursChanged: {
        if (hours == 12)
            hours = 0
    }

    onMinutesChanged: {
        if (minutes == 60)
            minutes = 0
    }

    Image {
        id: bg
        anchors.fill: parent
        source: "images/clock.png"

        property int centerX: 150
        property int centerY: 150

        property int minuteRadius: 114
        property int hourRadius: 49

        property int minuteGradDelta: 6
        property int hourGradDelta: 30

        property int diameter: 55

        Image {
            id: hourDot
            source: "images/hour.png"

            x: (bg.centerX - bg.diameter / 2) + bg.hourRadius * Math.cos(timePicker.hours * bg.hourGradDelta * (3.14 / 180) - (90 * (3.14 / 180)))
            y: (bg.centerY - bg.diameter / 2) + bg.hourRadius * Math.sin(timePicker.hours * bg.hourGradDelta * (3.14 / 180) - (90 * (3.14 / 180)))

            width: bg.diameter
            height: bg.diameter

            Text {
                font.pixelSize: 30
                anchors.centerIn: parent

                text: (timePicker.hours < 10 ? "0" : "") + timePicker.hours
            }
        }

        Image {
            id: minuteDot
            source: "images/minute.png"
            x: (bg.centerX - bg.diameter / 2) + bg.minuteRadius * Math.cos(timePicker.minutes * bg.minuteGradDelta * (3.14 / 180) - (90 * (3.14 / 180)))
            y: (bg.centerY - bg.diameter / 2) + bg.minuteRadius * Math.sin(timePicker.minutes * bg.minuteGradDelta * (3.14 / 180) - (90 * (3.14 / 180)))
            width: bg.diameter
            height: bg.diameter

            Text {
                font.pixelSize: 30
                anchors.centerIn: parent
                color: "#CCCCCC"
                text: (timePicker.minutes < 10 ? "0" : "") + timePicker.minutes
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        property int currentHandler : -1 // 0 - hours, 1 - minutes
        property real previousAlpha: -1

        onPressed: {
            currentHandler = chooseHandler(mouseX, mouseY)
            previousAlpha = findAlpha(mouseX, mouseY)
        }

        onReleased: {
            currentHandler = -1
            previousAlpha = -1
        }

        onPositionChanged: {
            var newAlpha = 0;
            if (currentHandler < 0)
                return

            newAlpha = findAlpha(mouseX, mouseY)

            if (currentHandler > 0) {
                timePicker.minutes = getNewTime(timePicker.minutes, newAlpha, bg.minuteGradDelta, 1)
            }
            else
                timePicker.hours = getNewTime(timePicker.hours, newAlpha, bg.hourGradDelta, 1)
        }

        function sign(number) {
            return  number >= 0 ? 1 : -1;
        }

        function getNewTime(source, alpha, resolution, boundFactor) {
            var delta = alpha - previousAlpha



            if (Math.abs(delta) < resolution)
                return source

            if (Math.abs(delta) > 180) {
                delta = delta - sign(delta) * 360
            }

            var result = source * resolution

            var resdel = Math.round(result + delta)
            if (Math.round(result + delta) > 359 * boundFactor)
                result += delta - 360 * (source * resolution > 359 ? boundFactor : 1)
            else if (Math.round(result + delta) < 0 * boundFactor)
                result += delta + 360 * (source * resolution > 359 ? boundFactor : boundFactor)
            else
                result += delta

            previousAlpha = alpha
            return result / resolution
        }

        function findAlpha(x, y) {

            var alpha = (Math.atan((y - bg.centerY)/(x - bg.centerX)) * 180) / 3.14 + 90
            if (x < bg.centerX)
                alpha += 180

            return alpha
        }

        function chooseHandler(mouseX, mouseY) {
            if (bg.hourRadius + bg.diameter / 2 > Math.sqrt(Math.pow(bg.centerX - mouseX, 2) + Math.pow(bg.centerY - mouseY, 2)))
                return 0
            else if (bg.minuteRadius + bg.diameter / 2 > Math.sqrt(Math.pow(bg.centerX - mouseX, 2) + Math.pow(bg.centerY - mouseY, 2)))
                return 1
            return -1
        }

    }
}
