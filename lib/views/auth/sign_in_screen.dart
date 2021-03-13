import 'package:flutter/material.dart';
import 'package:real_estate_app/views/components/rounded_rectangle_border_button.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/input_text_field.dart';
import 'package:real_estate_app/views/components/password_text_field.dart';

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
      appBar: AppBar(
        backgroundColor: kPrimaryAccentColor,
        elevation: 0,
      ),
      backgroundColor: kPrimaryAccentColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: kTitleTextStyle,
            ),
            SizedBox(
              height: screenHeight * 0.15,
            ),
            InputTextField(
              textInputType: TextInputType.emailAddress,
              title: 'Email',
              prefixIcon: Icon(
                Icons.mail,
                color: kSecondaryAccentColor,
              ),
            ),
            PasswordTextField(
              title: 'Password',
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            RoundedRectangleBorderButton(
              onPressed: () {},
              screenWidth: screenWidth,
              title: 'Sign In',
              width: screenWidth * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
