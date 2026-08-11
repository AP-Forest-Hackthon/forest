import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCweRbyox_X8zaRz1yqEvIkJQO8J-c6ACU',
    appId: '1:1759901515:web:placeholder',
    messagingSenderId: '1759901515',
    projectId: 'apforest-9ba6d',
    authDomain: 'apforest-9ba6d.firebaseapp.com',
    storageBucket: 'apforest-9ba6d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCweRbyox_X8zaRz1yqEvIkJQO8J-c6ACU',
    appId: '1:1759901515:android:785b1fc8767368b5aa5ace',
    messagingSenderId: '1759901515',
    projectId: 'apforest-9ba6d',
    storageBucket: 'apforest-9ba6d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCweRbyox_X8zaRz1yqEvIkJQO8J-c6ACU',
    appId: '1:1759901515:ios:placeholder',
    messagingSenderId: '1759901515',
    projectId: 'apforest-9ba6d',
    storageBucket: 'apforest-9ba6d.firebasestorage.app',
    iosBundleId: 'com.example.apforest',
  );
}
