import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/views/main/main_screen.dart';
import 'package:real_estate_app/views/auth/landing_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loginFlag = await checkIfUserLoggedIn();
  runApp(RealEstateApp(loginFlag: loginFlag));
}

class RealEstateApp extends StatefulWidget {
  RealEstateApp({this.loginFlag, Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';
  final bool loginFlag;
  @override
  _RealEstateAppState createState() => _RealEstateAppState();
}

class _RealEstateAppState extends State<RealEstateApp> {
  bool login;

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    login = widget.loginFlag;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: RealEstateApp._title,
      home: login ? MainScreen() : LandingScreen()
    );
  }
}
