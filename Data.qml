import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Item {
    id: root
    property var model
    Component.onCompleted: console.log("yad")
    ColumnLayout {
        id: mainGrid
        width: 800
        height: root.height
        spacing: 0

        Rectangle {
            id: topRow
            color: "blue"
            width: parent.width
            height: 150

            RowLayout {
                Layout.fillWidth: true
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                spacing: 0

                Rectangle {
                    height: parent.height
                    width: parent.width / 3
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: labelCadenceHeader
                        text: "Cadence"
                        font.pixelSize: 25
                    }
                    Text {
                        anchors.centerIn: parent
                        id: labelCadence
                        text: root.model.cadence
                        font.pixelSize: 100
                    }
                }
                Rectangle {
                    height: parent.height
                    width: parent.width / 3
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: labelPowerHeader
                        text: "Current"
                        font.pixelSize: 25
                    }
                    Text {
                        anchors.centerIn: parent
                        id: labelPower
                        text: root.model.currentPower
                        font.pixelSize: 100
                    }
                }
                Rectangle {
                    height: parent.height
                    width: parent.width / 3
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: labelHeartHeader
                        text: "Heart Rate"
                        font.pixelSize: 25
                    }
                    Text {
                        anchors.centerIn: parent
                        id: labelHeart
                        text: root.model.currentHeartrate
                        font.pixelSize: 100
                    }
                }
            }
        }
        Rectangle {
            Layout.fillWidth: true
            height: root.height - topRow.height - sliderRow.height

            RowLayout {
                width: parent.width
                height: parent.height
                anchors.centerIn: parent

                IncDecButton {
                    id: decBig
                    text: "-50"
                    Layout.fillWidth: true
                    onClicked: root.model.setTargetPower(root.model.targetPower - 50)
                }

                IncDecButton {
                    id: decSmall
                    text: "-5"
                    Layout.fillWidth: true
                    onClicked: root.model.setTargetPower(root.model.targetPower - 5)
                }

                Rectangle {
                    width: 300
                    height: parent.height
                    //color: "green"
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: labelTargetPowerHeader
                        font.pixelSize: 30
                        text: "Target"
                    }
                    Text {
                        anchors.centerIn: parent
                        id: labelTargetPower
                        font.pixelSize: 130
                        text: root.model.targetPower
                    }
                }

                IncDecButton {
                    id: incSmall
                    text: "+5"
                    Layout.fillWidth: true
                    onClicked: root.model.setTargetPower(root.model.targetPower + 5)
                }

                IncDecButton {
                    id: incBig
                    text: "+50"
                    Layout.fillWidth: true
                    onClicked: root.model.setTargetPower(root.model.targetPower + 50)
                }
            }

        }

        Rectangle {
            id: sliderRow
            PowerSlider {
                id: powerSlider
                onValueChanged: root.model.setTargetPower(powerSlider.value)
            }
            Layout.fillWidth: true
            height: 70
        }

        Binding { target: powerSlider; property: "value"; value: root.model.targetPower }
    }
}
