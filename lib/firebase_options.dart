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
    apiKey: 'AIzaSyB8RxCnFNm_XhgvxlGD2vt5BVwAv6fkfLc',
    appId: '1:781555207870:web:9ec6224b8e81aed530d8ef',
    messagingSenderId: '781555207870',
    projectId: 'heartcom-chat',
    authDomain: 'heartcom-chat.firebaseapp.com',
    storageBucket: 'heartcom-chat.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2IGi0d8R5PwrD85UGcMkdd3cQa0HGI2U',
    appId: '1:781555207870:android:931a4612285d582e30d8ef',
    messagingSenderId: '781555207870',
    projectId: 'heartcom-chat',
    storageBucket: 'heartcom-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBo-USyRnsHPSm3N3veMknsIdsqZ_DWzfE',
    appId: '1:781555207870:ios:243fedfe33ed30ab30d8ef',
    messagingSenderId: '781555207870',
    projectId: 'heartcom-chat',
    storageBucket: 'heartcom-chat.appspot.com',
    iosBundleId: 'com.example.heartcom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBo-USyRnsHPSm3N3veMknsIdsqZ_DWzfE',
    appId: '1:781555207870:ios:243fedfe33ed30ab30d8ef',
    messagingSenderId: '781555207870',
    projectId: 'heartcom-chat',
    storageBucket: 'heartcom-chat.appspot.com',
    iosBundleId: 'com.example.heartcom',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8RxCnFNm_XhgvxlGD2vt5BVwAv6fkfLc',
    appId: '1:781555207870:web:c8151eca1e1edecc30d8ef',
    messagingSenderId: '781555207870',
    projectId: 'heartcom-chat',
    authDomain: 'heartcom-chat.firebaseapp.com',
    storageBucket: 'heartcom-chat.appspot.com',
  );
}
