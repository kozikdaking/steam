import QtQuick
import QtQuick.Window
import QtQuick.Controls

ApplicationWindow {
    id:window
    width: 1900
    height: 1000
    visible: true
    title: qsTr("Steam")
    color: "#3A6D8C"
    //flags: Qt.FramelessWindowHint

    //------------------------------------------------TOP------------------------------------------------

    Rectangle {
        id: topBar
        width: parent.width
        height: parent.height * 0.080
        color: "#141c24"


//---------------------------------------------------------EXIT-------------------------------------------------------
        Row
        {           
            anchors.right: parent.right

            Button
            {
                id:minimizebutton
                height:30
                width:31


                Image
                {
                    id:mimimazeicon
                    width:parent.width
                    height:parent.height
                    source:minimizeMouse.containsMouse?"assets/minimizeanimated.png":"assets/minimize.png"
                }
                MouseArea
                {
                    id: minimizeMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked:
                    {
                       window.showMinimized()
                    }
                }

            }
//------------------------------------------------------------FULLSCREEN
            Button
            {
                id:maximize
                height:30
                width: 31

                Image
                {
                    id:maximizeimage
                    width:parent.width
                    height:parent.height
                    source:fullscreenMouse.containsMouse?"assets/maximizeanimated":"assets/maximize"
                }
                MouseArea
                {
                    id: fullscreenMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked:
                    {
                                if (window.visibility === Window.FullScreen)
                                {
                                    window.visibility = Window.Windowed;
                                }
                                else
                                {
                                    window.visibility = Window.FullScreen;
                                }
                    }
                }
            }

            Button
            {
                id: exitbutton
                height: 30
                width: 31

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
                        Qt.quit()
                    }
                }
            }

        }

        //---------------------------------------------------- OGLOSZENIA -------------------------------------------

        Row {
            anchors.right: parent.right
            anchors.rightMargin: 250
            anchors.margins: 60
            spacing: 10

            Button {
                id: notifications
                height: 25
                width: 50
                Image {
                    id: ogl
                    anchors.fill: parent
                    source: notificationsMouse.containsMouse?"assets/notificationsanimated.png":"assets/notifications.png"
                }
                MouseArea
                {
                    id:notificationsMouse
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked:
                    {
                        console.log("x")
                    }
                }
            }

            //--------------------------------------------------BELL--------------------------------------------------------------------------------
            Button {
                id: bell
                height: 25
                width: 50

                Image {
                    id: bellimage
                    source: bellMouse.containsMouse ? "assets/bellanimated.png" : "assets/bell.png"
                    anchors.fill: parent
                }

                MouseArea {
                    id: bellMouse
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        bellpopup.open()
                    }
                }

                Popup {
                    id: bellpopup
                    width: 320
                    height: 130
                    modal: true

                    Rectangle {
                        id: bellrect
                        width: parent.width
                        height: parent.height
                        color: "#3C4454"
                        border.color: "black"

                        Text
                        {
                            id:powtext
                            text:"Powiadomienia"
                            anchors.left: parent.left
                            anchors.top:parent.top
                            font.pointSize: 15
                            font.bold: true
                            color:"white"
                        }

                        Button
                        {
                            id:chceckallbutton
                            height:30
                            width:126
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.rightMargin: 10


                            Image
                            {
                                id:checkallImage


                                source:checkallMouse.containsMouse?"assets/checkall":"assets/checkallanimated"
                            }

                                MouseArea
                            {
                                id: checkallMouse
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true
                            }
                        }

                        Column {
                            anchors.fill: parent
                            anchors.bottom: parent.bottom
                            spacing: 0

                            ListView {
                                id: bellList
                                width: parent.width
                                height: 70
                                anchors.bottom: parent.bottom
                                spacing: 4

                                model: ListModel {
                                    ListElement { optionName: "Nowe zaproszenia do znajomych (1)" }
                                    ListElement { optionName: "Oczekujące oferty wymiany: 3" }
                                }

                                delegate: Item {
                                    width: parent.width
                                    height: 35

                                    Rectangle {
                                        id: bellrectList
                                        height: parent.height
                                        width: parent.width
                                        color: listMouse.containsMouse ? "#464E59" : "#454E59"
                                        border.color: "#3C4454"
                                        radius: 7
                                    }

                                    Text {
                                        id: bellText
                                        text: optionName
                                        color: "#D9D9D9"
                                        font.pointSize: 10
                                        anchors.left: parent.left
                                        anchors.leftMargin: 10
                                        anchors.verticalCenter: parent
                                        anchors.horizontalCenter: parent
                                    }

                                    MouseArea {
                                        id: listMouse
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }



            //---------------------------------------------------------PROFILE--------------------------------------------------------

            Button {
                id: profile
                width: 147
                height: 25
                Image {
                    id: profi
                    anchors.fill: parent
                    source: "assets/avatar.png"
                }
            }
        }
    }

    //---------------------------------------------------- IKONY
    Row {
        spacing: 10

        Button {
            id: steam
            text:"Steam"
            font.pointSize: 10
            background: null
            onClicked: settingsPopup.open()

            Popup {
                id: settingsPopup
                width: 210
                height: 140
                modal: true

                Rectangle {
                    id: backgroundRect
                    width: 210
                    height: 140
                    color: "#3C4454" // Set the background color here
                    border.color: "#3C4454"
                    anchors.top: steam.bottom

                    ListView {
                        id: settingsList
                        width: 210
                        height: 140

                        model: ListModel {
                            ListElement { optionName: "Zmień konto" }
                            ListElement { optionName: "Wyloguj się" }
                            ListElement { optionName: "Ustawienia" }
                            ListElement { optionName: "Wyjdź" }
                        }

                        delegate: Item {
                            width: parent.width
                            height: 35

                            Rectangle {
                                id: itemRect
                                width: parent.width
                                height: parent.height
                                color: mouseArea.containsMouse ? "white" : "#3C4454"
                                border.color: "#3C4454"
                            }

                            Text {
                                text: optionName
                                anchors.left: parent.left
                                anchors.verticalCenter: parent
                                anchors.leftMargin: 10
                                color: mouseArea.containsMouse ? "black" : "#D9D9D9" // Change text color to contrast with background
                            }

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    if (optionName == "Wyjdź") {
                                        Qt.quit()
                                    }


                                }
                            }
                        }
                    }
                }
            }
        }


        Button
        {
            id:wyswietl
            text:"Wyswietl"
            background: null
            font.pointSize: 10
            onClicked: wyswietlPopup.open()

            Popup
            {
                id:wyswietlPopup
                width:210
                height:140
                modal: true

                Rectangle
                {
                    id:wyswietlBackground
                    width:parent.width
                    height:parent.height
                    color:"#3C4454"
                    border.color: "#3C4454"
                    anchors.top:wyswietl.bottom
                }

                ListView
                {

                    id:wyswietlList
                    height:140
                    width:210

                    model: ListModel
                    {
                    ListElement{optionName:"Biblioteka"}
                    ListElement{optionName:"Ścieżki dzwiękowe"}
                    ListElement{optionName:"Pobieranie"}
                    ListElement{optionName:"Gracze"}
                    }

                    delegate: Item
                    {
                        width:parent.width
                        height:35

                        Rectangle
                        {
                            id:itemRectWyswietl
                            height:parent.height
                            width:parent.width
                            color: mouseAreaWyswietl.containsMouse ? "white" : "#3C4454"
                            border.color: "#3C4454"
                        }
                        Text
                        {
                            text:optionName
                            anchors.left: parent.left
                            anchors.verticalCenter: parent
                            anchors.leftMargin: 10
                            color: mouseAreaWyswietl.containsMouse? "black" : "#D9D9D9"
                        }

                    MouseArea
                    {
                        id:mouseAreaWyswietl
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape:Qt.PointingHandCursor

                        onClicked:
                        {
                            if(optionName=="Biblioteka")
                            {
                                Qt.quit()
                         }
                        }
                      }
                    }
                   }
                 }
               }

        //---------------------------------friends---------------------------------

        Button {
            id: friends
            text: "Znajomi"
            background: null
            font.pointSize: 10
            onClicked: friendspopup.open()

            Popup
            {
                id:friendspopup
                height:140
                width:210
               modal:true


            Rectangle
            {
                id:friendsRect
                width:parent.width
                height:parent.height
                color:"#3C4454"
                border.color: "#3C4454"
                anchors.top:friends.bottom
            }

            ListView
            {
                id:friendsListModel
                height:140
                width:210
               model:ListModel
               {
               ListElement {optionName:"Dodaj znajomego"}
                ListElement {optionName:"Online"}
                ListElement {optionName:"Zaraz wracam"}
                ListElement {optionName:"Offline"}
}
               delegate: Item
               {
                   width:parent.width
                   height:35

                 Rectangle
                 {
                     id:friendrectWys
                     height: parent.height
                     width:parent.width
                     color:friendsmousearea.containsMouse?"white" : "#3C4454"
                     border.color: "#3C4454"

                 }

                 Text {
                   id:friendsText
                    text:optionName
                   color:friendsmousearea.containsMouse?"black" : "#D9D9D9"
                   anchors.left: parent.left
                   anchors.verticalCenter: parent
                   anchors.leftMargin: 10

                 }

                 MouseArea
                 {
                     id:friendsmousearea
                     cursorShape: Qt.PointingHandCursor
                     anchors.fill: parent
                     hoverEnabled: true

                 }
               }
            }


          }
        }

        Button {
            id: games
            text: "Gry"
            font.pointSize: 10
            background: null

            onClicked:
            {
                gamesPopUp.open()
            }

            Popup
            {
                id:gamesPopUp
                height:70
                width:210
                modal:true

                Rectangle
                {
                    id:gamesrect
                    height:parent.height
                    width:parent.width
                    color:"#3C4454"
                    border.color: "#3C4454"
                    anchors.top: games.bottom
                }
                    ListView
                    {
                        id:gamesList
                        height:parent.height
                        width:parent.width
                        model: ListModel
                        {
                            ListElement{optionName:"Wyswietl Bibliotekę gier"}
                            ListElement{optionName:"Aktywuj produkt na steam"}
                        }
                        delegate: Item
                        {
                            width:parent.width
                            height:35
                            Rectangle
                            {
                                id:gamerectWyswietl
                                height:parent.height
                                width:parent.width
                                color:gamesMouseArea.containsMouse?"white":"#3C4454"
                                border.color: "#3C4454"
                            }
                            Text
                            {
                                id:gamerectText
                                text:optionName
                               // font.pointSize: 10
                                color:gamesMouseArea.containsMouse?"black" : "#D9D9D9"
                                anchors.left: parent.left
                                anchors.verticalCenter: parent
                                anchors.leftMargin: 10
                            }

                            MouseArea {
                                                id: gamesMouseArea
                                                cursorShape: Qt.PointingHandCursor
                                                anchors.fill: parent
                                                hoverEnabled: true

                                                onClicked: {
                                                    if (optionName == "Aktywuj produkt na steam") {
                                                            var component = Qt.createComponent("qrc:/qt/qml/steam/activeProduct.qml");
                                                            var window = component.createObject(root);
                                                            if (window) {
                                                                window.show();
                                                            } else {
                                                                console.log("Failed to create the window");
                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
        Button {
            id: help
            text: "Pomoc"
            font.pointSize: 10
            background: null

            onClicked:
            {
                helpPopUp.open()
            }

            Popup
            {
                id:helpPopUp
                height:140
                width:210
                modal:true

                Rectangle
                {
                    id:helprect
                    height:parent.height
                    width:parent.width
                    color:"#3C4454"
                    border.color: "#3C4454"

                    ListView
                    {
                        id:helpListView
                        height:parent.width
                        width:parent.width
                        model: ListModel
                        {
                            ListElement{optionName:"Pomoc techniczna Steam"}
                            ListElement{optionName:"Polityka prywatności"}
                            ListElement{optionName:"Informacje prawne"}
                            ListElement{optionName:"Informacje systemowe"}
                        }

                        delegate: Item
                        {
                            width:parent.width
                            height:35

                            Rectangle
                            {
                                id:helpItemRect
                                height: parent.height
                                width:parent.width
                                color:helpMouseArea.containsMouse?"white":"#3C4454"

                            }

                            Text
                            {
                                id:helpText
                                text:optionName
                                color:helpMouseArea.containsMouse?"black" : "#D9D9D9"
                                anchors.left: parent.left
                                anchors.verticalCenter: parent
                                anchors.leftMargin: 10

                            }

                            MouseArea
                            {
                               id:helpMouseArea
                               cursorShape: Qt.PointingHandCursor
                               anchors.fill: parent
                               hoverEnabled: true
                            }
                        }
                    }

                }
            }
        }
    }

    //------------------------------------------------EVENT------------------------------------------------



    Row
    {
        x:480
        y:120
        Button
        {
            id:twojsklep
            height:34
            width:twojsklepimage.width

            Image{

            id:twojsklepimage
            source:twojsklepArea.containsMouse?"assets/twojsklepanimated":"assets/twojsklep"

            }

            MouseArea
            {
               id:twojsklepArea
               cursorShape: Qt.PointingHandCursor
               anchors.fill: parent
               hoverEnabled: true
            }
        }
        Button
        {
            id:noweiwarteuwagi
            height:34
            width:noweiwarteimage.width

            Image{

            id:noweiwarteimage
            source:noweiwarteimageArea.containsMouse?"assets/noweiwarteanimated":"assets/noweiwarte"

            }

            MouseArea
            {
               id:noweiwarteimageArea
               cursorShape: Qt.PointingHandCursor
               anchors.fill: parent
               hoverEnabled: true
            }

        }
        Button
        {
            id:kategorie
            height:34
            width:kategorieimage.width

            Image{

            id:kategorieimage
            source:kategorieArea.containsMouse?"assets/kategorieanimated":"assets/kategorie"

            }

            MouseArea
            {
               id:kategorieArea
               cursorShape: Qt.PointingHandCursor
               anchors.fill: parent
               hoverEnabled: true
            }
        }

        Button
        {
            id:sklepPunktow
            height:34
            width:skleppunktowImage.width

            Image{

            id:skleppunktowImage
             source:skleppunktowArea.containsMouse?"assets/skleppunktowanimated":"assets/skleppunktow"

            }

            MouseArea
            {
               id:skleppunktowArea
               cursorShape: Qt.PointingHandCursor
               anchors.fill: parent
               hoverEnabled: true


            }
        }
        Button
        {
            id:aktualnosci
            height:34
            width:aktualnosciImage.width


            Image{

            id:aktualnosciImage
           source:aktualnosciArea.containsMouse?"assets/aktualnoscianimated":"assets/aktualnosci"

            }

            MouseArea
            {
               id:aktualnosciArea
               cursorShape: Qt.PointingHandCursor
               anchors.fill: parent
               hoverEnabled: true
               onClicked:
               {
                   var url="https://store.steampowered.com/points/shop/"
                   Qt.openUrlExternally(url);
               }
            }
        }
        Button
        {
            id:labolatoria
            height:34
            width:labImage.width

            Image{

            id:labImage
            source:labArea.containsMouse?"assets/labanimated":"assets/lab"

            }

            MouseArea
            {
               id:labArea
               cursorShape: Qt.PointingHandCursor
               anchors.fill: parent
               hoverEnabled: true
            }
        }

        Rectangle
        {
            id:emptyrect
            color:"#1F3140"
            height:34
            width:200

        }



        TextField
        {

            id:searchbar
            height:30
            width:300
            color:"white"
            font.pointSize: 10
            placeholderText:qsTr("szukaj")
            background:Rectangle
            {
            color:"gray"
            radius:7

            }
                Button
                {
                    id:lupabutton
                    height:30
                    width:30
                    anchors.right: parent.right

                    Image{
                    id:lupaimage
                    source:lupamouseArea.containsMouse?"assets/search":"assets/searchanimated"
                    height:30
                    width:30

                     }
                    MouseArea
                    {
                        id:lupamouseArea
                        anchors.fill: parent
                        hoverEnabled: true

                    }
                }
        }
    }

    Button
    {
        id:wishlist
        height:23
        width:120
x:1395
y:90


        Rectangle
        {
            color:"#1F3140"
            height:parent.height
            width:parent.width
            radius:2

            Text
            {
                id:wishlisttext
                text:"Lista życzeń"
                color:"white"
                anchors.centerIn: parent
            }
        }
    }

    //-------------------------------------------------------------------------------------------------
    Text {
  id:recomended
  text:"Wyróżnione i polecane"
  font.bold: true
  font.pointSize: 13
  anchors.bottom: view.top
  anchors.bottomMargin: 2
  anchors.left: parent.left
  anchors.leftMargin: 500
  color:"white"
       }

    //------------------------------------------------LOW MID------------------------------------------------

    Rectangle {
        id: lowmid
        color:"#1F3140"
        width: parent.width
        anchors.top: event.bottom
    }

    //-----------------------------------------------SWAP IMAGES
        ListView {
            id: view
            x:480
            y:550
              orientation: ListView.Horizontal
              boundsBehavior: Flickable.StopAtBounds

            model:ListModel
        {
            id:imageModel
            ListElement{source:"awayout.png"}
            ListElement{source:"baldur.png"}
        }
            property int currentIndex:0

            delegate:Item
            {
                height:940
                 width:350

            }

            Image
            {
                id:baldur
                source:"assets/baldur"
            }
            Image
            {
                id:awayout
                source:"assets/awayout"
            }
        }
//----------------------------------------------------LEFT SWIPE---------------------------------------------------
            Button {
                id: leftswipe
                height:100
                width:50
                x:430
                y:710
                background:null
Image
{
    id:leftSwipeImage
    source:leftswipemousearea.containsMouse?"assets/leftswipeanimation":"assets/leftswipe"
}
                onClicked: {
                    console.log("12")
                   if( view.currentIndex>0)
                    {
                        view.currentIndex-=1;
                       displayImage.source = imageModel.get(currentIndex).imageSource;

                    }
                }
                MouseArea
                {
                    id:leftswipemousearea
                    anchors.fill:parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                }
            }

//----------------------------------------------------RIGHT SWIPE---------------------------------------------------
            Button
            {
                id:rightswipe
                x:1420
                y:710
            Image
            {
                id:rightSwipeImage
                source:rightswipemousearea.containsMouse ? "assets/rightswipeanimation.png":"assets/rightswipe.png"
            }
                height:100
                width:50
                background:null
                onClicked:
                {
                    onClicked: {
                         console.log("52")
                                if (view.currentIndex < view.count - 1) {
                                    view.currentIndex += 1;
                                    displayImage.source = imageModel.get(currentIndex).imageSource;
                                }
                    }
                }
                MouseArea
                {
                    id:rightswipemousearea
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    hoverEnabled: true
                }
        }


    //------------------------------------------------BOTTOM------------------------------------------------

    Rectangle {
        id: bottomBar
        width: parent.width
        height: parent.height * 0.060
        color: "#141c24"
        anchors.bottom: parent.bottom

        Text {
            id: addGame
            text: " + Dodaj gre"
            color: "gray"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.leftMargin: 10
            font.pixelSize: 13
        }


        Button {
            id: friendList
            height:25
            width:100
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.rightMargin: 10

            background:Rectangle
            {
                color:"transparent"
                border.color:"transparent"
                height:parent.height
                width:parent.width
                anchors.fill: parent
            }
            Text
            {
                text: "Znajomi i czat +"
                font.pixelSize: 13
                color:"gray"
            }


            onClicked: {
                var friendsWindow=Qt.createComponent("friendsWindow.qml").createObject(null);
                if(friendsWindow!==null)
                {
                    friendsWindow.show();
                }
                else
                {
                    console.log("failed to load secondary window")
                }
            }
        }

    }
}
