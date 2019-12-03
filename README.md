# Save Our Species

An iOS app to streamline the process of reporting marine mammal strandings.

## Requirements
* iOS 13.0+
* Xcode 11.0+

## Features

* Report stranding events with GPS location, description, and a photo.
* Log in and view a list of reported strandings.

## This project uses
* Cocoapods for dependency management
* Firebase Firestore to store reports
* Firebase Storage to store report images
* Firebase Auth to authenticate users

## Building the code

1. Install the latest [Xcode developer tools](https://developer.apple.com/xcode/downloads/) from Apple.
2. Clone the repository:
   ```shell
   $ git clone https://github.com/hamfox/save-our-species.git`
   ```
3. Obtain the Firebase configuration file, `GoogleService-Info.plist` and add it the source directory: 
   `save-our-species/SOS/save-our-species/GoogleService-Info.plist`
4. Open the project in XCode:
   ```shell
   $ cd save-our-species/SOS
   $ open save-our-species.xcworkspace/
   ```
5. Build the project!


## Screenshots

![Main View](/Assets/login-screen.png)
![Browser View]()

## License

[MIT](LICENSE)