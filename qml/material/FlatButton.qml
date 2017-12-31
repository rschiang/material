import QtQuick 2.0
import "."

Item {
    id: button
    width: (inline || label.paintedWidth > 56 * dp) ? (label.paintedWidth + 32 * dp) : (88 * dp)
    height: 36 * dp

    property bool inline: false
    property alias text: label.text
    property alias textColor: label.color

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 3 * dp
        color: button.enabled ? "#00999999" : "#1a999999"
    }

    Text {
        id: label
        anchors.centerIn: parent
        font.family: UIConstants.sansFontFamily
        font.pointSize: UIConstants.bodyFontSize
        font.weight: Font.DemiBold
        font.capitalization: Font.AllUppercase
        color: button.enabled ? UIConstants.bodyTextColor : UIConstants.displayTextColor
        opacity: button.enabled ? 1 : 0.62

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    PaperRipple {
        id: ripple
        radius: 3 * dp
        mouseArea: mouseArea
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: button.enabled
        onClicked: button.clicked()
    }
}
