set(
    MBGL_RENDER_TEST_SOURCES
    $<$<PLATFORM_ID:Darwin>:${MBGL_ROOT}/platform/default/src/mbgl/render-test/main.cpp>
    $<$<PLATFORM_ID:Linux>:${MBGL_ROOT}/platform/default/src/mbgl/render-test/main.cpp>
    ${CMAKE_CURRENT_LIST_DIR}/allocation_index.cpp
    ${CMAKE_CURRENT_LIST_DIR}/allocation_index.hpp
    ${CMAKE_CURRENT_LIST_DIR}/file_source.cpp
    ${CMAKE_CURRENT_LIST_DIR}/file_source.hpp
    ${CMAKE_CURRENT_LIST_DIR}/filesystem.hpp
    ${CMAKE_CURRENT_LIST_DIR}/include/mbgl/render_test.hpp
    ${CMAKE_CURRENT_LIST_DIR}/manifest_parser.cpp
    ${CMAKE_CURRENT_LIST_DIR}/manifest_parser.hpp
    ${CMAKE_CURRENT_LIST_DIR}/metadata.hpp
    ${CMAKE_CURRENT_LIST_DIR}/parser.cpp
    ${CMAKE_CURRENT_LIST_DIR}/parser.hpp
    ${CMAKE_CURRENT_LIST_DIR}/render_test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/runner.cpp
    ${CMAKE_CURRENT_LIST_DIR}/runner.hpp
    ${MBGL_ROOT}/tools/expression-test/test_runner_common.cpp
    ${MBGL_ROOT}/tools/expression-test/test_runner_common.hpp
)

add_executable(
    mbgl-render-test
    ${MBGL_RENDER_TEST_SOURCES}
)

install(TARGETS mbgl-render-test RUNTIME DESTINATION bin)
set_property(TARGET mbgl-render-test PROPERTY FOLDER Executables)

target_include_directories(
    mbgl-render-test
    PRIVATE ${MBGL_ROOT}/src ${MBGL_ROOT}/platform/default/include
)

target_include_directories(
    mbgl-render-test
    PUBLIC ${CMAKE_CURRENT_LIST_DIR}/include ${MBGL_ROOT}/include
)

include(${PROJECT_SOURCE_DIR}/vendor/boost.cmake)

target_link_libraries(
    mbgl-render-test
    PRIVATE
        Mapbox::Base::Extras::args
        Mapbox::Base::Extras::filesystem
        Mapbox::Base::pixelmatch-cpp
        mbgl-compiler-options
        mbgl-core
        mbgl-vendor-boost
)
