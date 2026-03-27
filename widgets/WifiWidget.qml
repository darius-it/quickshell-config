import Quickshell
import QtQuick
import QtQuick.Controls as QQC2
import qs.services
import qs.utils

Item {
    id: root

    implicitWidth: wifiIcon.width
    implicitHeight: wifiRow.height

    function positionTooltip() {
        const tooltipPopup = QQC2.ToolTip.toolTip

        if (!tooltipPopup)
            return

        const popupWidth = tooltipPopup.implicitWidth > 0 ? tooltipPopup.implicitWidth : tooltipPopup.width
        const popupHeight = tooltipPopup.implicitHeight > 0 ? tooltipPopup.implicitHeight : tooltipPopup.height
        const globalPoint = root.mapToGlobal((root.width - popupWidth) / 2, root.height + 12)

        tooltipPopup.width = Math.ceil(popupWidth)
        tooltipPopup.height = Math.ceil(popupHeight + 4)

        tooltipPopup.x = Math.round(globalPoint.x)
        tooltipPopup.y = Math.round(globalPoint.y)
    }

    function getWifiIcon(connected) {
        if (connected) {
            return Qt.resolvedUrl("../icons/wifi.svg")
        }

        return Qt.resolvedUrl("../icons/wifi-off.svg")
    }

    Row {
        id: wifiRow
        anchors.centerIn: parent
        spacing: 0

        Image {
            id: wifiIcon
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            source: getWifiIcon(Network.networkState.startsWith("connected"))
        }
    }

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }

    QQC2.ToolTip.visible: hoverArea.containsMouse
    QQC2.ToolTip.delay: 100
    QQC2.ToolTip.timeout: -1
    QQC2.ToolTip.text: Network.connectedSSID
                      ? (Network.networkState + " to " + Network.connectedSSID)
                      : Network.networkState

    onWidthChanged: positionTooltip()
    onHeightChanged: positionTooltip()

    Connections {
        target: QQC2.ToolTip.toolTip

        function onVisibleChanged() {
            if (QQC2.ToolTip.toolTip && QQC2.ToolTip.toolTip.visible)
                root.positionTooltip()
        }
    }
}
