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
    apiKey: 'AIzaSyDg3uVLNlqD5bTRuGnABhS5ZmqZ7jXDEcQ',
    appId: '1:853219680869:web:placeholder',
    messagingSenderId: '853219680869',
    projectId: 'apforest-313a7',
    authDomain: 'apforest-313a7.firebaseapp.com',
    storageBucket: 'apforest-313a7.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg3uVLNlqD5bTRuGnABhS5ZmqZ7jXDEcQ',
    appId: '1:853219680869:android:65d33111f9634885fbdc8c',
    messagingSenderId: '853219680869',
    projectId: 'apforest-313a7',
    storageBucket: 'apforest-313a7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDg3uVLNlqD5bTRuGnABhS5ZmqZ7jXDEcQ',
    appId: '1:853219680869:ios:placeholder',
    messagingSenderId: '853219680869',
    projectId: 'apforest-313a7',
    storageBucket: 'apforest-313a7.firebasestorage.app',
    iosBundleId: 'com.example.apforest',
  );
}
