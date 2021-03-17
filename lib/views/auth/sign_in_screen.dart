import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/authentication.dart';
import 'package:real_estate_app/models/user.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/views/components/rounded_rectangle_border_button.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/input_text_field.dart';
import 'package:real_estate_app/views/components/password_text_field.dart';
import 'package:real_estate_app/views/main/main_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({
    Key key,
    this.userType,
  }) : super(key: key);

  UserType userType;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email, pass;
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
              callback: (text) {
                setState(() {
                  email = text;
                });
              },
              prefixIcon: Icon(
                Icons.mail,
                color: kSecondaryAccentColor,
              ),
            ),
            PasswordTextField(
              title: 'Password',
              callback: (text) {
                setState(() {
                  pass = text;
                });
              },
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            RoundedRectangleBorderButton(
              onPressed: () async {
                try {
                  if (widget.userType == UserType.User) {
                    User user = await loginUser(email, pass);
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }),
                      );
                    } else {
                      showSnackbar(
                        Icons.info,
                        "Unable to sign in. Please try again.",
                        Colors.redAccent,
                        context,
                      );
                    }
                  } else {
                    //agent thing
                    showSnackbar(
                      Icons.info,
                      "Agent functionality not finished yet.",
                      Colors.redAccent,
                      context,
                    );
                  }
                } catch (e) {
                  showSnackbar(
                    Icons.info,
                    e.toString(),
                    Colors.redAccent,
                    context,
                  );
                }
              },
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
