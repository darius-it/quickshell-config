import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Niri
import qs.utils
import qs.services

Scope {
    id: root

    Niri {
        id: niri
        Component.onCompleted: connect()

        onConnected: console.log("Connected to niri")
        onErrorOccurred: function (error) {
            console.error("Error:", error);
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors.top: true
            anchors.left: true
            anchors.right: true

            implicitHeight: 30

            color: Constants.panelBackground

            // Row layout for clean positioning of bar elements
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                WorkspacesWidget {}

                Item {
                    Layout.fillWidth: true
                } // fill space between

                MusicWidget {
                    Layout.alignment: Qt.AlignmentCenter
                }

                Item {
                    Layout.fillWidth: true
                } // fill space between

                RowLayout {
                    WifiWidget {}

                    ClockWidget {
                        Layout.alignment: Qt.AlignmentRight
                    }
                }
            }
        }
    }
}
