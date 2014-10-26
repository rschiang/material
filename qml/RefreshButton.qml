import QtQuick 2.0
import "material"

IconButton {
    id: button
    iconSource: "qrc:/assets/icon_refresh"

    property bool loading: false

    SequentialAnimation {
        running: button.loading
        loops: Animation.Infinite

        NumberAnimation { target: refreshButton; property: "rotation"; from: 360; to: 180; duration: 200; easing.type: Easing.OutQuad }
        NumberAnimation { target: refreshButton; property: "rotation"; from: 180; to: 0; duration: 200; easing.type: Easing.InQuad }

        onStopped: button.rotation = 0
    }
}
