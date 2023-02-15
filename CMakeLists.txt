cmake_minimum_required(VERSION 3.18)

cmake_policy(SET CMP0091 NEW)

project(qt6-examples
    VERSION 1.0.0
    LANGUAGES CXX
)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

set(CMAKE_VERBOSE_MAKEFILE ON)

include(GNUInstallDirs)

find_package(Qt6 6.2 CONFIG REQUIRED COMPONENTS Gui Widgets Svg Quick QuickControls2 ChartsQml VirtualKeyboard)
# find_package(Qt6Widgets CONFIG REQUIRED)
# find_package(Qt6Quick CONFIG REQUIRED)
# find_package(Qt6Qml CONFIG REQUIRED)
# find_package(Qt6QuickControls2 CONFIG REQUIRED)
# find_package(Qt6QuickControls2Impl CONFIG REQUIRED)
# find_package(Qt6QuickLayouts CONFIG REQUIRED)
# find_package(Qt6 CONFIG REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)
# find_package(QmlPlugins CONFIG REQUIRED)

add_subdirectory(src)
add_subdirectory(examples)

# # 安装目标文件
# install(TARGETS ${PROJECT_NAME})

# # 调试运行配置
# if(WIN32)
#     add_custom_command(TARGET ${PROJECT_NAME}
#         POST_BUILD
#             COMMAND ${CMAKE_COMMAND} --install ${CMAKE_BINARY_DIR} --prefix ${CMAKE_BINARY_DIR}
#     )
# endif()
