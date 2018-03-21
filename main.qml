import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: qsTr("Monark Control")

    Model {
        id: mymod
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent

        Data {
            model: mymod
            height: 480 - pageIndicator.height
        }

        Settings {
        }
    }

    footer: PageIndicator {
        id: pageIndicator
        currentIndex: swipeView.currentIndex
        count: swipeView.count
        anchors.centerIn: parent
    }
}
