import QtQuick 2.0

Item {
    id: root
    property int targetPower: 101
    property int currentPower: 102
    property int cadence: 90
    property int currentHeartrate: 167

    function setTargetPower(tp) {
        if (tp < 0)
            tp = 0
        if (tp > 700)
            tp = 700
        targetPower = tp
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            currentPower = targetPower - 5 + Math.random() * 10
            if (Math.random() > 0.6)
                currentHeartrate = currentHeartrate + (Math.random() < 0.5 ? -1 : 1)

           cadence = 88 + (Math.random() * 4)
        }

    }
}
