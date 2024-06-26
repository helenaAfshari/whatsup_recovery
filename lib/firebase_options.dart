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
    apiKey: 'AIzaSyCfYCdOxLF0PA9suExF11tYEizXZNZ_gPU',
    appId: '1:505226299078:android:ac3a2ff3eb874c68bbb9c7',
    messagingSenderId: '505226299078',
    projectId: 'whatsup-d8bac',
    authDomain: 'whatsup-d8bac.firebaseapp.com',
    storageBucket: 'whatsup-d8bac.appspot.com',
    measurementId: 'G-FZMWT17T92',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfYCdOxLF0PA9suExF11tYEizXZNZ_gPU',
    appId: '1:505226299078:android:ac3a2ff3eb874c68bbb9c7',
    messagingSenderId: '505226299078',
    projectId: 'whatsup-d8bac',
    storageBucket: 'whatsup-d8bac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfYCdOxLF0PA9suExF11tYEizXZNZ_gPU',
    appId: '1:505226299078:android:ac3a2ff3eb874c68bbb9c7',
    messagingSenderId: '505226299078',
    projectId: 'whatsup-d8bac',
    storageBucket: 'whatsup-d8bac.appspot.com',
    iosBundleId: 'com.example.autharizationHanna',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfYCdOxLF0PA9suExF11tYEizXZNZ_gPU',
    appId: '1:505226299078:android:ac3a2ff3eb874c68bbb9c7',
    messagingSenderId: '505226299078',
    projectId: 'whatsup-d8bac',
    storageBucket: 'whatsup-d8bac.appspot.com',
    iosBundleId: 'com.example.autharizationHanna.RunnerTests',
  );
}
