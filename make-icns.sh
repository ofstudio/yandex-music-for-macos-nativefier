 #!/bin/sh

mkdir ./src/icon.iconset
# icon.png should be 1024px
cp ./src/icon.png  ./src/icon.iconset/
# resize all the images
sips -z 16 16     ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_16x16.png
sips -z 32 32     ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_16x16@2x.png
sips -z 32 32     ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_32x32.png
sips -z 64 64     ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_32x32@2x.png
sips -z 128 128   ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_128x128.png
sips -z 256 256   ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_128x128@2x.png
sips -z 256 256   ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_256x256.png
sips -z 512 512   ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_256x256@2x.png
sips -z 512 512   ./src/icon.iconset/icon.png --out ./src/icon.iconset/icon_512x512.png
cp ./src/icon.iconset/icon.png ./src/icon.iconset/icon_512x512@2x.png
# remove the base image
rm -rf ./src/icon.iconset/icon.png
# create the .icns
iconutil -c icns ./src/icon.iconset
# remove the temp iconset folder
rm -R ./src/icon.iconset
