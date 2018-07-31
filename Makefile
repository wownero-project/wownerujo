apk_path := vendor/fdroiddata/unsigned
app_id := com.wownero.wownerujo

.PHONY: f-droid-sign f-droid-clean \
build-external-libs use-prebuilt-external-libs \
toolchain openssl boost wownero collect \
clean-external-libs

all: build-external-libs

f-droid-sign:
	zipalign -v -p 4 \
$(apk_path)/$(app_id)_${app_version}.apk \
$(apk_path)/$(app_id)_${app_version}-aligned.apk

	apksigner sign --ks ${release_key} \
--out $(apk_path)/$(app_id)_${app_version}-release.apk \
$(apk_path)/$(app_id)_${app_version}-aligned.apk

f-droid-clean:
	@rm -f $(apk_path)/$(app_id)_${app_version}-aligned.apk
	@rm -f $(apk_path)/$(app_id)_${app_version}-release.apk

build-external-libs: collect

# faster build for testing f-droid release
use-prebuilt-external-libs:
	script/build-external-libs/use-archive.sh

clean-external-libs:
	script/build-external-libs/clean.sh

toolchain:
	script/build-external-libs/prep-toolchain.sh

openssl: toolchain
	script/build-external-libs/pre-build-openssl.sh
	script/build-external-libs/build-openssl.sh
	script/build-external-libs/post-build-openssl.sh

boost: toolchain
	script/build-external-libs/pre-build-boost.sh
	script/build-external-libs/build-boost.sh

wownero: toolchain openssl boost
	script/build-external-libs/pre-build-wownero.sh
	script/build-external-libs/build-wownero.sh

collect: wownero
	script/build-external-libs/collect.sh
