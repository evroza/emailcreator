import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Item {

    property alias labelTextID: inputLabelID
    property alias textInputID: textEdit
    property alias textEditBoundBoxID: textEditBoundBoxID //textEditBoundBoxID can be used to control the input width, height, color and border
    property alias placeHolderTextID: placeHolderTextID

    width: textEditBoundBoxID.width + 5
    height: textEditBoundBoxID.height + inputLabelID.implicitHeight + 5

    Text{
        id: inputLabelID
        text: "Default Text"
        font.family: "Calibri"
        font.pixelSize: 17
        font.weight: Font.DemiBold
        color: "white"
        x: 4
    }

    Rectangle {
        id: textEditBoundBoxID
        anchors.leftMargin: 30
        anchors.top: inputLabelID.bottom
        width: 240
        height: 35
        clip: true
        //radius: 5
        color: "white"
        border {
            width: 1
            color: "#CCC"
        }
        TextInput {
            id: textEdit
            anchors.fill: parent
            padding: 7
            leftPadding: 5
            font.family: "Calibri"
            font.pixelSize: 16
            color: "#666363"
            font.letterSpacing: 1
            enabled: true

//            horizontalAlignment: TextInput.AlignHCenter

            property string placeholderText: "Default text placeholder"

            Text {
                id: placeHolderTextID
                text: textEdit.placeholderText
                //anchors.left: parent.left
                x: 5
                y: 7
                font.pixelSize: 15
                color: "#ccc"
                visible: !textEdit.text
            }
        }
    }
}
