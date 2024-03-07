import 'login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBaNRZmY589jctc6SR8LQ6ZDrYanjJWuG8",
        appId: "1:370069966866:android:3f67a9dce705ebeb9748cb",
        messagingSenderId: "370069966866",
        projectId: "blood-donate-856e3")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}


