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
    apiKey: 'AIzaSyDREVfgYrMymQBPSlc6smRlGEmoWlfVZUU',
    appId: '1:568088724686:web:6999f1cbb8d0c6c5ec3c9f',
    messagingSenderId: '568088724686',
    projectId: 'assignment-3-32093',
    authDomain: 'assignment-3-32093.firebaseapp.com',
    storageBucket: 'assignment-3-32093.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBr0tCX2AmaGQTLprKsKCqCQyGVes6Q9d8',
    appId: '1:568088724686:android:3eb4347f5af71ce1ec3c9f',
    messagingSenderId: '568088724686',
    projectId: 'assignment-3-32093',
    storageBucket: 'assignment-3-32093.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9St7zvmim3YY6ik-zVC_qKmNbGgaNa_8',
    appId: '1:568088724686:ios:87be54ee78ab435aec3c9f',
    messagingSenderId: '568088724686',
    projectId: 'assignment-3-32093',
    storageBucket: 'assignment-3-32093.appspot.com',
    iosClientId: '568088724686-u5fd8b0rdn3in6dbpd2715q2lo9efn18.apps.googleusercontent.com',
    iosBundleId: 'com.example.swen325Assignment3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9St7zvmim3YY6ik-zVC_qKmNbGgaNa_8',
    appId: '1:568088724686:ios:87be54ee78ab435aec3c9f',
    messagingSenderId: '568088724686',
    projectId: 'assignment-3-32093',
    storageBucket: 'assignment-3-32093.appspot.com',
    iosClientId: '568088724686-u5fd8b0rdn3in6dbpd2715q2lo9efn18.apps.googleusercontent.com',
    iosBundleId: 'com.example.swen325Assignment3',
  );
}
