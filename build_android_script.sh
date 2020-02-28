#!/usr/bin/env bash
flutter clean
flutter build apk --target-platform android-arm --split-per-abi
mv build/app/outputs/apk/release/app-armeabi-v7a-release.apk build/app/outputs/apk/release/宠窝cw.apk
open build/app/outputs/apk/release/