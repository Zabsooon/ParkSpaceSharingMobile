import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: "Welcome menu"

    header: TabBar {
        id: topBar
        TabButton {
            text: "Login"
            onClicked: {
                pageLoader.source = "login.qml"
            }
        }
        TabButton {
            text: "Register"
            onClicked: {
                pageLoader.source = "register.qml"
            }
        }
    }

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "login.qml"
    }
}
