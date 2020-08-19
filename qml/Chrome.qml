import QtQuick 2.0
import QtWayland.Compositor 1.0

Item {
    id: chrome
    property alias shellSurface: surfaceItem.shellSurface
    property alias surfaceItem: surfaceItem

    ShellSurfaceItem {
        id: surfaceItem
        autoCreatePopupItems: true
        onSurfaceDestroyed: chrome.destroy();
    }
}
