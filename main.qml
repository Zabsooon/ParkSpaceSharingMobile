import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: "Welcome menu"

    property int currentPage: -1

    Row {
        spacing: 10

        Button {
            text: "Login"
            onClicked: currentPage = 0
        }

        Button {
            text: "Register"
            onClicked: currentPage = 1
        }
    }

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: currentPage == 0 ? "login.qml" : "register.qml"
        Component.onCompleted: {
            currentPage = -1
        }
    }
}
