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
    apiKey: 'AIzaSyAy4jO6yQAFefkB_ho090GGdOJ_-5YHQfw',
    appId: '1:520428515639:web:6bb55380a7c4c1f417aab2',
    messagingSenderId: '520428515639',
    projectId: 'turfscout-ebf77',
    authDomain: 'turfscout-ebf77.firebaseapp.com',
    storageBucket: 'turfscout-ebf77.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl9odrKenZQsRWaW97eYtONCJCgineqKk',
    appId: '1:520428515639:android:9893f014bdc9963e17aab2',
    messagingSenderId: '520428515639',
    projectId: 'turfscout-ebf77',
    storageBucket: 'turfscout-ebf77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMoQmc1e6N0Vfc-zrSAELcRKEj2cDqGMc',
    appId: '1:520428515639:ios:675a15d0ed66e38317aab2',
    messagingSenderId: '520428515639',
    projectId: 'turfscout-ebf77',
    storageBucket: 'turfscout-ebf77.appspot.com',
    iosBundleId: 'com.example.turfScout',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMoQmc1e6N0Vfc-zrSAELcRKEj2cDqGMc',
    appId: '1:520428515639:ios:7b8170d992b6fff117aab2',
    messagingSenderId: '520428515639',
    projectId: 'turfscout-ebf77',
    storageBucket: 'turfscout-ebf77.appspot.com',
    iosBundleId: 'com.example.turfScout.RunnerTests',
  );
}
