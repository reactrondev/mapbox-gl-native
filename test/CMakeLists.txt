set(
    MBGL_UNIT_TEST_SOURCES
    $<$<PLATFORM_ID:Darwin>:${MBGL_ROOT}/platform/default/src/mbgl/test/main.cpp>
    $<$<PLATFORM_ID:Linux>:${MBGL_ROOT}/platform/default/src/mbgl/test/main.cpp>
    ${CMAKE_CURRENT_LIST_DIR}/actor/actor.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/actor/actor_ref.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/algorithm/update_renderables.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/algorithm/update_tile_masks.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/annotations.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/api_misuse.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/custom_geometry_source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/custom_layer.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/query.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/api/recycle_map.cpp
    ${CMAKE_CURRENT_LIST_DIR}/geometry/dem_data.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/geometry/line_atlas.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/gl/bucket.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/gl/context.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/gl/gl_functions.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/gl/object.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/map/map.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/map/prefetch.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/map/transform.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/math/clamp.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/math/minmax.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/math/wrap.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/programs/symbol_program.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/renderer/backend_scope.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/renderer/image_manager.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/renderer/pattern_atlas.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/sprite/sprite_loader.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/sprite/sprite_parser.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/test/fixture_log_observer.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/test/getrss.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/test/sqlite3_test_fs.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/test/stub_file_source.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/test/test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/mbgl/test/util.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/asset_file_source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/default_file_source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/headers.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/http_file_source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/local_file_source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/offline.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/offline_database.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/offline_download.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/online_file_source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/resource.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/storage/sqlite.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/conversion_impl.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/function.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/geojson_options.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/layer.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/light.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/property_value.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/stringify.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/conversion/tileset.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/expression/expression.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/expression/util.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/filter.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/properties.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/property_expression.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/source.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/style.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/style_image.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/style_layer.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/style/style_parser.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/bidi.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/calculate_tile_distances.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/cross_tile_symbol_index.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/formatted.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/get_anchors.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/glyph_manager.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/glyph_pbf.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/language_tag.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/local_glyph_rasterizer.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/quads.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/shaping.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/text/tagged_string.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/custom_geometry_tile.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/geojson_tile.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/geometry_tile_data.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/raster_dem_tile.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/raster_tile.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/tile_cache.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/tile_coordinate.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/tile_id.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/tile/vector_tile.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/async_task.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/dtoa.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/geo.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/grid_index.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/http_timeout.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/image.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/mapbox.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/memory.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/merge_lines.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/number_conversions.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/offscreen_texture.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/position.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/projection.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/run_loop.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/string.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/text_conversions.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/thread.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/thread_local.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/tile_cover.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/tile_range.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/timer.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/token.test.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/url.test.cpp
)

add_executable(
    mbgl-unit-test
    ${MBGL_UNIT_TEST_SOURCES}
)

set_property(TARGET mbgl-unit-test PROPERTY FOLDER Executables)

find_program(MBGL_TEST_NODEJS NAMES nodejs node)
find_program(MBGL_TEST_NPM NAMES npm)

if(WIN32 OR CMAKE_SYSTEM_NAME STREQUAL Android OR NOT MBGL_TEST_NODEJS OR NOT MBGL_TEST_NPM)
    message("Target platform does not support HTTP tests or dependencies not found.")

    set(MBGL_TEST_HAS_TEST_SERVER 0)
else()
    set(MBGL_TEST_HAS_TEST_SERVER 1)
endif()

if(NOT DEFINED ENV{CI})
    set(MBGL_TEST_BUILD_ON_CI 0)
else()
    set(MBGL_TEST_BUILD_ON_CI 1)
endif()

target_compile_definitions(
    mbgl-unit-test
    PRIVATE
        NODE_EXECUTABLE=${MBGL_TEST_NODEJS}
        TEST_HAS_SERVER=${MBGL_TEST_HAS_TEST_SERVER}
        CI_BUILD=${MBGL_TEST_BUILD_ON_CI}
        WORK_DIRECTORY=${MBGL_ROOT}
)

target_include_directories(
    mbgl-unit-test
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/include
        ${CMAKE_CURRENT_LIST_DIR}/src
        ${MBGL_ROOT}/include
        ${MBGL_ROOT}/platform/default/include
        ${MBGL_ROOT}/platform/gfx/gl/src
        ${MBGL_ROOT}/src
)

include(${PROJECT_SOURCE_DIR}/vendor/googletest.cmake)

# Needed for testing private classes
get_target_property(MBGL_CORE_PRIVATE_LIBRARIES mbgl-core LINK_LIBRARIES)

target_link_libraries(
    mbgl-unit-test
    PRIVATE
        ${MBGL_CORE_PRIVATE_LIBRARIES}
        Mapbox::Base::Extras::args
        Mapbox::Base::pixelmatch-cpp
        mbgl-compiler-options
        mbgl-core
        mbgl-vendor-googletest
        $<$<PLATFORM_ID:Android>:mbgl-core-android>
)

add_test(NAME mbgl-unit-test COMMAND mbgl-unit-test WORKING_DIRECTORY ${MBGL_ROOT})
