import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
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
  UserType userType;
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
            'Hello!',
            style: kTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Text(
            'Please tell us how you want to use this app.',
            style: kSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          RadioButton(
            callback: (_userType) {
              setState(() {
                userType = _userType;
              });
            },
          ),
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
                  if (userType == null) {
                    showSnackbar(Icons.info, "Please select a user type",
                        Colors.redAccent, context);
                  } else if ( userType == UserType.User ) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignInScreen(
                          userType: userType,
                        );
                      }),
                    );
                  } else {
                    showSnackbar(Icons.info, "Agent functionality not finished yet.", Colors.redAccent, context);
                  }
                },
              ),
              RoundedRectangleBorderButton(
                screenWidth: screenWidth,
                width: screenWidth * 0.3,
                title: 'Sign Up',
                onPressed: () {
                  if (userType == null) {
                    showSnackbar(Icons.info, "Please select a user type",
                        Colors.redAccent, context);
                  } else if ( userType == UserType.User ) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignUpScreen(
                          userType: userType,
                        );
                      }),
                    );
                  } else {
                    showSnackbar(Icons.info, "Agent functionality not finished yet.", Colors.redAccent, context);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
