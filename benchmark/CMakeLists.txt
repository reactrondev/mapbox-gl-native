set(
    MBGL_BENCHMARK_SOURCES
    $<$<PLATFORM_ID:Darwin>:${MBGL_ROOT}/platform/default/src/mbgl/benchmark/main.cpp>
    $<$<PLATFORM_ID:Linux>:${MBGL_ROOT}/platform/default/src/mbgl/benchmark/main.cpp>
    ${CMAKE_CURRENT_LIST_DIR}/api/query.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/render.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/function/camera_function.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/function/composite_function.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/function/source_function.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/parse/filter.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/parse/tile_mask.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/parse/vector_tile.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/benchmark/benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/offline_database.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/dtoa.benchmark.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/tilecover.benchmark.cpp
)

add_executable(
    mbgl-benchmark
    ${MBGL_BENCHMARK_SOURCES}
)

set_property(TARGET mbgl-benchmark PROPERTY FOLDER Executables)

target_include_directories(
    mbgl-benchmark
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/include
        ${CMAKE_CURRENT_LIST_DIR}/src
        ${MBGL_ROOT}/include
        ${MBGL_ROOT}/platform/default/include
        ${MBGL_ROOT}/src
)

include(${PROJECT_SOURCE_DIR}/vendor/benchmark.cmake)

# Needed for testing private classes
get_target_property(MBGL_CORE_PRIVATE_LIBRARIES mbgl-core LINK_LIBRARIES)

target_link_libraries(
    mbgl-benchmark
    PRIVATE
        ${MBGL_CORE_PRIVATE_LIBRARIES}
        mbgl-vendor-benchmark
        mbgl-compiler-options
        mbgl-core
)

add_test(NAME mbgl-benchmark COMMAND mbgl-benchmark WORKING_DIRECTORY ${MBGL_ROOT})
