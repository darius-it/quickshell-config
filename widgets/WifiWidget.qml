import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.services
import qs.utils

Item {
    TextMetrics {
        id: metrics
        text: "WIFI YEETUS"
    }

    implicitWidth: metrics.width

    Text {
        text: Network.networkState
        color: Constants.textColor
        anchors.centerIn: parent
    }
}
