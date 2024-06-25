import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: Platform.isAndroid
          ? FirebaseOptions(
              apiKey: "AIzaSyCp_Zz5s3fzCAp6f0tVeeh_4InAe8_nfNQ",
              appId: "1:373065739229:android:2aed9c137fb2f41898e434",
              messagingSenderId: "373065739229",
              projectId: "aboutsurat-9b189",
              storageBucket: "aboutsurat-9b189.appspot.com")
          : FirebaseOptions(
              apiKey: "AIzaSyDiTm77LRggY8JifGG-uPZu3KZqYehDJT4",
              appId: "1:373065739229:ios:61eb18dd862d052098e434",
              messagingSenderId: "373065739229",
              projectId: "aboutsurat-9b189"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
