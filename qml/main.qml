import QtQml 2.2
import QtQuick 2.0
import QtQuick.Window 2.3 as Window
import QtWayland.Compositor 1.3
import QtQml.Models 2.1

WaylandCompositor {
    id: comp
    property bool right_screen: false

    Screen {
        id: left
        surfaceArea.color: "lightsteelblue"
        text: Qt.application.screens[0].name
        compositor: comp
        screen: Qt.application.screens[0] 
    }

    Screen {
        id: right
        surfaceArea.color: "red"
        text: Qt.application.screens[1].name
        compositor: comp
        screen: Qt.application.screens[1]
        Component.onCompleted: comp.defaultOutput = this
    }


    Component {
        id: chromeComponent
        Chrome {}
    }

    Component {
        id: moveItemComponent
        Item {}
    }

    Item {
        id: rootItem
    }

    WlShell {
        onWlShellSurfaceCreated: handleShellSurfaceCreated(shellSurface)
    }

    XdgShellV6 {
        onToplevelCreated: handleShellSurfaceCreated(xdgSurface)
    }

    XdgShell {
        onToplevelCreated: handleShellSurfaceCreated(xdgSurface)
    }

    function createShellSurfaceItem(shellSurface, output) {
        var item = chromeComponent.createObject(output.surfaceArea, {
            "shellSurface": shellSurface
        });
        item.setPrimary();
    }

    function handleShellSurfaceCreated(shellSurface) {  
        // First application is shown on left screen
        // Second application is show on right screen
        // Then start with left screen again
        if (right_screen) {
            createShellSurfaceItem(shellSurface, right);
            right_screen = false;
        }
        else {
            createShellSurfaceItem(shellSurface, left);
            right_screen = true;
        }
    }
}
