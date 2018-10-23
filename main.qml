import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtWinExtras 1.0
import QtQuick.Layouts 1.3

import Qt.labs.platform 1.0

ApplicationWindow {
    id: emailCreator
    flags: Qt.Window | Qt.FramelessWindowHint
    visible: true
    title: qsTr("EmailCreator")
    width: 700
    height: 500
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2
    color: "#06111c"

    TaskbarButton {
        overlay {
            iconSource: "qrc:/images/icon.png"
            accessibleDescription: "Loading"
        }


        progress.visible: true
        progress.value: 50
    }


    GridLayout {
        id: mainGridID
        width: parent.width - 10
        height: parent.height - 10
        anchors.centerIn: parent
        columns: 2
        rows: 1
        columnSpacing: 5
        flow: GridLayout.LeftToRight
        Rectangle {
            Layout.fillWidth: true
            Layout.minimumWidth: 200
            Layout.maximumWidth: 250
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.row: 1
            Layout.column: 1
            clip: true
            color: "transparent"

            Rectangle {
                id: mainIcon
                width: parent.width
                height: 120
                color: "transparent"
                Image {
                    id: mainLogoID
                    source: "qrc:/images/icon.png"
                    width: 150
                    height: 100
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: accountType
                anchors.top: mainIcon.bottom
                width: parent.width
                height: 150
                color: "transparent"

                AccountTypeList {
                    x: 8
                }
            }

            Rectangle {
                id: apiKeys
                anchors.top: accountType.bottom
                width: parent.width
                height: 217
                color: "transparent"

                TextLabelInput {
                    id: anticaptchaKeyID
                    labelTextID.text: "AntiCaptcha API Key:"
                    x: 8
                    y: 20
                }

                TextLabelInput {
                    id: deathbycaptchaKeyID
                    x: 8
                    anchors.topMargin: 6
                    labelTextID.text: "DeathbyCaptcha API Key:"
                    anchors.top: anticaptchaKeyID.bottom
                }
            }


        }
        Rectangle {
            id: masterDataRectID
            Layout.minimumWidth: 150
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.row: 1
            Layout.column: 2
            color: "red"

            Rectangle {
                id: windowControls
                width: parent.width
                height: 30
                color: "purple"
            }

            Rectangle {
                id: userDetails
                width: parent.width
                anchors.top: windowControls.bottom
                height: 130
                color: "orange"
            }

            Rectangle {
                id: recoveryEmail
                width: parent.width
                anchors.top: userDetails.bottom
                height: 100
                color: "turquoise"
            }

            Rectangle {
                id: securityQuestions
                width: parent.width
                anchors.top: recoveryEmail.bottom
                height: 115
                color: "#37a6ed"
            }
        }
    }
}
