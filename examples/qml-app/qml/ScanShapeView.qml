import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts
import simple 1.0

Rectangle {
    property int loops: 0

    // color: "#383838"
    color: "transparent"

    PointCloudModel {
        id: pointCloudModel
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#383838"
        
        ChartView {
            id: chartView
            // title: "Scatters"
            anchors.fill: parent
            // theme: ChartView.ChartThemeDark
            // Layout.fillWidth: true
            // Layout.fillHeight: true
            // color: "#383838"

            antialiasing: true
            backgroundColor: "#383838"
            plotAreaColor: "transparent"
            titleColor: "#d8d8d8"
            margins {
                left: 0
                top: 0
                right: 0
                bottom: 0
            }
            legend.visible: false

            ScatterSeries {
                id: scatter1
                name: "Scatter1"
                borderWidth: 0
                color: "red"
                markerSize: 3.0
                markerShape: ScatterSeries.MarkerShapeRectangle
                // titleColor: "#d8d8d8"

                axisX: ValueAxis {
                    id: axisX
                    min: -10
                    max: 10
                    color: "#787878"
                    labelsColor: "#a8a8a8"
                    labelFormat: "%4.1f"
                    gridLineColor: "#484848"
                    tickCount: 10
                    titleText: "<font color='#a8a8a8'>Y (mm)</font>"
                }

                axisY: ValueAxis {
                    id: axisY
                    min: -10
                    max: 10
                    color: "#787878"
                    gridLineColor: "#484848"
                    labelsColor: "#a8a8a8"
                    labelFormat: "%4.1f"
                    tickCount: 10
                    titleText: "<font color='#a8a8a8'>Z (mm)</font>"
                }

                // XYPoint { x: 1.5; y: 1.5 }
                // XYPoint { x: 1.5; y: 1.6 }
                // XYPoint { x: 1.57; y: 1.55 }
                // XYPoint { x: 1.8; y: 1.8 }
                // XYPoint { x: 1.9; y: 1.6 }
                // XYPoint { x: 2.1; y: 1.3 }
                // XYPoint { x: 2.5; y: 2.1 }
            }

            ScatterSeries {
                name: "Scatter2"
                // brushFilename: "qrc:/simple/img/cross.svg"
                brush: BrushFactory.patternBrush(BrushFactory.Cross, Qt.size(30,30), Qt.rgba(1,1,0,1), Qt.rgba(0,0,0,1), 4)
                color: "red"
                borderColor: "transparent"
                // borderWidth: 0
                markerSize: 30.0
                markerShape: ScatterSeries.MarkerShapeRectangle
                useOpenGL: false

                XYPoint { x: 0.0; y: 2.0 }
                // XYPoint { x: 2.0; y: 2.1 }
                // XYPoint { x: 2.07; y: 2.05 }
                // XYPoint { x: 2.2; y: 2.9 }
                // XYPoint { x: 2.4; y: 2.7 }
                XYPoint { x: 2.67; y: 2.65 }
            }

            ScatterSeries {
                name: "Scatter3"
                // brushFilename: "qrc:/simple/img/cross.svg"
                brush: BrushFactory.patternBrush(BrushFactory.Ball, Qt.size(30,30), Qt.rgba(0,1,1,1), Qt.rgba(0,0,0,0))
                // color: "red"
                borderColor: "transparent"
                // borderWidth: 0
                markerSize: 30.0
                markerShape: ScatterSeries.MarkerShapeRectangle
                useOpenGL: false

                XYPoint { x: 1.0; y: 2.0 }
                // XYPoint { x: 2.0; y: 2.1 }
                // XYPoint { x: 2.07; y: 2.05 }
                // XYPoint { x: 2.2; y: 2.9 }
                // XYPoint { x: 2.4; y: 2.7 }
                XYPoint { x: 3.67; y: 2.65 }
            }

            LineSeries {
                // name: "LineSeries"
                color: "gold"
                XYPoint { x: -5; y: 5 }
                XYPoint { x: 5; y: 5 }
                XYPoint { x: 8; y: -5 }
                XYPoint { x: -8; y: -5 }
                XYPoint { x: -5; y: 5 }
                // XYPoint { x: 3.4; y: 3.0 }
                // XYPoint { x: 4.1; y: 3.3 }
            }

            LineSeries {
                // name: "LineSeries"
                color: "green"
                XYPoint { x: -1; y: 0 }
                XYPoint { x: 1; y: 0 }
                XYPoint { x: 0; y: 1 }
                XYPoint { x: 0; y: -1 }
            }

            HXYModelMapper {
                id: mapper
                columnCount: pointCloudModel.columnCount()
                firstColumn: 0
                model: pointCloudModel
                series : scatter1
                xRow: 0
                yRow: 1
            }
        }
        }

        Rectangle {
            Layout.fillWidth: true
            color: "#383838"
            height: 48

            RowLayout {
                anchors.fill: parent

                Button {
                    text: "blue"
                    width: 48
                    height: 48
                }

                Button {
                    text: "blue"
                    width: 48
                    height: 48
                }

                Button {
                    text: "blue"
                    width: 48
                    height: 48
                }
            }
        }
    }

    PinchArea {
        anchors.fill: parent
        pinch.minimumRotation: -360
        pinch.maximumRotation: 360
        pinch.minimumScale: 0.1
        pinch.maximumScale: 10
        pinch.dragAxis: Pinch.XAndYAxis

        // enabled: true
        onPinchStarted: {
            console.log("console ", "pinchstarted")
            // image.scale = Math.round(pinch.scale / 10) * 10;
        }

        onPinchUpdated: {

            console.log("console ", "pinchUpdated")
            // image.scale = Math.round(pinch.scale / 10) * 10;
        }
        onPinchFinished: {
            console.log("console ", "pinchfinished")
        }

        MouseArea {
            // id: dragArea
            // hoverEnabled: true
            anchors.fill: parent
            // drag.target: image
            scrollGestureEnabled: false

            onPositionChanged: {
                console.log("MouseArea onPositionChanged")
            }
        }
    }

    Timer {
        interval: 15; running: true; repeat: true
        onTriggered: {
            loops += 1
            if ((loops % 60) == 0)
                chartView.scrollDown(2);
            // else
            //     chartView.zoomReset()
            // console.log("SDSDSD")
            pointCloudModel.forceRefresh()
        }
    }
}
