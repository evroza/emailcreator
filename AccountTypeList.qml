import QtQuick 2.9


Item {
    anchors.fill: parent
    Rectangle {
        color: "white"
        width: parent.width
        height: 120
        y: 23

        Text {
            id: accountTypeLabelID
            text: "Account type"
            font.family: "Calibri"
            font.pixelSize: 17
            font.weight: Font.DemiBold
            color: "white"
            x: 7
            y: -23

        }

        ListView {
            id: accountTypeListID
            anchors.fill: parent
            model: accountTypeListModelID
            delegate: Rectangle {
                id: accountTypeListDelegateID
                 width: parent.width
                 height: 30
                 color: ListView.isCurrentItem ? "#e8e1e1" : "white"

                 Text {
                    id: accountTypeListLabelID
                    anchors.centerIn: parent
                    text: name
                    font.pixelSize: 15
                    color: ListView.isCurrentItem ? "#8dc63f" : "#666363"
                 }

                 MouseArea {
                     anchors.fill: parent
                     onClicked: {
                         console.log("Account type: ", number, "-- ", name, " selected")
                         accountTypeListID.currentIndex = index
                     }
                 }
           }
        }
    }

    ListModel {
            id: accountTypeListModelID
            ListElement {
                name:'gmx.de'
                number:'1'
            }
            ListElement {
                name:'web.de'
                number:'2'
            }
            ListElement {
                name:'web.de & gmx.de'
                number:'3'
            }
    }








}
