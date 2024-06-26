// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDV9r7mz7NiihTkrQXowe2cOuZfWdY3lpQ',
    appId: '1:335037424788:web:cd66914e43194cb22d8081',
    messagingSenderId: '335037424788',
    projectId: 'chatgptcheckextension',
    authDomain: 'chatgptcheckextension.firebaseapp.com',
    storageBucket: 'chatgptcheckextension.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4QiWmLTJbbZFrquzr0xCWTFBTOYnolKc',
    appId: '1:335037424788:android:863f54a2ff6de6042d8081',
    messagingSenderId: '335037424788',
    projectId: 'chatgptcheckextension',
    storageBucket: 'chatgptcheckextension.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDV9r7mz7NiihTkrQXowe2cOuZfWdY3lpQ',
    appId: '1:335037424788:web:b0bfa0d992879ec82d8081',
    messagingSenderId: '335037424788',
    projectId: 'chatgptcheckextension',
    authDomain: 'chatgptcheckextension.firebaseapp.com',
    storageBucket: 'chatgptcheckextension.appspot.com',
  );
}
