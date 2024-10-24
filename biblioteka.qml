import QtQuick
import QtQuick.Window
import QtQuick.Controls

Rectangle {
    width: 640
    height: 480
    color: "gray"

    Text {
        text: "Nowy widok załadowany!"
        anchors.centerIn: parent
        font.pixelSize: 24
    }
    Rectangle
    {
        id:libraryBar
        height:parent.height
            width:273
            color:"darkblue"

            Rectangle
            {
                id:stronaglowna
                height:40
                    width:215
                    anchors.top: libraryBar.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    color:"gray"

                    Text
                    {
                        id:glownaText
                        text:"Strona główna"
                        color:"white"
                        anchors.centerIn: parent
                    }
            }
            Rectangle
            {
                id:kolekcje
                height:40
                width:40
                color:"gray"

                anchors.left: stronaglowna.right
                anchors.top: libraryBar.top
                anchors.topMargin: 5
                anchors.leftMargin: 5
            }

//------------------------------------------------------------------------COMBOBOX------------------------------------------------------------------

             ComboBox
             {
                    id:gryiprogramy
                    height:40
                        width:180
                        anchors.top: stronaglowna.bottom
                        anchors.left: parent.left
                        anchors.topMargin: 5
                        anchors.leftMargin: 5


                        ListView
                        {
                        id:gryiprogramyList
                        height:200
                        width:parent.width

                        model:ListModel
                        {
                            ListElement{ optionName:"Gry"}
                            ListElement{ optionName:"Zdjęcia"}
                            ListElement{optionName:"Gry"}
                        }

                        }

                   background:  Rectangle
                    {
                        height:parent.height
                        width:parent.width
                        color:"gray"
                        anchors.fill:parent
                        Text{
                        text:"Gry i programy"
                        color:"white"
                        anchors.fill:parent

                            }
                    }
             }

//------------------------------------------------------------------------SEARCH BAR------------------------------------------------------------------

            TextField
            {
                id:searchbarinput
                height:40
                width:parent.width
                placeholderText:qsTr("Szukaj według nazwy")
                color:"white"
                font.pointSize: 12
                anchors.top:gryiprogramy.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.leftMargin:5
                background: Rectangle
                {
                    id:searchbar
                    height:40
                    width:255
                    color: "gray"
                }
            }
//------------------------------------------------------------------------GAME LIST------------------------------------------------------------------
            Rectangle
            {
                id:gamelist
                width:255
                height:600
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: stronaglowna.bottom
                anchors.topMargin: 150
                color:"darkgray"
            }

    }
}
