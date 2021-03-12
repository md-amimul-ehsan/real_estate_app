import 'package:flutter/material.dart';
import 'package:real_estate_app/views/auth/screens/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      home: SignUpScreen(),
    );
  }
}
