import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example.register 1.0

Window {
    id: registerWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Register form")
    color: "#333333"

    // Username input field
    TextField {
        id: usernameField
        width: 300
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        placeholderText: "Username"

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
                when: usernameField.activeFocus
                PropertyChanges {
                    target: usernameField
                    opacity: 1
                }
            },
            State {
                name: "inactive"
                when: !usernameField.activeFocus
                PropertyChanges {
                    target: usernameField
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

    TextField {
        id: emailField
        width: 300
        anchors.top: usernameField.bottom
        anchors.horizontalCenter: usernameField.horizontalCenter
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

    Button {
        id: registerButton
        width: 300
        anchors.top: passwordField.bottom
        anchors.horizontalCenter: passwordField.horizontalCenter
        text: "Register"
        font.pixelSize: 16
        font.bold: true

        background: Rectangle {
            id: registerButtonRectangle
            color: registerButton.pressed ? "#ffffff" : "#232323"
            border.width: 1
            border.color: "#bbbbbb"
            radius: 6
        }
        hoverEnabled: true

        onClicked: registerClass.registerUser(usernameField.text, emailField.text, passwordField.text)
    }

    RegisterClass {
        id: registerClass
    }
}
