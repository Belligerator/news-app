#!/bin/sh

flutter clean

VERSION=`grep "version:" pubspec.yaml | sed "s/version: \(.*\).*/\1/;s/\./_/g;s/+.*//"`
PROJNAME=news

flutter build apk
mv build/app/outputs/flutter-apk/app-release.apk $PROJNAME-$VERSION.apk
