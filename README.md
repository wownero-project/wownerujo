# Wownerujo
The Android Wallet for Wownero

[<img src="https://f-droid.org/badge/get-it-on.png"
      alt="Get it on F-Droid"
      height="80">](https://f-droid.org/packages/com.wownero.wownerujo/)
<a href='https://play.google.com/store/apps/details?id=com.wownero.wownerujo&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' height='80'/></a>



## QUICKSTART
- Download the APK for the most current release [here](https://f-droid.org/packages/com.wownero.wownerujo/) and install it
- Run the App and select "Generate Wallet" to create a new wallet or recover a wallet
- Advanced users can copy over synced wallet files (all files) onto sdcard in directory Wownerujo (created first time App is started)
- See the [FAQ](doc/FAQ.md)

## Translations
Help us translate Monerujo! You can find instructions [On Taiga](https://taiga.getmonero.org/project/erciccione-monero-localization/wiki/monerujo), and if you need help/support, open an issue or contact the Localization Workgroup. You can find us on the freenode channel `#monero-translations`, also relayed on [MatterMost](https://mattermost.getmonero.org/monero/channels/monero-translations), and matrix/riot.

## Disclaimer
You may lose all your Wowneroj if you use this App. Be cautious when spending on the mainnet.

## Random Notes
- Based off wownero v0.3.0.0
- works on the testnet & mainnet
- use your own daemon - it's easy
- screen stays on until first sync is complete
- Wownerujo should mean "Wownero Wallet", since Monerujo means "Monero Wallet" according to https://www.reddit.com/r/Monero/comments/3exy7t/esperanto_corner/

## TODO
- see taiga.getmonero.org & issues on github

## Issues / Pitfalls
- Users of Zenfone MAX & Zenfone 2 Laser (possibly others) **MUST** use the armeabi-v7a APK as the arm64-v8a build uses hardware AES
functionality these models don't have.
- You should backup your wallet files in the "wownerujo" folder periodically.
- Also note, that on some devices the backups will only be visible on a PC over USB after a reboot of the device (it's an Android bug/feature)
- Created wallets on a private testnet are unusable because the restore height is set to that
of the "real" testnet.  After creating a new wallet, make a **new** one by recovering from the seed.
The official monero client shows the same behaviour.

## HOW TO BUILD

If you want to build the external libs yourself (recommended) check out [the instructions](doc/BUILDING-external-libs.md)

Then, fire up Android Studio and build the APK.

## Donations

### Monerujo

- <https://www.monerujo.io/index.html#support>

### Wownero / Wownerujo

- <https://funding.wownero.com>

### F-Droid

- <https://f-droid.org/en/contribute/>
