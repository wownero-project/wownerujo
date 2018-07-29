apk_path := vendor/fdroiddata/unsigned
app_id := com.wownero.wownerujo

.PHONY: f-droid-sign f-droid-clean \
build-external-libs use-prebuilt-external-libs

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

build-external-libs:
	script/build-external-libs/all.sh

# faster build for testing f-droid release
use-prebuilt-external-libs:
	script/build-external-libs/use-archive.sh
