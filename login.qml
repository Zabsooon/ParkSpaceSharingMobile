import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example.login 1.0

Window {
    id: loginWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Login Form")
    color: "#333333"

    // Email input field
    TextField {
        id: emailField
        width: 300
        anchors.centerIn: parent
        placeholderText: "Email"
        font.family: "Arial"
        font.pixelSize: 16
        padding: 10
        background: Rectangle {
            border.width: 1
            border.color: "#bcbcbc"
            color: "#ffffff"
            radius: 5

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "steelblue"
                }
                GradientStop {
                    position: 1.0
                    color: "deepskyblue"
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
                    opacity: 0.3
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
            border.color: "#bcbcbc"
            color: "#ffffff"
            radius: 5

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "steelblue"
                }
                GradientStop {
                    position: 1.0
                    color: "deepskyblue"
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
                    opacity: 0.3
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
            id: gradientRectangle
            color: loginButton.pressed ? "#7f8c8d" : "#bdc3c7"
            opacity: loginButton.pressed ? 0.8 : 1.0
            border.width: 1
            border.color: "#333333"

            gradient: Gradient {
                GradientStop { position: 0; color: "#f1c40f"}
                GradientStop { position: 1; color: "#e67e22"}
            }
            radius: 6
        }

        hoverEnabled: true
        onPressedChanged: {
            gradientRectangle.color = loginButton.pressed ? "#7f8c8d" : "#bdc3c7";
            gradientRectangle.opacity = loginButton.pressed ? 0.8 : 1.0;
        }

        transitions: Transition {
            NumberAnimation {
                properties: "opacity, color"
                duration: 100
            }
        }

        onClicked: loginClass.login(emailField.text, passwordField.text)
    }

    // Create an instance of the Login type
    LoginClass {
        id: loginClass
    }
}
