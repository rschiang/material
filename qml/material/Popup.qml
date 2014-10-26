import QtQuick 2.0

Item {
    id: popup
    anchors {
        fill: parent
        margins: -1
    }
    state: "hidden"
    visible: false

    property bool dim: true
    property bool active: (state == "visible")

    signal opening
    signal closing
    signal backgroundClicked

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: (popup.state == "visible")
        onClicked: {
            // Eats the event, and up to desendants to decide whether to close the dialog
            mouse.accepted = true
            backgroundClicked()
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: popup.dim ? "#55000000" : "transparent"
        opacity: 0
    }

    states: [
        State {
            name: "visible"
            PropertyChanges { target: background; opacity: 1 }
        },
        State {
            name: "hidden"
            PropertyChanges { target: background; opacity: 0 }
        }
    ]

    transitions: [
        Transition {
            from: "hidden"; to: "visible"
            SequentialAnimation {
                PropertyAction { target: popup; property: "visible"; value: true }
                NumberAnimation {
                    target: background
                    property: "opacity"
                    duration: 200
                    easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
                }
            }
        },
        Transition {
            from: "visible"; to: "hidden"
            SequentialAnimation {
                NumberAnimation {
                    target: background
                    property: "opacity"
                    duration: 200
                    easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
                }
                PropertyAction { target: popup; property: "visible"; value: false }
            }
        }
    ]

    function open() {
        if (state == "hidden") {
            state = "visible"
            opening()
        }
    }

    function close() {
        if (state == "visible") {
            state = "hidden"
            closing()
        }
    }
}
