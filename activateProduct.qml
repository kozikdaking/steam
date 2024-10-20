// aktywujProdukt.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id:activateWindow
    visible: true
    width: 400
    height: 300
    title: "Aktywuj Produkt"

    Rectangle {
        anchors.fill: parent
        color: "#F0F0F0"

        Text {
            text: "Activate your Steam product"
            anchors.centerIn: parent
            font.pixelSize: 20
            color: "#333"
        }

        Button {
            text: "Close"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            onClicked: {
                Qt.quit();  // Close the window when the button is clicked
            }
        }
    }
}
