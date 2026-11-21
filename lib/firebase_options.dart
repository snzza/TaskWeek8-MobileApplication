// File ini dibuat dari config web di materi latihan (PDF 6, project
// myapplication-db35a). Isinya sama seperti yang dihasilkan
// `flutterfire configure --project=myapplication-db35a` untuk platform web.
//
// Android TIDAK pakai file ini: di Android, Firebase baca
// `android/app/google-services.json` (download dari Firebase Console,
// Project Settings > Your apps > Android, sesuai PDF 4). Karena itu
// main.dart memanggil Firebase.initializeApp() tanpa options di Android,
// dan dengan options ini di web.
//
// Kalau nanti ada google-services.json + `flutterfire configure` dijalankan
// ulang, file ini akan ditimpa otomatis dengan appId Android yang benar.
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
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk platform ini. '
          'Di Android, letakkan google-services.json di android/app/ '
          '(PDF 4), atau jalankan: '
          'flutterfire configure --project=myapplication-db35a',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions tidak didukung untuk platform ini.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCavc2bSjb1qdckvY7w2t1s76CSGu1Ljxs',
    authDomain: 'myapplication-db35a.firebaseapp.com',
    databaseURL: 'https://myapplication-db35a.firebaseio.com',
    projectId: 'myapplication-db35a',
    storageBucket: 'myapplication-db35a.firebasestorage.app',
    messagingSenderId: '967342329087',
    appId: '1:967342329087:web:d83ff7dfc33d933ad890ca',
  );
}
