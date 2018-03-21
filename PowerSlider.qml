import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    property alias value: powerSlider.value
    Slider {
        height: 60
        id: powerSlider
        stepSize: 1
        background: Rectangle {
                x: powerSlider.leftPadding
                y: powerSlider.topPadding + powerSlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: powerSlider.availableWidth
                height: implicitHeight
                radius: 2
                color: "#bdbebf"
        }
        from: 1
        value: 100
        to: 700
        width: 800
        handle: Rectangle {
            x: powerSlider.leftPadding + powerSlider.visualPosition * (powerSlider.availableWidth - width)
            y: powerSlider.topPadding + powerSlider.availableHeight / 2 - height / 2
            implicitWidth: 50
            implicitHeight: 50
            radius: 25
            color: powerSlider.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }
    }
}
