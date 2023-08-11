#!/bin/sh

VERSION=`grep "version:" pubspec.yaml | sed "s/version: \(.*\).*/\1/;s/\./_/g;s/+.*//"`
PROJNAME=news

scp $PROJNAME-$VERSION.apk belli:/var/www/belligerator/news/public_html/downloads/$PROJNAME-$VERSION.apk
