import QtQuick 2.9

Item {


    Rectangle {

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onClicked: {
                if(containsMouse){
                    print("Close button clicked!")
                    Qt.quit();
                    parent.focus = true
                }

            }
            onHoveredChanged: {
                if(containsMouse){
                    print("Mouse hovered into 'Close' button area ...");
                    closeImageID.source = "qrc:/images/close-hover.png";
                } else {
                    print("Mouse hovered out of 'Close' button area ...");
                    closeImageID.source = "qrc:/images/close-idle.png";
                }


            }
        }

        id: checkBoxID
        width: 18
        height: width
        clip: true

        Image {
            id: closeImageID
            source: "qrc:/images/close-idle.png"
            anchors.fill: parent
            opacity: 1
        }

    }



}
