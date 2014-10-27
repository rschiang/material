import QtQuick 2.0

Item {
    id: button
    width: 24 * dp
    height: 24 * dp

    property alias rippleColor: ripple.color
    property alias iconSource: icon.source

    signal clicked

    PaperRipple {
        id: ripple
        anchors {
            fill: undefined
            centerIn: parent
        }
        width: 40 * dp
        height: 40 * dp
        radius: 20 * dp
        mouseArea: mouseArea
    }

    Image {
        id: icon
        anchors.centerIn: parent
        width: 24 * dp
        height: 24 * dp
        sourceSize.width: width
        sourceSize.height: height
        opacity: button.enabled ? 1 : 0.62

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: ripple
        enabled: button.enabled
        onClicked: button.clicked()
    }
}
