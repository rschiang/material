import QtQuick 2.0
import "."

Item {
    id: item
    implicitWidth: parent.width
    height: 16 * dp

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 8 * dp
        }
        height: 1 * dp
        color: "#1a000000"
    }
}
