#!/bin/bash

#
# to be run by CI from the build folder
#
cp ../RenderTestApp_iphoneos13.2-arm64e.xctestrun .

codesign --force --sign $CODESIGNIDENTITY --entitlements ../codesigning/RenderTestApp.app.xcent --timestamp=none ./Debug-iphoneos/RenderTestApp.app
codesign --force --sign $CODESIGNIDENTITY --deep --preserve-metadata=identifier,entitlements,flags --timestamp=none ./Debug-iphoneos/RenderTestApp.app/PlugIns/RenderTestAppTests-Runner.app/Frameworks/libXCTestSwiftSupport.dylib
codesign --force --sign $CODESIGNIDENTITY --deep --preserve-metadata=identifier,entitlements,flags --timestamp=none ./Debug-iphoneos/RenderTestApp.app/PlugIns/RenderTestAppTests-Runner.app/Frameworks/XCTAutomationSupport.framework
codesign --force --sign $CODESIGNIDENTITY --deep --preserve-metadata=identifier,entitlements,flags --timestamp=none ./Debug-iphoneos/RenderTestApp.app/PlugIns/RenderTestAppTests-Runner.app/Frameworks/XCTest.framework
codesign --force --sign $CODESIGNIDENTITY --deep --entitlements ../codesigning/RenderTestAppTests.xctest.xcent --timestamp=none ./Debug-iphoneos/RenderTestApp.app/PlugIns/RenderTestAppTests-Runner.app/PlugIns/RenderTestAppTests.xctest
codesign --force --sign $CODESIGNIDENTITY --deep --entitlements ../codesigning/RenderTestAppTests.xctest.xcent --timestamp=none ./Debug-iphoneos/RenderTestApp.app/PlugIns/RenderTestAppTests-Runner.app
