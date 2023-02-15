import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.VirtualKeyboard

ApplicationWindow {
    id: root
    visible: true
    // color: "black"
    width: 1280
    height: 720

    background: Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0; color: "#383838" }
            GradientStop { position: 1; color: "#181818" }
        }
    }

    TextField {
        id: digitsField
        width: parent.width
        placeholderText: "Digits only field"
        inputMethodHints: Qt.ImhDigitsOnly
        // enterKeyAction: EnterKeyAction.Next
        // onAccepted: textArea.focus = true
    }

    InputPanel {
        id: inputPanel
        visible: active
        width: root.width
        y: active ? parent.height - inputPanel.height : parent.height
        opacity: 0.5

        Component.onCompleted: {
            VirtualKeyboardSettings.locale = "eesti" // 复古键盘样式
            VirtualKeyboardSettings.wordCandidateList.alwaysVisible = true
        }
    }
}
