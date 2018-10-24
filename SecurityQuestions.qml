import QtQuick 2.9
import QtQuick.Controls 2.2

Item {

    id: securityQRootID
    property string gmxDeSecurityQ: ""
    property string webDeSecurityQ: ""
    property int securityQComboWidth: 207

    width: parent.width
    height: parent.height

    Rectangle {
        id: securityQRectangle
        width: parent.width * 0.97
        height: parent.height
        anchors.top: parent.top
        anchors.right: parent.right

        color: "transparent"

        // gmxDe
        Item {
            id: gmxDeSecurityQItemID
            anchors.top: parent.top
            anchors.topMargin: 7
            anchors.left: webDeSecurityQItemID.right
            anchors.leftMargin: 10
            height: gmxDeSecurityQLabelID.implicitHeight + gmxDeSecurityQComboID.height
            width: gmxDeSecurityQComboID.width

            Text {
                id: gmxDeSecurityQLabelID
                text: "GMX Security Question"
                font.family: "Calibri"
                font.pixelSize: 17
                font.weight: Font.DemiBold
                color: "white"
            }

            ComboBox {
                id: gmxDeSecurityQComboID

                anchors.top: gmxDeSecurityQLabelID.bottom
                anchors.topMargin: 5

                width: securityQComboWidth
                textRole: "text"
                model: ListModel {
                    id: gmxDeSecurityQItems
                    ListElement { text: "Mother's maiden name"; value: "Kangaroo" }
                    ListElement { text: "Childhood bestfriend name"; value: "beatle" }
                    ListElement { text: "what year was your father born?"; value: "1941" }
                    ListElement { text: "What is your pet’s name?"; value: "Bingo" }
                    ListElement { text: "first name of the person you first kissed?"; value: "Croc" }
                    ListElement { text: "last name of the teacher who gave you your first failing grade?"; value: "hog" }
                }

                onCurrentIndexChanged: {
                    console.debug("Selected Gmx.de Security Question is: ", gmxDeSecurityQItems.get(currentIndex).text, " -- ", gmxDeSecurityQItems.get(currentIndex).value);
                    gmxDeSecurityQ = gmxDeSecurityQItems.get(currentIndex).value;
                    // Update displayed answer
                    gmxDeSecurityALabelID.text = "A: " + gmxDeSecurityQItems.get(currentIndex).value;
                }

            }

            // Answer tip
            Text {
                id: gmxDeSecurityALabelID
                text: "A: "
                anchors.top: gmxDeSecurityQComboID.bottom
                x: 7
                font.family: "Calibri"
                font.pixelSize: 11
                font.weight: Font.DemiBold
                color: "#666864"
            }
        }

        // webDe
        Item {
            id: webDeSecurityQItemID
            anchors.top: parent.top
            anchors.topMargin: 7
            anchors.left: parent.left
            anchors.leftMargin: 33
            height: webDeSecurityQLabelID.implicitHeight + webDeSecurityQComboID.height
            width: webDeSecurityQComboID.width

            Text {
                id: webDeSecurityQLabelID
                text: "Web.de Security Question"
                font.family: "Calibri"
                font.pixelSize: 17
                font.weight: Font.DemiBold
                color: "white"
            }

            ComboBox {
                id: webDeSecurityQComboID

                anchors.top: webDeSecurityQLabelID.bottom
                anchors.topMargin: 5

                width: securityQComboWidth
                textRole: "text"
                model: ListModel {
                    id: webDeSecurityQItems
                    ListElement { text: "first name of the person you first kissed?"; value: "Croc" }
                    ListElement { text: "last name of the teacher who gave you your first failing grade?"; value: "hog" }
                    ListElement { text: "Mother's maiden name"; value: "Kangaroo" }
                    ListElement { text: "What is your pet’s name?"; value: "Bingo" }
                    ListElement { text: "Childhood bestfriend name"; value: "beatle" }
                    ListElement { text: "what year was your father born?"; value: "1941" }
                }

                onCurrentIndexChanged: {
                    console.debug("Selected Web.de Security Question is: ", webDeSecurityQItems.get(currentIndex).text, " -- ", webDeSecurityQItems.get(currentIndex).value);
                    webDeSecurityQ = webDeSecurityQItems.get(currentIndex).value;
                    // Update displayed answer
                    webDeSecurityALabelID.text = "A: " + webDeSecurityQItems.get(currentIndex).value;
                }

            }
            // Answer tip
            Text {
                id: webDeSecurityALabelID
                anchors.top: webDeSecurityQComboID.bottom
                x: 7
                text: "A: "
                font.family: "Calibri"
                font.pixelSize: 11
                font.weight: Font.DemiBold
                color: "#666864"
            }
        }
    }

}
