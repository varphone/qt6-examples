
project(widget-basic)

find_package(Qt6 6.2 CONFIG REQUIRED
     COMPONENTS
        Gui
        Widgets
)

qt_add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Qt::Widgets
)

install(TARGETS
    ${PROJECT_NAME}
)

# if(WIN32)
#     add_custom_command(TARGET ${PROJECT_NAME}
#         POST_BUILD
#             COMMAND ${CMAKE_COMMAND} --install ${CMAKE_BINARY_DIR} --prefix ${CMAKE_BINARY_DIR}
#     )
# endif()
