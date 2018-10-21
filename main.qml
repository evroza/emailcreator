import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtWinExtras 1.0

import Qt.labs.platform 1.0

ApplicationWindow {
    id: backlight
    flags: Qt.Window | Qt.FramelessWindowHint
    visible: true
    title: qsTr("backlight")
    width: 500
    height: 500
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2
    color: "transparent"

    property real slideValue
    signal onSlide(real value)

    TaskbarButton {
        overlay {
            iconSource: "qrc:/images/Icon.png"
            accessibleDescription: "Loading"
        }


        progress.visible: true
        progress.value: 50
    }

    SystemTrayIcon {
        visible: true
        iconSource: "qrc:/images/Icon.png"

        onActivated: {
            backlight.show()
            backlight.raise()
            backlight.requestActivate()
        }
    }


    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: 500
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 3
            opacity: 0.9
            color: "#06111c"
        }


    }
}
