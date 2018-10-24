import QtQuick 2.9
import QtQuick.Controls 2.2

Item {

    property alias checkBoxText: customCheckBoxLabelID
    property alias checkBoxID: checkBoxID
    property alias checked: checkBoxID.checked
    property alias labelLeftMarginAlias: customCheckBoxLabelID.labelLeftMargin


    width: customCheckBoxLabelID.implicitWidth + checkBoxID.width + labelLeftMarginAlias
    height: checkBoxID.height


    Label {
        property int labelLeftMargin: 10

        id: customCheckBoxLabelID
        text: qsTr("Default Text")
        anchors.left: checkBoxID.right
        anchors.top: checkBoxID.top
        anchors.leftMargin: labelLeftMargin
        anchors.rightMargin: 2
        anchors.topMargin: 2
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            checkBoxID.checked = !checkBoxID.checked
            print("State is - " + checkBoxID.checked)

            parent.focus = true
        }
    }

    Rectangle {

        property bool checked: false

        id: checkBoxID
        width: 18
        height: width
        clip: true
        border {
            color: "#DDD"
            width: 1
        }
//        radius: width / 2

        Image {
            id: checkedImageID
            source: "qrc:/images/tick-icon.png"
            anchors.fill: parent
            opacity: 1
        }


        states: [
            State {
                name: "checked"
                when: checkBoxID.checked
                PropertyChanges {
                    target: checkedImageID
                    opacity:1

                }
            },
            State {
                name: "unchecked"
                when: !checkBoxID.checked
                PropertyChanges {
                    target: checkedImageID
                    opacity: 0

                }
            }
        ]

        transitions: [Transition {
            from: "unchecked"
            to: "checked"

            NumberAnimation {
                properties: "opacity"
                duration: 200
            }
        },
            Transition {
                from: "checked"
                to: "unchecked"

                NumberAnimation {
                    properties: "opacity"
                    duration: 100
               }
            }
        ]


    }
}
