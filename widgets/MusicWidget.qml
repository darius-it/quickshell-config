import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import qs.utils

Item {
    id: musicWidget
    property string songText: ""

    function getFirstMprisPlayer() {
        var firstPlayer = Mpris.players.values[0];
        return firstPlayer;
    }

    // Function to update song
    function updateSong() {
        var firstPlayer = getFirstMprisPlayer();

        if (firstPlayer) {
            songText = firstPlayer.trackArtist + " - " + firstPlayer.trackTitle;
        } else {
            songText = "";
        }
    }

    // Poll every 2 seconds
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateSong()
    }

    // TextMetrics for sizing
    TextMetrics {
        id: metrics
        text: songText
    }

    implicitWidth: metrics.width

    // Actual display
    Text {
        id: musicText
        text: songText
        font.pixelSize: 12
        color: panelTextColor
        anchors.centerIn: parent
    }

    // Initialize immediately
    Component.onCompleted: updateSong()
}
