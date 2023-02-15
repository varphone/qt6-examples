project(qml-vkb)

find_package(Qt6 6.2 CONFIG REQUIRED
     COMPONENTS
        Gui
        Widgets
        Svg
        Quick
        QuickControls2
        ChartsQml
        VirtualKeyboard
)

qt_add_executable(${PROJECT_NAME}
    main.cpp
)

qt_add_qml_module(${PROJECT_NAME}
    URI examples
    VERSION 1.0
    QML_FILES
        main.qml
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Qt::Gui
        Qt::Quick
        Qt::QuickControls2
        Qt::QuickControls2Impl
        Qt::QuickLayouts
        Qt::ChartsQml
        Qt::VirtualKeyboard
        Qt::BundledPinyin
        Qt::Svg
)

if(QT_FEATURE_static)
    target_link_libraries(${PROJECT_NAME}
        PRIVATE
            Qt::Svg
    )
    qt_import_plugins(${PROJECT_NAME}
        INCLUDE Qt::QVirtualKeyboardPlugin
    )
endif()

install(TARGETS
    ${PROJECT_NAME}
)

if(WIN32)
    add_custom_command(TARGET ${PROJECT_NAME}
        POST_BUILD
            COMMAND ${CMAKE_COMMAND} --install ${CMAKE_BINARY_DIR} --prefix ${CMAKE_BINARY_DIR}
    )
endif()
