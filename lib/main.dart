import 'package:flutter/material.dart';
import 'package:real_estate_app/views/main/main_screen.dart';
import 'package:real_estate_app/views/auth/sign_up_screen.dart';

void main() => runApp(RealEstateApp());

class RealEstateApp extends StatelessWidget {
  RealEstateApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';
  final bool login = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: login ? SignUpScreen() : MainScreen(),
    );
  }
}