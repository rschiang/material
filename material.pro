TEMPLATE = app

TARGET = Material

QT += qml quick network svg

SOURCES += src/main.cpp

RESOURCES += qml/assets.qrc

OTHER_FILES += qml/*.qml \
    qml/material/*.qml

mac {
    QMAKE_MAC_SDK = macosx10.9
}
