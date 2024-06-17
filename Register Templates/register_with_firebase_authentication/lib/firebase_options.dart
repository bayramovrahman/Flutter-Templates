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
    apiKey: 'AIzaSyCzJrSw9BSttUlA4BCdy8IOkCbLRB9jjMs',
    appId: '1:533179995353:web:f7f2f85b3a094ee6561ac8',
    messagingSenderId: '533179995353',
    projectId: 'fir-authentication-6beac',
    authDomain: 'fir-authentication-6beac.firebaseapp.com',
    storageBucket: 'fir-authentication-6beac.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP6A3AXoHuh-W_wfrKom1EWKCadu5JuB4',
    appId: '1:533179995353:android:a652bd58f34e75a5561ac8',
    messagingSenderId: '533179995353',
    projectId: 'fir-authentication-6beac',
    storageBucket: 'fir-authentication-6beac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnXdWgVAylq0nCyyHhtEj5XHX4-xkWhF8',
    appId: '1:533179995353:ios:3c1ecebd992ee35b561ac8',
    messagingSenderId: '533179995353',
    projectId: 'fir-authentication-6beac',
    storageBucket: 'fir-authentication-6beac.appspot.com',
    iosBundleId: 'com.example.firebaseAuthentication',
  );
}
