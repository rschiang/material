import QtQuick 2.0

Item {
    id: card

    property bool raised: false
    property alias mouseArea: mouseArea

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
        radius: 2
        visible: false
    }

    PaperShadow {
        id: shadow
        source: background
        depth: card.enabled ? (card.raised ? 2 : 1) : 0
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: card.enabled
        onClicked: card.clicked()
    }
}
