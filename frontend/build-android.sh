# react-native bundle --entry-file index.js --platform android --dev false --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/

rm -rf android/app/src/main/res/drawable-*
cd android && ./gradlew assembleRelease
cd .. && react-native run-android --variant=release