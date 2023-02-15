import QtQuick 2.14
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

    header: HeaderBar {
        id: headerBar
        height: 96
        // Layout.fillWidth: true
    }

    StackView {
        id: stack
        initialItem: centerView
        anchors.fill: parent
    }

    footer: FooterBar {
        height: 24
    }

    CenterView {
        id: centerView
        visible: false
        // anchors.fill: parent
        // height: 24
        // anchors.fill: parent
        // anchors.margins: 2
        // Layout.fillWidth: true
        // Layout.fillHeight: true
    }

    Rectangle {
        id: monitorPage
        visible: false
    }
// Rectangle {
//     width: 500; height: 500
//     gradient: Gradient {
//         GradientStop { position: 0.0; color: "red" }
//         GradientStop { position: 0.33; color: "yellow" }
//         GradientStop { position: 1.0; color: "green" }
//     }
// }

/*
    Item {
        // gradient: Gradient {
        //     GradientStop { position: 0; color: "#ffffff" }
        //     GradientStop { position: 1; color: "#c1bbf9" }
        // }
        anchors.fill: parent

        RadialGradient {
            centerX: 50; centerY: 50
            centerRadius: 100
            focalX: centerX; focalY: centerY
            GradientStop { position: 0; color: "gray" }
            // GradientStop { position: 0.2; color: "green" }
            // GradientStop { position: 0.4; color: "red" }
            // GradientStop { position: 0.6; color: "yellow" }
            GradientStop { position: 1; color: "black" }
        }
    }
*/

/*
    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        HeaderBar {
            id: headerBar
            height: 96
            Layout.fillWidth: true
        }

        // Rectangle {
        //     color: "black"
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true

        //     Rectangle {
        //         anchors.fill: parent
        //         anchors.margins: 4
        //         border.width: 1
        //         border.color: "gray"
        //         color: "black"
        //         radius: 4

                CenterView {
                    id: centerView
                    // height: 24
                    // anchors.fill: parent
                    // anchors.margins: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            // }
        // }

        FooterBar {
            id: footerBar
            height: 24
            Layout.fillWidth: true
        }
    }

    InputPanel {
        id: inputpanel
        visible: active
        width: root.width / 2
        y: active?parent.height - inputpanel.height : parent.height

        Component.onCompleted: {
            //VirtualKeyboardSettings.locale = "eesti" // 复古键盘样式
            VirtualKeyboardSettings.wordCandidateList.alwaysVisible = true
        }
    }
*/
}
