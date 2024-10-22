import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls


Window
{
    id:friendswindow
    height:694
    width:297
    title:"Znajomi"

    Image
    {
        source: "assets/friendlist"
    }

    Button
    {
        id:exitbutton
        height:30
        width:30
        anchors.right: parent.right
        anchors.top: parent.top

        Image
        {
            id: exitimage
            source: exitmouseArea.containsMouse ? "assets/exitanimation":"assets/exit"
            height: parent.height
            width: parent.width
        }

        MouseArea
        {
            id: exitmouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked:
            {
                close()
            }
        }
    }


}
