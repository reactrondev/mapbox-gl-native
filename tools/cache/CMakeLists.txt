add_executable(
    mbgl-cache
    ${CMAKE_CURRENT_LIST_DIR}/cache.cpp
)

target_link_libraries(
    mbgl-cache
    PRIVATE
        Mapbox::Base::Extras::args
        Mapbox::Base::io
        mbgl-compiler-options
        mbgl-core
)

install(TARGETS mbgl-cache RUNTIME DESTINATION bin)
