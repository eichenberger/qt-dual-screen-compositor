import QtQuick 2.8
import QtWayland.Compositor 1.0
import QtQuick.Window 2.3

WaylandOutput {
    id: screen
    property variant viewsBySurface: ({})
    property alias surfaceArea: background
    property alias text: t.text
    property alias screen: win.screen
    sizeFollowsWindow: true

    property bool windowed: false

    window: Window {
        id: win
        x: Screen.virtualX
        y: Screen.virtualY
        visibility: Window.FullScreen
        visible: true

        WaylandMouseTracker {
            id: mouseTracker
            anchors.fill: parent
            windowSystemCursorEnabled: false

            Rectangle {
                anchors.fill: parent
                id: background

                Text {
                    id: t
                    anchors.centerIn: parent
                    font.pointSize: 72
                }
            }

            WaylandCursorItem {
                inputEventsEnabled: false
                x: mouseTracker.mouseX
                y: mouseTracker.mouseY
                seat: comp.defaultSeat
                visible: mouseTracker.containsMouse
            }
        }
        Shortcut {
            sequence: "Ctrl+Alt+Backspace"
            onActivated: Qt.quit()
        }
    }
}
