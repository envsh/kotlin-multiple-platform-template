set -e fail

# 
# cat /usr/local/bin/ndk-build
# cat `which ndk-build`

NDKDIR=/usr/local/Caskroom/android-ndk/26d/AndroidNDK11579264.app/Contents/NDK//toolchains/llvm/prebuilt/darwin-x86_64

export CGO_CFLAGS="-I${NDKDIR}/sysroot/usr/include -I${NDKDIR}/sysroot/usr/include/arm-linux-androideabi"


# export CC=${NDKDIR}/bin/armv7a-linux-androideabi21-clang
export CC=${NDKDIR}/bin/aarch64-linux-android21-clang
RUSTUP_TOOLCHAIN=$CC

# export CC=${NDKDIR}/bin/aarch64-linux-android21-clang

# export LD=${NDKDIR}/bin/ld

#GOOS=android  GOARCH=arm64  CGO_LDFLAGS="-arch arm64" CGO_ENABLED=1 go build -buildmode=c-shared -o ../fedimuigo.so
GOOS=android  GOARCH=arm64  CGO_CFLAGS="-arch arm64" CGO_LDFLAGS="-arch arm64" CGO_ENABLED=1 go build -buildmode=c-shared -o ../jniLibs/libhellogo.so
# GOOS=android GOARCH=arm64 CGO_ENABLED=1 go build -v -x -buildmode=c-shared
# otool -L ../libhellors.so | grep my_project
$NDKDIR/bin/llvm-objdump -x ../jniLibs/libhellogo.so |grep NEEDED
