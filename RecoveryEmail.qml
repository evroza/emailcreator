import QtQuick 2.9
import QtQuick.Controls 2.2

Item {

    id: recoveryEmailRootID
    property string email: ""

    width: parent.width
    height: parent.height

    Rectangle {
        id: recoveryEmailRectangle
        width: parent.width * 0.97
        height: parent.height
        anchors.top: parent.top
        anchors.right: parent.right

        color: "transparent"

        Item {
            id: recoveryEmailItemID
            anchors.top: parent.top
            anchors.topMargin: 7
            anchors.left: parent.left
            anchors.leftMargin: 33
            height: recoveryEmailLabelID.implicitHeight + recoveryEmailComboID.height + 2
            width: recoveryEmailComboID.width

            Text {
                id: recoveryEmailLabelID
                text: "Recovery Email"
                font.family: "Calibri"
                font.pixelSize: 17
                font.weight: Font.DemiBold
                color: "white"
            }

            ComboBox {
                id: recoveryEmailComboID

                anchors.top: recoveryEmailLabelID.bottom
                anchors.topMargin: 5

                width: 250
                textRole: "text"
                model: ListModel {
                    id: emailItems
                    ListElement { text: "testrecovery@gmail.com"; value: "testrecovery@gmail.com" }
                    ListElement { text: "anotherone@gmail.com"; value: "anotherone@gmail.com" }
                    ListElement { text: "thisonesperfect@gmail.com"; value: "thisonesperfect@gmail.com" }
                }

                onCurrentIndexChanged: {
                    console.debug("Selected email is: ", emailItems.get(currentIndex).text)
                    email = emailItems.get(currentIndex).value;
                }

            }
        }


    }


}
