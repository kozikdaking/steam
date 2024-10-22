cmake_minimum_required(VERSION 3.16)

project(steam VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appsteam
    main.cpp
    topBar.qml
)

qt_add_qml_module(appsteam
    URI steam
    VERSION 1.0
    QML_FILES
        Main.qml
        topBar.qml
        eventBar.qml
        midBar.qml
        bottomBar.qml
        activateProduct.qml
    RESOURCES
        assets/left.png
        assets/right.png
        assets/mid.png
        assets/lowmid.png
        assets/bell.png
        assets/notifications.png
        assets/avatar.png
        assets/awayout.png
        assets/baldur.png
        RESOURCES assets/lowmid2.png
        RESOURCES assets/leftswipe.png assets/rightswipe.png
        RESOURCES assets/leftswipeanimation.png assets/rightswipeanimation.png
        RESOURCES assets/bellanimated.png assets/notificationsanimated.png
        RESOURCES assets/exit.png
        RESOURCES assets/exitanimation.png
        RESOURCES assets/minimize.png assets/minimizeanimated.png
        RESOURCES assets/maximize.png assets/maximizeanimated.png
        RESOURCES assets/checkall.png assets/checkallanimated.png
        RESOURCES assets/search.png assets/searchanimated.png
        RESOURCES assets/twojsklep.png assets/twojsklepanimated.png
        RESOURCES assets/kategorie.png assets/kategorieanimated.png assets/noweiwarte.png assets/noweiwarteanimated.png
        RESOURCES assets/aktualnosci.png assets/aktualnoscianimated.png
        RESOURCES assets/lab.png assets/labanimated.png
        QML_FILES friendsWindow.qml
        RESOURCES assets/friendlist.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsteam PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsteam
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appsteam
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
