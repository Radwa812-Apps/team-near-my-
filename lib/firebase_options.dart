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
    apiKey: 'AIzaSyCIuinW6mGVtIQhpjZ2biIX5mKk5EyI6mM',
    appId: '1:312665803215:web:e14db4af1272a39af2eaba',
    messagingSenderId: '312665803215',
    projectId: 'team-near-my',
    authDomain: 'team-near-my.firebaseapp.com',
    storageBucket: 'team-near-my.firebasestorage.app',
    measurementId: 'G-143F6J8F44',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWvHA1-8ak1ceTjC622DfkeRqNRf8Gtb0',
    appId: '1:312665803215:android:6c714a49fd617651f2eaba',
    messagingSenderId: '312665803215',
    projectId: 'team-near-my',
    storageBucket: 'team-near-my.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0IjMX6z5QxTZC8JHhIqtQy7oF-mVf8bA',
    appId: '1:312665803215:ios:de63f5be017ec2eaf2eaba',
    messagingSenderId: '312665803215',
    projectId: 'team-near-my',
    storageBucket: 'team-near-my.firebasestorage.app',
    iosBundleId: 'com.example.nearmeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0IjMX6z5QxTZC8JHhIqtQy7oF-mVf8bA',
    appId: '1:312665803215:ios:aaeddff81f6a6c36f2eaba',
    messagingSenderId: '312665803215',
    projectId: 'team-near-my',
    storageBucket: 'team-near-my.firebasestorage.app',
    iosBundleId: 'com.example.nearmeApp.RunnerTests',
  );
}
