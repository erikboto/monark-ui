import QtQuick 2.0

Rectangle {
    id: root
    signal clicked
    height: parent.height
    property alias text: text.text

    Rectangle {
        id: button
        width: root.width
        height: root.width
        radius: root.width / 2
        color: "lightgrey"
        border.color: "black"
        border.width: 3

        anchors.centerIn: root
        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }

        Text {
            id: text
            anchors.centerIn: parent
            text: "+"
            font.pixelSize: 40
        }

    }


}
