import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    property alias icon: image.source
    property string text: "AAA"
    property alias hovered: mouseArea.containsMouse
    property int frames: 0

    // width: side; height: side
    // color: "transparent"
    property color stateColor: "blue"

    function hello(args)
    {
        // console.log("Hello, QML", hovered)
        hintText.text = "AKA " + frames
        frames += 1
    }

    color: hovered ? "#d6d6d6" : "gray"
    border.color: "#d6282a"
    border.width: 2
    radius: 4

    Image {
        id: image
        anchors.fill: parent
        anchors.margins: 4
    }

    // Button {
    //     id: btn
    //     anchors.fill: parent
    //     anchors.margins: 4
    //     // text: parent.text
    //     background: Rectangle {
    //         // implicitWidth: 100
    //         // implicitHeight: 40
    //         color: this.down ? "#d6d6d6" : "gray"
    //         // border.color: "#26282a"
    //         // border.width: 1
    //         // radius: 4
    //     }
    // }

    Rectangle {
        id: hintBoxTop
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 4
        opacity: 0.5
        color: "red"
        implicitHeight: 20
    }

    Text {
        id: hintText
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: 4
        text: "Hello World!"
        font.family: "Helvetica"
        font.pointSize: 10
        color: "white"
    }

    Rectangle {
        id: stateBox
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 4
        color: stateColor
        implicitHeight: 8
        // border.color: "#26282a"
        // border.width: 1
        // radius: 4
    }

//    Rectangle {
//         id: stateBoxMask
//         anchors.top: stateBox.top
//         anchors.left: stateBox.left
//         anchors.right: stateBox.right
//         height: 1 / 2 * stateBox.height
//         color: stateColor
//         /*border.width: 1
//         border.color: borderColor*/
//     }

    ColorAnimation on stateColor { to: "yellow"; duration: 200 }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: console.log("Button clicked!")
        onEntered: console.log("Entered clicked!")
    }

    Timer {
        interval: 50; running: true; repeat: true
        onTriggered: hello()
    }
}