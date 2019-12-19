target_compile_definitions(
    mbgl-core
    PUBLIC MBGL_USE_GLES2 GLES_SILENCE_DEPRECATION
)

if(NOT DEFINED IOS_DEPLOYMENT_TARGET)
    set(IOS_DEPLOYMENT_TARGET "9.0")
endif()

set(CMAKE_OSX_ARCHITECTURES "armv7;arm64;i386;x86_64")

macro(initialize_ios_target target)
    set_target_properties(
        ${target}
        PROPERTIES
            XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET
            "${IOS_DEPLOYMENT_TARGET}"
            XCODE_ATTRIBUTE_ENABLE_BITCODE
            YES
            XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC
            YES
            XCODE_ATTRIBUTE_BITCODE_GENERATION_MODE
            bitcode
            XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH
            $<$<CONFIG:Debug>:YES>
    )
endmacro()

# set_target_properties(mbgl-core PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES)

target_sources(
    mbgl-core
    PRIVATE
        ${MBGL_ROOT}/platform/darwin/src/async_task.cpp
        ${MBGL_ROOT}/platform/darwin/src/collator.mm
        ${MBGL_ROOT}/platform/darwin/src/gl_functions.cpp
        ${MBGL_ROOT}/platform/darwin/src/headless_backend_eagl.mm
        ${MBGL_ROOT}/platform/darwin/src/native_apple_interface.m
        ${MBGL_ROOT}/platform/darwin/src/http_file_source.mm
        ${MBGL_ROOT}/platform/darwin/src/native_apple_interface.m
        ${MBGL_ROOT}/platform/darwin/src/image.mm
        ${MBGL_ROOT}/platform/darwin/src/local_glyph_rasterizer.mm
        ${MBGL_ROOT}/platform/darwin/src/logging_nslog.mm
        ${MBGL_ROOT}/platform/darwin/src/nsthread.mm
        ${MBGL_ROOT}/platform/darwin/src/number_format.mm
        ${MBGL_ROOT}/platform/darwin/src/reachability.m
        ${MBGL_ROOT}/platform/darwin/src/run_loop.cpp
        ${MBGL_ROOT}/platform/darwin/src/string_nsstring.mm
        ${MBGL_ROOT}/platform/darwin/src/timer.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/gfx/headless_backend.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/gfx/headless_frontend.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/gl/headless_backend.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/map/map_snapshotter.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/asset_file_source.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/default_file_source.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/file_source.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/file_source_request.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/local_file_request.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/local_file_source.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/offline.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/offline_database.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/offline_download.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/online_file_source.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/storage/sqlite3.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/text/bidi.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/util/compression.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/util/monotonic_timer.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/util/png_writer.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/util/thread_local.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/util/utf.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/util/thread_local.cpp
        ${MBGL_ROOT}/platform/default/src/mbgl/layermanager/layer_manager.cpp
)

target_include_directories(
    mbgl-core
    PRIVATE ${MBGL_ROOT}/platform/darwin/include ${MBGL_ROOT}/platform/default/include
)

include(${PROJECT_SOURCE_DIR}/vendor/icu.cmake)

initialize_ios_target(mbgl-core)
initialize_ios_target(mbgl-vendor-icu)

target_link_libraries(
    mbgl-core
    PRIVATE
        "-framework CoreGraphics"
        "-framework CoreImage"
        "-framework CoreLocation"
        "-framework CoreServices"
        "-framework CoreText"
        "-framework Foundation"
        "-framework GLKit"
        "-framework ImageIO"
        "-framework OpenGLES"
        "-framework QuartzCore"
        "-framework Security"
        "-framework SystemConfiguration"
        "-framework UIKit"
        "-framework WebKit"
        mbgl-vendor-icu
        sqlite3
        z
)

# <== Set to your project name, e.g. project.xcodeproj
set(DEVELOPMENT_TEAM_ID "Mapbox, Inc")                       # <== Set to your team ID from Apple
set(APP_NAME "RenderTestAPP")                                     # <== Set To your app's name
set(APP_BUNDLE_IDENTIFIER "com.mapbox.render_test")                # <== Set to your app's bundle identifier
set(FRAMEWORK_NAME "TestRunner")                                # <== Set to your framework's name
set(FRAMEWORK_BUNDLE_IDENTIFIER "com.mapbox.framework")    # <== Set to your framework's bundle identifier (cannot be the same as app bundle identifier)
set(TEST_NAME "AppTest")                                      # <== Set to your test's name
set(TEST_BUNDLE_IDENTIFIER "com.mapbox.app_test")             # <== Set to your tests's bundle ID
set(CODE_SIGN_IDENTITY "iPhone Developer")                  # <== Set to your preferred code sign identity, to see list:
                                                            # /usr/bin/env xcrun security find-identity -v -p codesigning
set(DEPLOYMENT_TARGET 8.0)                                  # <== Set your deployment target version of iOS
set(DEVICE_FAMILY "1")                                      # <== Set to "1" to target iPhone, set to "2" to target iPad, set to "1,2" to target both
set(LOGIC_ONLY_TESTS 0)                                     # <== Set to 1 if you do not want tests to be hosted by the application, speeds up pure logic tests but you can not run them on real devices

include(BundleUtilities)
include(FindXCTest)

message(STATUS XCTestFound:${XCTest_FOUND})

set(PRODUCT_NAME ${APP_NAME})
set(EXECUTABLE_NAME ${APP_NAME})
set(MACOSX_BUNDLE_EXECUTABLE_NAME ${APP_NAME})
set(MACOSX_BUNDLE_INFO_STRING ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_BUNDLE_NAME ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_ICON_FILE "")
set(MACOSX_BUNDLE_LONG_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_BUNDLE_VERSION "1.0")
set(MACOSX_BUNDLE_COPYRIGHT "Copyright YOU")
set(MACOSX_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET})

set(RESOURCES ${MBGL_ROOT}/render-test/ios/Main.storyboard ${MBGL_ROOT}/render-test/ios/LaunchScreen.storyboard ${MBGL_ROOT}/test-data)

add_executable(
    RenderTestAPP
    ${MBGL_ROOT}/render-test/ios/AppDelegate.h
    ${MBGL_ROOT}/render-test/ios/AppDelegate.m
    ${MBGL_ROOT}/render-test/ios/ViewController.h
    ${MBGL_ROOT}/render-test/ios/ViewController.m
    ${MBGL_ROOT}/render-test/ios/iosTestRunner.h
    ${MBGL_ROOT}/render-test/ios/iosTestRunner.mm
    # ${MBGL_ROOT}/render-test/ios/ios_test_runner.cpp
    # ${MBGL_ROOT}/render-test/ios/ios_test_runner.hpp
    ${MBGL_ROOT}/render-test/ios/main.m
    ${RESOURCES}
)
initialize_ios_target(RenderTestAPP)

# Build the C++ dynamically linked framework
add_library(TestRunner SHARED 
    ${MBGL_ROOT}/render-test/ios/ios_test_runner.cpp
    ${MBGL_ROOT}/render-test/ios/ios_test_runner.hpp
)

initialize_ios_target(TestRunner)
# set_target_properties(TestRunner PROPERTIES
#     FRAMEWORK TRUE
#     MACOSX_FRAMEWORK_IDENTIFIER com.mapbox.test_runner
#     MACOSX_FRAMEWORK_INFO_PLIST ${MBGL_ROOT}/render-test/ios/framework/Info.plist
#     PUBLIC_HEADER "${MBGL_ROOT}/render-test/ios/ios_test_runner.hpp"
# )

set_target_properties(${FRAMEWORK_NAME} PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION A
    MACOSX_FRAMEWORK_IDENTIFIER ${FRAMEWORK_BUNDLE_IDENTIFIER}
    MACOSX_FRAMEWORK_INFO_PLIST ${MBGL_ROOT}/render-test/ios/framework/Info.plist
    # "current version" in semantic format in Mach-O binary file
    VERSION 1.0.0
    # "compatibility version" in semantic format in Mach-O binary file
    SOVERSION 1.0.0
    PUBLIC_HEADER "${MBGL_ROOT}/render-test/ios/ios_test_runner.hpp"
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET}
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CODE_SIGN_IDENTITY}
    XCODE_ATTRIBUTE_DEVELOPMENT_TEAM ${DEVELOPMENT_TEAM_ID}
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${DEVICE_FAMILY}
    XCODE_ATTRIBUTE_SKIP_INSTALL "YES"
)

# add_custom_command(
#     TARGET ${FRAMEWORK_NAME}
#     POST_BUILD
#     COMMAND /bin/bash -c " ${MBGL_ROOT}/render-test/ios/framework/install_name.sh \${BUILT_PRODUCTS_DIR}/\${PRODUCT_NAME}.framework/\${PRODUCT_NAME}"
# )

# add_custom_command(
#     TARGET ${FRAMEWORK_NAME}
#     POST_BUILD
#     COMMAND install_name_tool -id \"@rpath/\${PRODUCT_NAME}.framework/\${PRODUCT_NAME}\"
#     \${BUILT_PRODUCTS_DIR}/\${PRODUCT_NAME}.framework/\${PRODUCT_NAME}
# )

target_include_directories(
    TestRunner
    PUBLIC {MBGL_ROOT}/render-test/include ${MBGL_ROOT}/include
)

target_link_libraries(
    TestRunner
    PUBLIC
        mbgl-render-test
)

add_dependencies(${APP_NAME} ${FRAMEWORK_NAME})

# Build tests
enable_testing()
find_package(XCTest REQUIRED)

set(TEST_SOURCE ${MBGL_ROOT}/render-test/ios/tests/Tests.m)

xctest_add_bundle(AppTest RenderTestAPP ${TEST_SOURCE})
xctest_add_test(${TEST_BUNDLE_IDENTIFIER} ${TEST_NAME})

target_include_directories(
    AppTest
    PUBLIC ${MBGL_ROOT}/render-test/ios
)

# set_target_properties(AppTest PROPERTIES
#                       XCODE_ATTRIBUTE_OTHER_LDFLAGS "${XCODE_ATTRIBUTE_OTHER_LDFLAGS} -framework ${FRAMEWORK_NAME}"
# )

set_target_properties(${TEST_NAME} PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST ${MBGL_ROOT}/render-test/ios/tests/tests.plist.in
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET}
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CODE_SIGN_IDENTITY}
    XCODE_ATTRIBUTE_DEVELOPMENT_TEAM ${DEVELOPMENT_TEAM_ID}
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${DEVICE_FAMILY}
    XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "\$(inherited)"
)

set_target_properties(${TEST_NAME} PROPERTIES
    XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "\$(inherited)"
)

# Locate system libraries on iOS
find_library(UIKIT UIKit)
find_library(FOUNDATION Foundation)
find_library(MOBILECORESERVICES MobileCoreServices)
find_library(CFNETWORK CFNetwork)
find_library(SYSTEMCONFIGURATION SystemConfiguration)

# link the frameworks located above
target_link_libraries(${APP_NAME} ${UIKIT})
target_link_libraries(${APP_NAME} ${FOUNDATION})
target_link_libraries(${APP_NAME} ${MOBILECORESERVICES})
target_link_libraries(${APP_NAME} ${CFNETWORK})
target_link_libraries(${APP_NAME} ${SYSTEMCONFIGURATION})

# Link the framework to the app
set_target_properties(${APP_NAME} PROPERTIES
                      XCODE_ATTRIBUTE_OTHER_LDFLAGS "${XCODE_ATTRIBUTE_OTHER_LDFLAGS} -framework ${FRAMEWORK_NAME}"
)

target_link_libraries(
    ${APP_NAME} 
        "-framework CoreLocation"
        "-framework OpenGLES"
        "-framework QuartzCore"
)
# Turn on ARC
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-arc")

# Create the app target
set_target_properties(${APP_NAME} PROPERTIES
                      XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "dwarf-with-dsym"
                    #   XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/Prefix.pch"
                      RESOURCE "${RESOURCES}"
                      XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES"
                      XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET}
                      XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CODE_SIGN_IDENTITY}
                      XCODE_ATTRIBUTE_DEVELOPMENT_TEAM ${DEVELOPMENT_TEAM_ID}
                      XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${DEVICE_FAMILY}
                      MACOSX_BUNDLE_INFO_PLIST ${MBGL_ROOT}/render-test/ios/Info.plist
                      XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
                      XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES NO
                      XCODE_ATTRIBUTE_INSTALL_PATH "$(LOCAL_APPS_DIR)"
                      XCODE_ATTRIBUTE_ENABLE_TESTABILITY YES
                      XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
)

# Include framework headers, needed to make "Build" Xcode action work.
# "Archive" works fine just relying on default search paths as it has different
# build product output directory.
target_include_directories(${APP_NAME} PUBLIC 
    "${PROJECT_BINARY_DIR}/\${CONFIGURATION}\${EFFECTIVE_PLATFORM_NAME}/${FRAMEWORK_NAME}.framework"
)

# Set the app's linker search path to the default location on iOS
set_target_properties(
    ${APP_NAME}
    PROPERTIES
    XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS
    "@executable_path/Frameworks"
)

# Note that commands below are indented just for readability. They will endup as
# one liners after processing and unescaped ; will disappear so \; are needed.
# First condition in each command is for normal build, second for archive.
# \&\>/dev/null makes sure that failure of one command and success of other
# is not printed and does not make Xcode complain that /bin/sh failed and build
# continued.

# Create Frameworks directory in app bundle
add_custom_command(
    TARGET
    ${APP_NAME}
    POST_BUILD COMMAND /bin/sh -c
    \"COMMAND_DONE=0 \;
    if ${CMAKE_COMMAND} -E make_directory
        ${PROJECT_BINARY_DIR}/\${CONFIGURATION}\${EFFECTIVE_PLATFORM_NAME}/${APP_NAME}.app/Frameworks
        \&\>/dev/null \; then
        COMMAND_DONE=1 \;
    fi \;
    if ${CMAKE_COMMAND} -E make_directory
        \${BUILT_PRODUCTS_DIR}/${APP_NAME}.app/Frameworks
        \&\>/dev/null \; then
        COMMAND_DONE=1 \;
    fi \;
    if [ \\$$COMMAND_DONE -eq 0 ] \; then
        echo Failed to create Frameworks directory in app bundle \;
        exit 1 \;
    fi\"
)

# Copy the framework into the app bundle
add_custom_command(
    TARGET
    ${APP_NAME}
    POST_BUILD COMMAND /bin/sh -c
    \"COMMAND_DONE=0 \;
    # if ${CMAKE_COMMAND} -E copy_directory
    #     ${PROJECT_BINARY_DIR}/\${CONFIGURATION}\${EFFECTIVE_PLATFORM_NAME}/
    #     ${PROJECT_BINARY_DIR}/\${CONFIGURATION}\${EFFECTIVE_PLATFORM_NAME}/${APP_NAME}.app/Frameworks
    #     \&\>/dev/null \; then
    #     COMMAND_DONE=1 \;
    # fi \;
    if ${CMAKE_COMMAND} -E copy_directory
        \${BUILT_PRODUCTS_DIR}/${FRAMEWORK_NAME}.framework
        \${BUILT_PRODUCTS_DIR}/${APP_NAME}.app/Frameworks/${FRAMEWORK_NAME}.framework
        \&\>/dev/null \; then
        COMMAND_DONE=1 \;
    fi \;
    if [ \\$$COMMAND_DONE -eq 0 ] \; then
        echo Failed to copy the framework into the app bundle \;
        exit 1 \;
    fi\"
)

# Codesign the framework in it's new spot
# add_custom_command(
#     TARGET
#     ${APP_NAME}
#     POST_BUILD COMMAND /bin/sh -c
#     \"COMMAND_DONE=0 \;
#     if codesign --force --verbose
#         ${PROJECT_BINARY_DIR}/\${CONFIGURATION}\${EFFECTIVE_PLATFORM_NAME}/${APP_NAME}.app/Frameworks/${FRAMEWORK_NAME}.framework
#         --sign ${CODE_SIGN_IDENTITY}
#         \&\>/dev/null \; then
#         COMMAND_DONE=1 \;
#     fi \;
#     if codesign --force --verbose
#         \${BUILT_PRODUCTS_DIR}/${APP_NAME}.app/Frameworks/${FRAMEWORK_NAME}.framework
#         --sign ${CODE_SIGN_IDENTITY}
#         \&\>/dev/null \; then
#         COMMAND_DONE=1 \;
#     fi \;
#     if [ \\$$COMMAND_DONE -eq 0 ] \; then
#         echo Framework codesign failed \;
#         exit 1 \;
#     fi\"
# )

# Add a "PlugIns" folder as a kludge fix for how the XcTest package generates paths 
# add_custom_command(
#     TARGET
#     ${APP_NAME}
#     POST_BUILD COMMAND /bin/sh -c
#     \"COMMAND_DONE=0 \;
#     if ${CMAKE_COMMAND} -E make_directory
#         ${PROJECT_BINARY_DIR}/\${CONFIGURATION}\${EFFECTIVE_PLATFORM_NAME}/PlugIns
#         \&\>/dev/null \; then
#         COMMAND_DONE=1 \;
#     fi \;
#     if [ \\$$COMMAND_DONE -eq 0 ] \; then
#         echo Failed to create PlugIns directory in EFFECTIVE_PLATFORM_NAME folder. \;
#         exit 1 \;
#     fi\"
# ) dxveērt iobv7ie34 53-w9e5







unset(IOS_DEPLOYMENT_TARGET CACHE)
