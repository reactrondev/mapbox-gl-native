find_package(OpenGL REQUIRED)
find_package(PkgConfig REQUIRED)

pkg_search_module(GLFW glfw3 REQUIRED)

add_executable(
    mbgl-map-shell
    ${CMAKE_CURRENT_LIST_DIR}/main.cpp
    ${CMAKE_CURRENT_LIST_DIR}/glfw_view.cpp
    ${CMAKE_CURRENT_LIST_DIR}/glfw_gl_backend.cpp
    ${CMAKE_CURRENT_LIST_DIR}/glfw_renderer_frontend.cpp
    ${CMAKE_CURRENT_LIST_DIR}/settings_json.cpp
    ${CMAKE_CURRENT_LIST_DIR}/test_writer.cpp
)

target_include_directories(
    mbgl-map-shell
    PRIVATE ${GLFW_INCLUDE_DIRS}
)

include(${PROJECT_SOURCE_DIR}/vendor/cheap-ruler-cpp.cmake)

# Use target_link_directories when we move away from CMake 3.10.
target_link_libraries(
    mbgl-map-shell
    PRIVATE $<$<BOOL:${GLFW_LIBRARY_DIRS}>:-L${GLFW_LIBRARY_DIRS}>
)

target_link_libraries(
    mbgl-map-shell
    PRIVATE
        ${GLFW_LIBRARIES}
        Mapbox::Base::Extras::args
        Mapbox::Base::Extras::filesystem
        Mapbox::Base::Extras::rapidjson
        Mapbox::Map
        OpenGL::GL
        mbgl-compiler-options
        mbgl-vendor-cheap-ruler-cpp
)

set_property(TARGET mbgl-map-shell PROPERTY FOLDER Executables)

install(TARGETS mbgl-map-shell RUNTIME DESTINATION bin)
