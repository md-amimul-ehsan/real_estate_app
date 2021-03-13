import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/radio_button.dart';
import 'package:real_estate_app/views/components/rounded_rectangle_border_button.dart';
import 'sign_up_screen.dart';
import 'sign_in_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryAccentColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: screenHeight * 0.35,
          ),
          Text(
            'Hello, Stranger.',
            style: kTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Text(
            'Please tell us how you want to register',
            style: kSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          RadioButton(),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedRectangleBorderButton(
                screenWidth: screenWidth,
                title: 'Sign In',
                width: screenWidth * 0.3,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignInScreen();
                    }),
                  );
                },
              ),
              RoundedRectangleBorderButton(
                screenWidth: screenWidth,
                width: screenWidth * 0.3,
                title: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
