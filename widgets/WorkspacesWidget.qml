import QtQuick

Row {
    id: row
    spacing: 8

    Repeater {
        id: rep
        model: niri.workspaces

        Item {
            implicitWidth: (model.isActive) ? 25 : 10
            implicitHeight: 10
            visible: model.output == screen.name

            Rectangle {
                anchors.fill: parent
                radius: 5
                color: "#ffffff"
                opacity: model.isActive ? 1.0 : 0.5
                scale: model.isActive ? 1.25 : 1.0

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: niri.focusWorkspaceById(model.id)
                }

                Behavior on scale {
                    PropertyAnimation {
                        duration: 150
                        easing.type: Easing.InOutQuad
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: 150
                    }
                }
            }
        }
    }
}
