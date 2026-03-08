import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import qs.utils

Item {
    id: musicWidget
    property string songText: ""

    function getCurrentlyPlayingMprisPlayer() {
        var players = Mpris.players.values;
        var activePlayer = players[0];

        for (var i = 0; i < players.length; i++) {
            if (players[i].isPlaying) {
                activePlayer = players[i];
                break;
            }
        }

        return activePlayer;
    }

    // Function to update song
    function updateSong() {
        var currentlyPlayingPlayer = getCurrentlyPlayingMprisPlayer();

        if (currentlyPlayingPlayer) {
            songText = currentlyPlayingPlayer.trackArtist + " - " + currentlyPlayingPlayer.trackTitle;
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
        color: Constants.panelTextColor
        anchors.centerIn: parent
    }

    // Initialize immediately
    Component.onCompleted: updateSong()
}
