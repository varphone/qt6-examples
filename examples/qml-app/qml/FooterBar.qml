import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "#383838"

    RowLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }

       Text {
            id: nowText
            // Layout.fillWidth: true,
            Layout.fillHeight: true
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            rightPadding: 4.0
            text: "2023-11-11 00:00:00"
        }
    }

    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: {
            nowText.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
        }
    }
}
