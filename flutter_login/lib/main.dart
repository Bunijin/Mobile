import 'package:flutter/material.dart';
import './login_page.dart';
//import './register.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_login',
      theme: ThemeData.dark(),
      home: const LoginPage(),
      //home: const Register(),
    );
  }
}
