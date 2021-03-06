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
    title: qsTr("Email Creator")
    width: 750
    height: 500
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2
    color: "#06111c"

    property var settingsDialog: SettingsDialog {
        onSettingsDialogClosed: { visible = false }
    }

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
            color: "transparent"

            Rectangle {
                id: windowControls
                width: parent.width
                height: 30
                color: "transparent"
                /*
                  * Window controls section
                */
                WindowControls {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 20
                    anchors.topMargin: -5

                    onSettingsButtonClicked: {
                        settingsDialog.visible = true;
                    }
                }
            }

            Rectangle {
                id: userDetails
                width: parent.width
                anchors.top: windowControls.bottom
                height: 140
                color: "transparent"

                EmailData {
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                }

            }

            Rectangle {
                id: recoveryEmail
                width: parent.width
                anchors.top: userDetails.bottom
                height: 100
                color: "transparent"

                RecoveryEmail {
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                }
            }

            Rectangle {
                id: securityQuestions
                width: parent.width
                anchors.top: recoveryEmail.bottom
                height: 115
                color: "transparent"

                SecurityQuestions{
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                }
            }

            Rectangle {
                id: submitArea
                width: parent.width
                anchors.top: securityQuestions.bottom
                height: 110
                color: "transparent"

                Rectangle {
                    id:  registerButtonID
                    width: registerButtonTextID.implicitWidth + 80
                    height: registerButtonTextID.implicitHeight + 25
                    anchors.centerIn: parent

                    color: "#8dc63f"
                    radius: 3
                    clip: true

                    Text {
                        id: registerButtonTextID
                        text: "Register Acount(s)"
                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -20
                        font.family: "Calibri"
                        font.pixelSize: 17
                        font.letterSpacing: 0.5
                        font.weight: Font.DemiBold
                        color: "white"
                    }

                    Image {
                        id: settingsImageID
                        source: "qrc:/images/create-icon.png"
                        anchors.left: registerButtonTextID.right
                        anchors.leftMargin: 5
                        anchors.verticalCenter: registerButtonTextID.verticalCenter
                        anchors.verticalCenterOffset: -4
                        opacity: 1
                        width: 31
                        height: width
                        fillMode: Image.PreserveAspectFit

                    }

                    MouseArea {
                        id: registerButtonMouseArea
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        acceptedButtons: Qt.LeftButton
                        onPressed: {
                            if(containsPress){
                                print("'Register Account(s)' button pressed!")

                                parent.focus = true
                                registerButtonID.color = "#73a333";

                            }


                        }
                        onReleased: {
                            if(containsMouse){
                                registerButtonID.color = "#b1e868";
                            } else {
                                registerButtonID.color = "#8dc63f";
                            }

                        }
                        onHoveredChanged: {
                            if(containsMouse){
                                print("Mouse hovered into 'Register Account(s)' button area ...");
                                registerButtonID.color = "#b1e868";

                            } else {
                                print("Mouse hovered out of 'Register Account(s)' button area ...");
                                registerButtonID.color = "#8dc63f";
                            }


                        }
                    }

                }
            }
        }
    }
}
