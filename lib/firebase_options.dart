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
    apiKey: 'AIzaSyBFGdO1hhxU8yyp_kuJ_klLTyAkBTrEHXM',
    appId: '1:582458749597:web:0137c0f65e99cf5fbe1a74',
    messagingSenderId: '582458749597',
    projectId: 'bolt-clone-56b29',
    authDomain: 'bolt-clone-56b29.firebaseapp.com',
    storageBucket: 'bolt-clone-56b29.appspot.com',
    measurementId: 'G-N0DWWBD1DR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKolDcSl0-1HM8JteLVwfALiGkiugfHLY',
    appId: '1:582458749597:android:37b20572663a92ebbe1a74',
    messagingSenderId: '582458749597',
    projectId: 'bolt-clone-56b29',
    storageBucket: 'bolt-clone-56b29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuQSEVQX_9sI3dHt50vq_6vasM-H2PODg',
    appId: '1:582458749597:ios:a69d4eb4f2088b2bbe1a74',
    messagingSenderId: '582458749597',
    projectId: 'bolt-clone-56b29',
    storageBucket: 'bolt-clone-56b29.appspot.com',
    iosBundleId: 'com.example.rydeme',
  );
}
