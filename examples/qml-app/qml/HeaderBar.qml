import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "transparent"
    
    RowLayout {
        spacing: 4

        anchors.fill: parent
        anchors.margins: 4

        MultiStateButton {
            Layout.fillHeight: true
            Layout.preferredWidth: 96
            text: "Hello"
            icon: "qrc:/simple/img/camera.png"
        }

        MultiStateButton {
            Layout.fillHeight: true
            Layout.preferredWidth: 96
            text: "Hello"
            icon: "qrc:/simple/img/robot.png"
        }

        MultiStateButton {
            Layout.fillHeight: true
            Layout.preferredWidth: 96
            text: "Hello"
            icon: "qrc:/simple/img/laser.png"
        }

        MultiStateButton {
            Layout.fillHeight: true
            Layout.preferredWidth: 96
            text: "Hello"
            icon: "qrc:/simple/img/cross.svg"
        }
    
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }

        Button {
            id: homeButton
            Layout.fillHeight: true
            Layout.preferredWidth: 96
            text: "Home"
            onClicked: {
                stack.push(monitorPage)
                console.log("poppopop")
            }
        }

        Button {
            id: backButton
            Layout.fillHeight: true
            Layout.preferredWidth: 96
            text: "Back"
            onClicked: {
                stack.pop()
                console.log("poppopop")
            }
        }
    }
}
