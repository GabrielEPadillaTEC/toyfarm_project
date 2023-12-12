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
    apiKey: 'AIzaSyBRefa0TLhVLJsfEVdDD-uhGWkNkQFqyDU',
    appId: '1:809299919138:web:b42ac47f250dd2b6c4e57b',
    messagingSenderId: '809299919138',
    projectId: 'toyfarm-47551',
    authDomain: 'toyfarm-47551.firebaseapp.com',
    storageBucket: 'toyfarm-47551.appspot.com',
    measurementId: 'G-T15W26B524',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3mp4xOQJPTUINGS6HxJ9oCCb23Fbgvbk',
    appId: '1:809299919138:android:3508bbe8ceedd614c4e57b',
    messagingSenderId: '809299919138',
    projectId: 'toyfarm-47551',
    storageBucket: 'toyfarm-47551.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrdRUGceINamf6kv42X_0thtsZRLOuDW8',
    appId: '1:809299919138:ios:e028021d4cf20a3ec4e57b',
    messagingSenderId: '809299919138',
    projectId: 'toyfarm-47551',
    storageBucket: 'toyfarm-47551.appspot.com',
    iosBundleId: 'com.example.toyfarnProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrdRUGceINamf6kv42X_0thtsZRLOuDW8',
    appId: '1:809299919138:ios:a23a925119d84d5cc4e57b',
    messagingSenderId: '809299919138',
    projectId: 'toyfarm-47551',
    storageBucket: 'toyfarm-47551.appspot.com',
    iosBundleId: 'com.example.toyfarnProject.RunnerTests',
  );
}
