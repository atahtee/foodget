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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp2EJ1sKI2bIittb2vlHod_oDmRxBRKx8',
    appId: '1:519684543474:android:74980f85ea6c7525e8916b',
    messagingSenderId: '519684543474',
    projectId: 'foodget-1350b',
    storageBucket: 'foodget-1350b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATJmaa1B2OrJWvBJunPBaLDZ87Z73n-Hk',
    appId: '1:519684543474:ios:082d016780e7b462e8916b',
    messagingSenderId: '519684543474',
    projectId: 'foodget-1350b',
    storageBucket: 'foodget-1350b.appspot.com',
    iosBundleId: 'com.example.foodget',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATJmaa1B2OrJWvBJunPBaLDZ87Z73n-Hk',
    appId: '1:519684543474:ios:082d016780e7b462e8916b',
    messagingSenderId: '519684543474',
    projectId: 'foodget-1350b',
    storageBucket: 'foodget-1350b.appspot.com',
    iosBundleId: 'com.example.foodget',
  );
}
