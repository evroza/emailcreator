import QtQuick 2.9
import QtQuick.Window 2.3

Item {

    property int singleControlWidth: 25

    width: minimizeButtonID.width + maximizeButtonID.width + closeButtonID.width

    Rectangle {
        id: settingsButtonID
        width: singleControlWidth
        height: width - 2
        clip: true
        color: "transparent"
        x: -5

        Image {
            id: settingsImageID
            source: "qrc:/images/settings.png"
            anchors.centerIn: parent
            opacity: 1
            width: 17
            height: width
            fillMode: Image.PreserveAspectFit

        }

        MouseArea {
            id: settingsMouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            onPressed: {
                if(containsPress){
                    print("Settings button pressed!")

                    parent.focus = true
                    settingsButtonID.color = "white";
                }


            }
            onReleased: {
                if(containsMouse){
                    settingsButtonID.color = "#6f5d82";
                    settingsImageID.source = "qrc:/images/settings-hover.png";
                } else {
                    settingsButtonID.color = "transparent";
                    settingsImageID.source = "qrc:/images/settings.png";
                }
            }
            onHoveredChanged: {
                if(containsMouse){
                    print("Mouse hovered into 'Settings' button area ...");
                    settingsButtonID.color = "#6f5d82";
                    settingsImageID.source = "qrc:/images/settings-hover.png";
                } else {
                    print("Mouse hovered out of 'Settings' button area ...");
                    settingsButtonID.color = "transparent";
                    settingsImageID.source = "qrc:/images/settings.png";
                }


            }
        }

    }


    Rectangle {
        id: minimizeButtonID
        width: singleControlWidth
        height: width - 5
        clip: true
        color: "#f5f5f5"
        anchors.left: settingsButtonID.right
        anchors.leftMargin: 5

        Image {
            id: minimizeImageID
            source: "qrc:/images/minimize.png"
            anchors.centerIn: parent
            opacity: 1
            width: 10
            height: width
            fillMode: Image.PreserveAspectFit

        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onPressed: {
                if(containsMouse){
                    print("Minimize button clicked!");
                    parent.focus = true;
                    minimizeButtonID.color = "#bebaba";
                }

            }

            onReleased: {
                if(containsMouse){
                    Window.window.visibility = Window.Minimized;
                }
            }

            onHoveredChanged: {
                if(containsMouse){
                    print("Mouse hovered into 'Minimize' button area ...");
                    minimizeButtonID.color = "#e5e4e4";
                } else {
                    print("Mouse hovered out of 'Minimize' button area ...");
                    minimizeButtonID.color = "#f5f5f5";
                }


            }
        }

    }


    Rectangle {
        id: maximizeButtonID
        width: singleControlWidth
        height: width - 5
        clip: true
        color: "#f5f5f5"
        anchors.left: minimizeButtonID.right

        Image {
            id: maximizeImageID
            source: "qrc:/images/maximize.png"
            anchors.centerIn: parent
            opacity: 1
            width: 10
            height: width
            fillMode: Image.PreserveAspectFit

        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onPressed: {
                if(containsMouse){
                    print("Maximize button clicked!")
//                    window.showMaximized();
                    parent.focus = true
                    maximizeButtonID.color = "#bebaba";
                }

            }

            onReleased: {
                if(containsMouse){
                    Window.window.showMaximized();
                }
            }
            onHoveredChanged: {
                if(containsMouse){
                    print("Mouse hovered into 'Maximize' button area ...");
                    maximizeButtonID.color = "#e5e4e4";
                } else {
                    print("Mouse hovered out of 'Maximize' button area ...");
                    maximizeButtonID.color = "#f5f5f5";
                }


            }
        }

    }

    Rectangle {
        id: closeButtonID
        width: singleControlWidth
        height: width - 5
        clip: true
        color: "#f5f5f5"
        anchors.left: maximizeButtonID.right

        Image {
            id: closeImageID
            source: "qrc:/images/close-idle.png"
            anchors.centerIn: parent
            opacity: 1
            width: 10
            height: width
            fillMode: Image.PreserveAspectFit

        }


        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onPressed: {
                if(containsMouse){
                    print("Close button clicked!")
                    closeButtonID.color = "#ac1414";
                    parent.focus = true
                }

            }
            onReleased: {
                if(containsMouse){
                    Qt.quit();
                }
            }
            onHoveredChanged: {
                if(containsMouse){
                    print("Mouse hovered into 'Close' button area ...");
                    closeImageID.source = "qrc:/images/close-hover.png";
                    closeButtonID.color = "red";
                } else {
                    print("Mouse hovered out of 'Close' button area ...");
                    closeImageID.source = "qrc:/images/close-idle.png";
                    closeButtonID.color = "#f5f5f5";
                }


            }
        }


    }



}
