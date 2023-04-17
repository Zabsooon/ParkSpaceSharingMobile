cmake_minimum_required(VERSION 3.16)

project(ParkSpaceSharingMobile VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

set(PROJECT_SOURCES
    src/main.cpp
    src/login.cpp
)

set(PROJECT_HEADERS
    include/login.h
)

qt_add_executable(appParkSpaceSharingMobile
    ${PROJECT_SOURCES}
    ${PROJECT_HEADERS}
)

qt_add_qml_module(appParkSpaceSharingMobile
    URI ParkSpaceSharingMobile
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appParkSpaceSharingMobile PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appParkSpaceSharingMobile
    PRIVATE Qt6::Quick)

install(TARGETS appParkSpaceSharingMobile
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
