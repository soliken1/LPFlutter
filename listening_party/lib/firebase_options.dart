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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyD8s5VgKTksUB9gZ0kQZ17q6lVu162FuOI',
    appId: '1:951502328345:web:21fd7736687f4d128d5088',
    messagingSenderId: '951502328345',
    projectId: 'listening-party-420313',
    authDomain: 'listening-party-420313.firebaseapp.com',
    storageBucket: 'listening-party-420313.appspot.com',
    measurementId: 'G-W0HZS36YFZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGuNOyl_-7bwNSqU5gDkoWa3hJX5JWG10',
    appId: '1:951502328345:android:d4d670d80f1c0dea8d5088',
    messagingSenderId: '951502328345',
    projectId: 'listening-party-420313',
    storageBucket: 'listening-party-420313.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDls0KrpOkhD7XsuivJsssl-cFDPwOjEHg',
    appId: '1:951502328345:ios:917642573a77af388d5088',
    messagingSenderId: '951502328345',
    projectId: 'listening-party-420313',
    storageBucket: 'listening-party-420313.appspot.com',
    iosClientId: '951502328345-5l75qdqale902ngkv3vilgidc5l6d110.apps.googleusercontent.com',
    iosBundleId: 'com.example.listeningParty',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDls0KrpOkhD7XsuivJsssl-cFDPwOjEHg',
    appId: '1:951502328345:ios:917642573a77af388d5088',
    messagingSenderId: '951502328345',
    projectId: 'listening-party-420313',
    storageBucket: 'listening-party-420313.appspot.com',
    iosClientId: '951502328345-5l75qdqale902ngkv3vilgidc5l6d110.apps.googleusercontent.com',
    iosBundleId: 'com.example.listeningParty',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD8s5VgKTksUB9gZ0kQZ17q6lVu162FuOI',
    appId: '1:951502328345:web:3ef98cd7233556078d5088',
    messagingSenderId: '951502328345',
    projectId: 'listening-party-420313',
    authDomain: 'listening-party-420313.firebaseapp.com',
    storageBucket: 'listening-party-420313.appspot.com',
    measurementId: 'G-8TTKT24FLY',
  );
}
