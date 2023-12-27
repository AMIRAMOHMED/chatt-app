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
    apiKey: 'AIzaSyDFXXq--D1vuN9astaZqs4N4lofoaUBf00',
    appId: '1:1098425523297:web:bb8adba3134d9d6ddd5e20',
    messagingSenderId: '1098425523297',
    projectId: 'chatt-app-92fc1',
    authDomain: 'chatt-app-92fc1.firebaseapp.com',
    storageBucket: 'chatt-app-92fc1.appspot.com',
    measurementId: 'G-W6M99VXD2S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCn0NPQ4NBdkFPsVAluMDCH0SgQOxJUPIA',
    appId: '1:1098425523297:android:55c8958a4f5ff49add5e20',
    messagingSenderId: '1098425523297',
    projectId: 'chatt-app-92fc1',
    storageBucket: 'chatt-app-92fc1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_t5W_kCCJfnkb1e_aoV4XuyZhFfzuxso',
    appId: '1:1098425523297:ios:fb109dac08cc2a70dd5e20',
    messagingSenderId: '1098425523297',
    projectId: 'chatt-app-92fc1',
    storageBucket: 'chatt-app-92fc1.appspot.com',
    iosBundleId: 'com.example.chattApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_t5W_kCCJfnkb1e_aoV4XuyZhFfzuxso',
    appId: '1:1098425523297:ios:fb31fe28320fd936dd5e20',
    messagingSenderId: '1098425523297',
    projectId: 'chatt-app-92fc1',
    storageBucket: 'chatt-app-92fc1.appspot.com',
    iosBundleId: 'com.example.chattApp.RunnerTests',
  );
}