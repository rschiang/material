TEMPLATE = app

TARGET = Material

QT += qml quick network svg positioning

SOURCES += src/main.cpp

RESOURCES += qml/assets.qrc

OTHER_FILES += qml/*.qml \
    qml/material/*.qml

macx {
    QMAKE_MAC_SDK = macosx10.9
} android {
    QT += androidextras
}
