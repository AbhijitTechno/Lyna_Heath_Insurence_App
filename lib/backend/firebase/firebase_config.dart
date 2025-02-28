import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKsVeyLhCT5qbP6Zhv-DsWtauK_tPf4lU",
            authDomain: "lynaapp-4cc6c.firebaseapp.com",
            projectId: "lynaapp-4cc6c",
            storageBucket: "lynaapp-4cc6c.firebasestorage.app",
            messagingSenderId: "350246861189",
            appId: "1:350246861189:web:a7e557d960ab7b08616cec",
            measurementId: "G-JTZEXBPHFZ"));
  } else {
    await Firebase.initializeApp();
  }
}
