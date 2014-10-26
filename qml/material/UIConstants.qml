pragma Singleton
import QtQuick 2.0

QtObject {

    readonly property string sansFontFamily: "Roboto"
    readonly property string serifFontFamily: "Roboto Slab"

    readonly property real captionFontSize: 12
    readonly property real bodyFontSize: 14
    readonly property real subheadFontSize: 16
    readonly property real titleFontSize: 20
    readonly property real headlineFontSize: 24
    readonly property real display1FontSize: 34
    readonly property real display2FontSize: 45
    readonly property real display3FontSize: 56
    readonly property real display4FontSize: 112

    readonly property color displayTextColor: "#8a000000"
    readonly property color bodyTextColor: "#de000000"

    readonly property real largeMargin: 16 * dp
    readonly property real smallMargin: 8 * dp

}
