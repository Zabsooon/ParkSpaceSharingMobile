import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example 1.0

Window {
    id: window
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
    }

    // Password input field
    TextField {
        id: passwordField
        width: 300
        anchors.top: emailField.bottom
        anchors.horizontalCenter: emailField.horizontalCenter
        placeholderText: "Password"
        echoMode: TextInput.Password
    }

    // Login button
    Button {
        id: loginButton
        width: 300
        anchors.top: passwordField.bottom
        anchors.horizontalCenter: passwordField.horizontalCenter
        text: "Login"
        onClicked: loginClass.login(emailField.text, passwordField.text)
    }

    // Create an instance of the Login type
    LoginClass {
        id: loginClass
    }
}
