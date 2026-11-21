import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase dulu sebelum runApp.
  // Web pakai options dari firebase_options.dart.
  // Android pakai google-services.json di android/app/.
  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (_) {
    // Android tanpa google-services.json akan gagal di sini,
    // file itu diunduh dari Firebase Console.
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Week 8',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child: Text('Task Week 8 - Firebase')),
      ),
    );
  }
}
