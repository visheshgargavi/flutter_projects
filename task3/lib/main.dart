import 'package:firebase_app1/chat.dart';
import 'package:firebase_app1/home.dart';
import 'package:firebase_app1/login.dart';
import 'package:firebase_app1/reg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: "home",
      routes: {
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "chat": (context) => MyChat(),
      },
    ),
  );
}
