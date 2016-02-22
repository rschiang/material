import QtQuick 2.0
import "."

Item {
    id: control
    implicitWidth: input.contentWidth
    implicitHeight: Math.max(input.contentHeight + 32 * dp, 48 * dp)

    property color focusColor: "#2196f3"

    property alias text: input.text
    property alias hint: placeholder.text
    property alias length: input.length
    property alias maxLength: input.maximumLength

    property alias echoMode: input.echoMode
    property alias color: input.color
    property alias font: input.font

    Text {
        id: placeholder
        anchors.fill: input
        visible: !input.length && !input.inputMethodComposing
        color: "#8a999999"
        font: input.font
    }

    TextInput {
        id: input
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: divider.top
            topMargin: 16 * dp
        }
        color: "#de000000"
        selectionColor: "#91a7ff"
        selectedTextColor: color
        font.family: UIConstants.sansFontFamily
        font.pointSize: UIConstants.subheadFontSize
    }

    Rectangle {
        id: divider
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 8 * dp
        }
        height: input.focus ? 2 * dp : 1 * dp
        color: input.focus ? control.focusColor : "#38999999"

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }
}
