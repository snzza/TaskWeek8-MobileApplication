// Config Firebase project MyProjectFirebase (myprojectfirebase-11020).
// Dibuat dari google-services.json yang diunduh dari Firebase Console.
//
// Android TIDAK pakai file ini: di Android, Firebase baca
// `android/app/google-services.json`. Karena itu main.dart memanggil
// Firebase.initializeApp() tanpa options di Android, dan dengan
// options ini di web.
//
// Web belum didaftarkan di project ini, jadi belum ada appId web.
// Kalau nanti Web app ditambah di Console, jalankan:
// flutterfire configure --project=myprojectfirebase-11020
// file ini akan ditimpa otomatis dengan appId yang benar.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] untuk project ini.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk platform ini. '
          'Jalankan: flutterfire configure --project=myprojectfirebase-11020',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions tidak didukung untuk platform ini.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxL4E_b55l6LCH3Rp05xyG3iKSy4EH3fI',
    appId: '1:929217776017:android:276093331f125b4843f230',
    messagingSenderId: '929217776017',
    projectId: 'myprojectfirebase-11020',
    storageBucket: 'myprojectfirebase-11020.firebasestorage.app',
  );

  static FirebaseOptions get web {
    throw UnsupportedError(
      'Web app belum didaftarkan di project MyProjectFirebase. '
      'Tambah Web app di Firebase Console, atau jalankan: '
      'flutterfire configure --project=myprojectfirebase-11020',
    );
  }
}
