import QtQuick 2.9
import QtQuick.Dialogs 1.2

Item {
    id: emailDataLoadID

    property bool loadFromFile: false
    property int textInputWidths: 185
    property string disabledLabelColor: "#494646"
    property string disabledTextInputColor: "#081a2c"

    width: parent.width
    height: parent.height


    Rectangle{
        id: borderRectID

        width: parent.width * 0.97
        height: parent.height * 0.97
        anchors.right: parent.right
        color: "transparent"
        border {
            color: "#2bc48a"
            width: 1
        }

        Text {
            id: titleID
            x: 10
            y: -19
            text: "Email data"
            font.family: "Calibri"
            font.pixelSize: 17
            font.weight: Font.DemiBold
            color: "white"
        }

        Item {
            id: emailPassInputsID
            anchors.top: parent.top
            anchors.topMargin: 7
            height: emailPassEmailID.height

            CustomCheckBox {
                id: emailPassCheckID
                anchors.left: parent.left
                anchors.leftMargin: 5
                y: 30

                // Set custom exposed properties
                checked: true
                checkBoxText.text: ""

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: shiftRadio("emailPassCheckID")
                }


            }

            TextLabelInput {
                id: emailPassEmailID
                anchors.left: emailPassCheckID.right
                textEditBoundBoxID.width: textInputWidths

                textInputID.enabled: emailPassCheckID.checked ? true: false
                labelTextID.color: emailPassCheckID.checked ? "white" : disabledLabelColor
                textInputID.color: emailPassCheckID.checked ? "#666363" : disabledLabelColor
                textEditBoundBoxID.color: emailPassCheckID.checked ? "white" : disabledTextInputColor
                textEditBoundBoxID.border.color: emailPassCheckID.checked ? "white" : disabledLabelColor
                placeHolderTextID.color: emailPassCheckID.checked ? "white" : disabledLabelColor
            }

            TextLabelInput {
                id: emailPassPassID
                anchors.left: emailPassEmailID.right
                anchors.leftMargin: 5
                textEditBoundBoxID.width: textInputWidths

                textInputID.enabled: emailPassCheckID.checked ? true: false
                labelTextID.color: emailPassCheckID.checked ? "white" : disabledLabelColor
                textInputID.color: emailPassCheckID.checked ? "#666363" : disabledLabelColor
                textEditBoundBoxID.color: emailPassCheckID.checked ? "white" : disabledTextInputColor
                textEditBoundBoxID.border.color: emailPassCheckID.checked ? "white" : disabledLabelColor
                placeHolderTextID.color: emailPassCheckID.checked ? "white" : disabledLabelColor
            }
        }

        Item{
            anchors.top: emailPassInputsID.bottom

            CustomCheckBox {
                id: emailPassFileCheckID
                anchors.left: parent.left
                anchors.leftMargin: 5
                y: 30

                // Set custom exposed properties
                checked: false
                checkBoxText.text: ""

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: shiftRadio("emailPassFileCheckID")
                }


            }

            TextLabelInput {
                id: emailPassFileID
                anchors.left: emailPassFileCheckID.right
                textEditBoundBoxID.width: textInputWidths * 1.3

                textInputID.enabled: emailPassFileCheckID.checked ? true: false
                labelTextID.color: emailPassFileCheckID.checked ? "white" : disabledLabelColor
                textInputID.color: emailPassFileCheckID.checked ? "#666363" : disabledLabelColor
                textEditBoundBoxID.color: emailPassFileCheckID.checked ? "white" : disabledTextInputColor
                textEditBoundBoxID.border.color: emailPassFileCheckID.checked ? "white" : disabledLabelColor
                placeHolderTextID.color: emailPassFileCheckID.checked ? "white" : disabledLabelColor
            }

            Rectangle {
                id:  fileBrowseButtonID
                width: fileBrowseButtonTextID.implicitWidth + 20
                height: fileBrowseButtonTextID.implicitHeight + 7
                anchors.left: emailPassFileID.right
                anchors.leftMargin: 20
                y: 25

                color: "transparent"
                border.color:  emailPassFileCheckID.checked ? "#2bc48a" : disabledLabelColor
                border.width: 1

                Text {
                    id: fileBrowseButtonTextID
                    text: "Browse ..."
                    anchors.centerIn: parent
                    font.family: "Calibri"
                    font.pixelSize: 17
                    font.weight: Font.DemiBold
                    color: emailPassFileCheckID.checked ? "white" : disabledLabelColor
                }

                MouseArea {
                    id: fileBrowseButtonMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: emailPassFileCheckID.checked ? true : false
                    enabled: emailPassFileCheckID.checked ? true : false
                    acceptedButtons: Qt.LeftButton
                    onPressed: {
                        if(containsPress){
                            print("Browse button pressed!")

                            emailPassFileID.focus = true
                            fileBrowseButtonID.color = "white";
                            fileBrowseButtonTextID.color = "black"

                            // Open the file browser dialog
                            fileDialog.visible = true
                        }


                    }
                    onReleased: {
                        if(containsMouse){
                            fileBrowseButtonID.color = "#6f5d82";
                            fileBrowseButtonTextID.color = "white"
                        } else {
                            fileBrowseButtonID.color = "transparent";
                        }

                    }
                    onHoveredChanged: {
                        if(containsMouse){
                            print("Mouse hovered into 'Browse' button area ...");
                            fileBrowseButtonID.color = "#6f5d82";

                        } else {
                            print("Mouse hovered out of 'Browse' button area ...");
                            fileBrowseButtonID.color = "transparent";
                            fileBrowseButtonTextID.color = "white"
                        }


                    }
                }

            }

            FileDialog {
                id: fileDialog
                title: "Please choose a file"
                folder: shortcuts.documents
                selectMultiple: false
                selectFolder: false
                nameFilters: [ "Text files (*.txt)", "CSV files (*.csv)" ]

                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrl);

                    // Set the 'emailPassFileID' text input content to selected file
                    emailPassFileID.textInputID.text = fileDialog.fileUrl

                }
                onRejected: {
                    console.log("CANCELLED: Email file not selected!");
                }
//                Component.onCompleted: visible = true
            }
        }


    }


    function shiftRadio(radioID){
        if(radioID === "emailPassCheckID"){
            emailPassEmailID.focus = true;
            print("EmailText Radio");
            loadFromFile = false;
            emailPassFileCheckID.checked = false;
            emailPassCheckID.checked = true;


        } else if(radioID === "emailPassFileCheckID"){
            emailPassFileID.focus = true;
            print("EmailFile Radio");
            loadFromFile = true;
            emailPassFileCheckID.checked = true;
            emailPassCheckID.checked = false;


        }
    }


}
