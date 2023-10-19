// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAq7lb31hbpSkrGOqtiGWPyfcZOOOHqgfU',
    appId: '1:423418608140:web:c4827cfa411076eaa44c29',
    messagingSenderId: '423418608140',
    projectId: 'cml-1-d7ea8',
    authDomain: 'cml-1-d7ea8.firebaseapp.com',
    databaseURL: 'https://cml-1-d7ea8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cml-1-d7ea8.appspot.com',
    measurementId: 'G-VXSWC0TMXY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0a8y8PwiuvEOT_tA62qc2PPmfsr1Yy9E',
    appId: '1:423418608140:android:dde90d750f7dbe63a44c29',
    messagingSenderId: '423418608140',
    projectId: 'cml-1-d7ea8',
    databaseURL: 'https://cml-1-d7ea8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cml-1-d7ea8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBO7eW2jZnqh0nBTfQmjNBVWWEyEEhQ1tM',
    appId: '1:423418608140:ios:f34b6606c109c5e5a44c29',
    messagingSenderId: '423418608140',
    projectId: 'cml-1-d7ea8',
    databaseURL: 'https://cml-1-d7ea8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cml-1-d7ea8.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBO7eW2jZnqh0nBTfQmjNBVWWEyEEhQ1tM',
    appId: '1:423418608140:ios:d6e4dd06a85b9acba44c29',
    messagingSenderId: '423418608140',
    projectId: 'cml-1-d7ea8',
    databaseURL: 'https://cml-1-d7ea8-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cml-1-d7ea8.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}