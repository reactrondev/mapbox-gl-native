#!/bin/bash
mkdir ../../test-data
mkdir ../../test-data/integration
mkdir ../../test-data/expected
mkdir ../../test-data/ignores
mkdir ../../test-data/vendor
mkdir ../../test-data/vendor/mapbox-gl-styles

cp -r ../../mapbox-gl-js/test/integration/ ../../test-data/integration
cp -r ../../render-test/expected/ ../../test-data/expected
cp -r ../../render-test/ignores/ ../../test-data/ignores
cp -r ../../vendor/mapbox-gl-styles/ ../../test-data/vendor/mapbox-gl-styles
cp ../../platform/node/test/ignores.json ../../test-data/ignores.json
cp ../../render-test/ios-manifest.json ../../test-data/ios-manifest.json
cp ../../render-test/mac-ignores.json ../../test-data/mac-ignores.json

# cmake ../../next -B ../../osBuild -G Xcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_SYSTEM_PROCESSOR=arm  -DCMAKE_OSX_SYSROOT=iphoneos
# cmake ../../next -B ../../simBuild -G Xcode  -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_OSX_SYSROOT=iphonesimulator 
cmake ../../next -B ../../Build -G Xcode  -DCMAKE_SYSTEM_NAME=iOS