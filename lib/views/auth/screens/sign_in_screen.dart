import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/views/utilities/constants.dart';
import 'package:real_estate_app/views/components/radio_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            height: screenHeight * 0.4,
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
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
            ),
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => kButtonBackgroundColor),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
