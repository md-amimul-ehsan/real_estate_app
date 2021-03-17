import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/views/auth/landing_screen.dart';

class ProfileMainScreen extends StatefulWidget {
  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("PLACEHOLDER FOR PROFILE SCREEN"),
            ElevatedButton(onPressed: () async {
              await removeLoginDetails();
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LandingScreen();
                }),
              );
            }, child: Text("LOG OUT"))
          ],
        ),
      ),
    );
  }
}
