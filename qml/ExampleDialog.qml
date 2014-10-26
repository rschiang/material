import QtQuick 2.0
import QtPositioning 5.2
import "material"

Dialog {
    id: dialog

    TextEdit {
        id: field
        width: parent.width
        height: Math.min(Math.max(field.implicitHeight, 168 * dp), root.height - 132 * dp)
        textMargin: 24 * dp
        wrapMode: Text.Wrap

        color: "#de000000"
        selectionColor: "#a1887f"
        selectedTextColor: color
        font.family: UIConstants.sansFontFamily
        font.pointSize: UIConstants.subheadFontSize

        Text {
            id: placeholder
            anchors {
                fill: parent
                margins: field.textMargin
            }
            visible: !field.length && !field.inputMethodComposing
            color: "#8a999999"
            font: field.font
            text: "What's on your mind?"
        }

        Behavior on height {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    Item {
        width: parent.width
        height: 52 * dp

        Item {
            id: actions
            anchors {
                fill: parent
                leftMargin: 16 * dp
                rightMargin: 16 * dp
            }

            IconButton {
                id: cameraButton
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                iconSource: "qrc:/assets/icon_camera"
            }

            FlatButton {
                id: sendButton
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    right: parent.right
                    rightMargin: -16 * dp
                }
                text: "Send"
                textColor: "#795548"
                enabled: (field.length >= 0)
                onClicked: dialog.close()
            }
        }
    }

    onOpening: {
        field.focus = true
    }

    onClosing: {
        field.focus = false
        field.text = ""
    }

    onBackgroundClicked: {
        dialog.close()
    }
}
