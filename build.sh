#!/bin/sh

echo "`awk -F '=' '/BUILD_VERSION/{$2=$2+1}1' OFS='=' .build-config`"  > .build-config
source .build-config
USER_AGENT="YaMusic for macOS Version ${APP_VERSION} (build ${BUILD_VERSION} / Nativefier ${NATIVEFIER_VERSION}) https://github.com/ofstudio/yandex-music-for-macos-nativefier"
echo "Building ${USER_AGENT}"

rm -rf ./build

docker run  \
  --rm \
  -v `pwd`/build:/build \
  -v `pwd`/src:/src \
  jiahaog/nativefier \
  -p mac \
  --app-version "${APP_VERSION}" \
  --build-version "${BUILD_VERSION}" \
  --app-copyright "${APP_COPYRIGHT}" \
  --user-agent "${USER_AGENT}" \
  --browserwindow-options '{ "fullscreenable": "true", "titleBarStyle": "hiddenInset", "transparent": true }' \
  --icon /src/icon.icns \
  --inject /src/inject.js \
  --inject /src/inject.css \
  --fast-quit \
  --internal-urls 'music\.yandex\.ru' \
  --name YaMusic \
  https://music.yandex.ru/ /build
