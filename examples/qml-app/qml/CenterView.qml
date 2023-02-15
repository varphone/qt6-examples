import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.VirtualKeyboard

Rectangle {
    color: "transparent"

        RowLayout {
            anchors.fill: parent

            spacing: 2

            Rectangle {
                color: "#383838"
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            ScanShapeView {
                Layout.fillHeight: true
                width: 480
            }
        }
}
