add_executable(
    mbgl-static
    ${CMAKE_CURRENT_LIST_DIR}/static.cpp
)

target_link_libraries(
    mbgl-static
    PRIVATE Mapbox::Base::Extras::args mbgl-compiler-options mbgl-core
)

install(TARGETS mbgl-static RUNTIME DESTINATION bin)
