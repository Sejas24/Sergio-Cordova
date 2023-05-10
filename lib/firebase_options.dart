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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBqYakylWeoZz9FepCHEIyygiznBgKgbdM',
    appId: '1:524381137442:web:7583a5885b121b83baf87b',
    messagingSenderId: '524381137442',
    projectId: 'baston-inteligente-3c2e7',
    authDomain: 'baston-inteligente-3c2e7.firebaseapp.com',
    databaseURL: 'https://baston-inteligente-3c2e7-default-rtdb.firebaseio.com',
    storageBucket: 'baston-inteligente-3c2e7.appspot.com',
    measurementId: 'G-QTQZFMDJE7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUQhkpQifx58riVqG9vU3UUrBieIKAAlA',
    appId: '1:524381137442:android:3fc7c2cc5c4f9284baf87b',
    messagingSenderId: '524381137442',
    projectId: 'baston-inteligente-3c2e7',
    databaseURL: 'https://baston-inteligente-3c2e7-default-rtdb.firebaseio.com',
    storageBucket: 'baston-inteligente-3c2e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGtPELtloRSYaLiBVkmuOvXCzTNG_sYZY',
    appId: '1:524381137442:ios:a445d86595de063ebaf87b',
    messagingSenderId: '524381137442',
    projectId: 'baston-inteligente-3c2e7',
    databaseURL: 'https://baston-inteligente-3c2e7-default-rtdb.firebaseio.com',
    storageBucket: 'baston-inteligente-3c2e7.appspot.com',
    iosClientId: '524381137442-qghd8um3ho2vdqj13ki7erot3sa4ms7a.apps.googleusercontent.com',
    iosBundleId: 'com.example.bastonInteligente',
  );
}
