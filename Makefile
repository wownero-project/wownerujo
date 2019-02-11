.PHONY: f-droid-sign f-droid-clean \
build-external-libs use-prebuilt-external-libs \
toolchain openssl boost wownero collect \
clean-external-libs \
f-droid-sign f-droid-clean \
install \
gradle-build gradle-sign gradle-clean \
apk-install remove-exif


script := script/build-external-libs


all: build-external-libs

build-external-libs: clean-external-libs collect

clean-external-libs:
	$(script)/clean.sh

toolchain:
	$(script)/prep-toolchain.sh

openssl: toolchain
	$(script)/fetch-openssl.sh
	$(script)/patch-openssl.sh
	$(script)/build-openssl.sh
	$(script)/post-build-openssl.sh

boost: toolchain
	$(script)/fetch-boost.sh
	$(script)/build-boost.sh

libsodium: toolchain
	$(script)/fetch-libsodium.sh
	$(script)/build-libsodium.sh

wownero: toolchain openssl libsodium boost
	$(script)/fetch-wownero.sh
	$(script)/patch-wownero.sh
	$(script)/build-wownero.sh

collect: wownero
	$(script)/collect.sh



# dev shortcut
# faster build for testing f-droid release
use-prebuilt-external-libs:
	$(script)/use-archive.sh

unsafe-wownero:
	$(script)/fetch-wownero.sh
	$(script)/patch-wownero.sh
	$(script)/build-wownero.sh

unsafe-collect:
	$(script)/collect.sh


fdroid_apk_path := vendor/fdroiddata/unsigned
app_id := com.wownero.wownerujo

gradle_apk_path := app/build/outputs/apk/release
gradle_app_name := wownerujo-${gradle_app_version}


f-droid-sign:
	zipalign -v -p 4 \
$(fdroid_apk_path)/$(app_id)_${app_version}.apk \
$(fdroid_apk_path)/$(app_id)_${app_version}-aligned.apk

	apksigner sign --ks ${release_key} \
--out $(fdroid_apk_path)/$(app_id)_${app_version}-release.apk \
$(fdroid_apk_path)/$(app_id)_${app_version}-aligned.apk

f-droid-clean:
	@rm -f $(fdroid_apk_path)/$(app_id)_${app_version}-aligned.apk
	@rm -f $(fdroid_apk_path)/$(app_id)_${app_version}-release.apk


# release-build
install: gradle-build apk-install

gradle-build:
	./gradlew assembleRelease

apk-install:
	adb install -r ./app/build/outputs/apk/release/wownerujo-$(gradle_app_version)_universal.apk

# debug-build
install-debug: gradle-build-debug apk-install-debug

gradle-build-debug:
	./gradlew assembleDebug

apk-install-debug:
	adb install -r ./app/build/outputs/apk/debug/wownerujo-$(gradle_app_version)_universal.apk

# clean
gradle-clean:
	@rm -f $(gradle_apk_path)/$(gradle_app_name)_universal.apk
	@rm -f $(gradle_apk_path)/$(gradle_app_name)_arm64-v8a.apk
	@rm -f $(gradle_apk_path)/$(gradle_app_name)_armebi-v7a.apk
	@rm -f $(gradle_apk_path)/$(gradle_app_name)_x86_64.apk

remove-exif:
	exiftool -all= `find app/ -name '*.jp*g' -o -name '*.png'`
