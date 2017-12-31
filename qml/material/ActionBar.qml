import QtQuick 2.0
import "."

Item {
    id: control
    width: parent.width
    height: 56 * dp

    property alias color: background.color
    property alias text: title.text
    property bool raised: false

    MouseArea {
        id: eventEater
        anchors.fill: parent
    }

    PaperShadow {
        source: background
        depth: control.raised ? 2 : 1
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
    }

    Text {
        id: title
        x: 72 * dp
        anchors.verticalCenter: parent.verticalCenter
        font.family: UIConstants.sansFontFamily
        font.weight: Font.DemiBold
        font.pointSize: UIConstants.titleFontSize
        color: "white"
    }
}
