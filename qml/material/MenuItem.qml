import QtQuick 2.0
import "."

Item {
    id: item
    implicitWidth: parent.width
    height: 48 * dp

    property bool inline: false
    property alias text: label.text
    property alias textColor: label.color

    signal clicked

    Text {
        id: label
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: 16 * dp
        }
        font.family: UIConstants.sansFontFamily
        font.pointSize: UIConstants.bodyFontSize
        font.weight: Font.DemiBold
        color: item.enabled ? UIConstants.bodyTextColor : UIConstants.displayTextColor
        opacity: item.enabled ? 1 : 0.62

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    PaperRipple {
        id: ripple
        mouseArea: mouseArea
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: item.enabled
        onClicked: item.clicked()
    }
}
