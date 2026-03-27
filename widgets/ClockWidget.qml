import QtQuick
import Quickshell
import Quickshell.Io
import qs.utils

Item {
    id: clockWidget
    property string time: "00:00"

    TextMetrics {
        id: metrics
        text: "00:00"
    }

    implicitWidth: metrics.width
    implicitHeight: 16

    Text {
        id: clockText
        text: clockWidget.time
        font.pixelSize: 14
        color: Constants.textColor
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 1
    }

    Process {
        id: dateProc
        command: ["date", "+%H:%M"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: clockWidget.time = this.text.trim()
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
