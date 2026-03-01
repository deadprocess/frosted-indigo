import Quickshell
import QtQuick
import QtQuick.Controls

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    
    // Using your mandatory color
    color: "#667bbe"
    implicitHeight: 32

    // Simple layout container
    Row {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        spacing: 10

        // Left Side: Workspace or Status Placeholder
        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "󰣇 arch" // Nerd Font icon (optional)
            color: "white"
            font.bold: true
            opacity: 0.9
        }

        // Center: The Clock (now process-free)
        Item {
            width: parent.width - 200 // Buffer for sides
            height: parent.height
            
            Text {
                id: clock
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 14
                font.weight: Font.Medium
                
                function updateTime() {
                    // Native JS date formatting - much faster than 'date'
                    clock.text = Qt.formatDateTime(new Date(), "ddd dd MMM  hh:mm:ss")
                }

                Component.onCompleted: updateTime()

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: clock.updateTime()
                }
            }
        }
    }
    
    // Optional: A subtle highlight line at the top to give it depth
    Rectangle {
        anchors.top: parent.top
        width: parent.width
        height: 1
        color: "white"
        opacity: 0.15
    }
}
