import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3

Window {
    id: settingsDialogRootID
    flags: Qt.Window | Qt.FramelessWindowHint
    width: 500
    height: 350
    signal settingsDialogClosed()
    visible: false
    title: qsTr("Settings")
//    x: (Screen.width - width) / 2
//    y: (Screen.height - height) / 2
    color: "#06111c"

}
