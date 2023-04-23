import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example.login 1.0

Rectangle {
    id: loginWindow
    width: 640
    height: 480
    visible: true
    color: "#333333"

    TextField {
        id: emailField
        width: 300
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        placeholderText: "Email"

        font.family: "Arial"
        font.pixelSize: 16
        padding: 10

        background: Rectangle {
            border.width: 1
            border.color: "#262525"
            color: "#ffffff"
            radius: 5

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#0569b5"
                }
                GradientStop {
                    position: 1.0
                    color: "#0b1924"
                }
            }
        }

        // Define the animation
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }

        // Apply the animation to the id property
        states: [
            State {
                name: "active"
                when: emailField.activeFocus
                PropertyChanges {
                    target: emailField
                    opacity: 1
                }
            },
            State {
                name: "inactive"
                when: !emailField.activeFocus
                PropertyChanges {
                    target: emailField
                    opacity: 0.7
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                reversible: true
                PropertyAnimation {
                    property: "opacity"
                    duration: 500
                }
            }
        ]
    }

    // Password input field
    TextField {
        id: passwordField
        width: 300
        anchors.top: emailField.bottom
        anchors.horizontalCenter: emailField.horizontalCenter
        placeholderText: "Password"
        echoMode: TextInput.Password

        font.family: "Arial"
        font.pixelSize: 16
        padding: 10

        background: Rectangle {
            border.width: 1
            border.color: "#262525"
            color: "#ffffff"
            radius: 5

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#0569b5"
                }
                GradientStop {
                    position: 1.0
                    color: "#0b1924"
                }
            }
        }

        // Define the animation
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }

        // Apply the animation to the id property
        states: [
            State {
                name: "active"
                when: passwordField.activeFocus
                PropertyChanges {
                    target: passwordField
                    opacity: 1
                }
            },
            State {
                name: "inactive"
                when: !passwordField.activeFocus
                PropertyChanges {
                    target: passwordField
                    opacity: 0.7
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                reversible: true
                PropertyAnimation {
                    property: "opacity"
                    duration: 500
                }
            }
        ]
    }

    // Login button
    Button {
        id: loginButton
        width: 300
        height: 70
        anchors.top: passwordField.bottom
        anchors.horizontalCenter: passwordField.horizontalCenter
        text: "Login"
        font.pixelSize: 16
        font.bold: true

        background: Rectangle {
            id: loginButtonRectangle
            color: loginButton.pressed ? "#ffffff" : "#232323"
            border.width: 1
            border.color: "#bbbbbb"
            radius: 6
        }
        hoverEnabled: true

        onClicked: loginClass.login(emailField.text, passwordField.text)
    }

    // Create an instance of the Login type
    LoginClass {
        id: loginClass
    }
}
