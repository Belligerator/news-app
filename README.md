# Best News Flutter mobile app

Flutter mobile app for reading news.

## About

This is a mobile app for reading news. It is written in Flutter. It is a sample app, which communicates with a REST API. Backend is written in [NestJS](https://nestjs.com/), a NodeJS framework. Backend code is available [here](https://github.com/Belligerator/news-backend). The app is connected to https://news.belligerator.cz/api/.

## Demo

A demo of the app can be downloaded at https://belligerator.cz/downloads/ (`news-<version>.apk`). It is available for Android only. 

If you do not want to install the app, here are some screenshots and a video:

<img src='https://github.com/Belligerator/news-app/assets/20533329/1392169f-0355-44f7-a1b0-22d382e56331' width='350'> <img src='https://github.com/Belligerator/news-app/assets/20533329/b2e01f13-318f-498c-9a8a-0f47a5bb3303' width='350'>

<img src='https://github.com/Belligerator/news-app/assets/20533329/aa6d07de-bd90-4d1a-85ec-2cb5727bf591' width='350'> <img src='https://github.com/Belligerator/news-app/assets/20533329/53563d5e-b25e-4d3d-abd5-2b8e0bc4bbc0' width='350'>

https://github.com/Belligerator/news-app/assets/20533329/cc69b359-e6c7-4a72-8cea-1167d747a691


## Getting Started

### Prerequisites

You need to have Flutter installed. You can find instructions [here](https://flutter.dev/docs/get-started/install). The application was tested on Flutter 3.3.3. and 3.7.1.

### Installing

1. Clone the repository [news-app](https://github.com/Belligerator/news-app)

    ```sh
    git clone git@github.com:Belligerator/news-app.git
    ```

2. Install dependencies

    ```sh
    flutter pub get
    ```
   
3. Than you can run the app with [Android Studio](https://developer.android.com/studio). Or you can run `abuild.sh` script in the root of the project. It will build the apk and move it to the root of the project. You can then install it on your phone via [adb](https://developer.android.com/studio/command-line/adb).

    ```sh
    ./build.sh
    ```

