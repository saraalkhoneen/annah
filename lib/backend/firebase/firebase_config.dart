import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyALsWvXtJmQJLEBMTyRYW8MTJYisg69lN0",
            authDomain: "annah-olmcb8.firebaseapp.com",
            projectId: "annah-olmcb8",
            storageBucket: "annah-olmcb8.appspot.com",
            messagingSenderId: "395381892091",
            appId: "1:395381892091:web:a39fb88f4b5349ac30215e"));
  } else {
    await Firebase.initializeApp();
  }
}
