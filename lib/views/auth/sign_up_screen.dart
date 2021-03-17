import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/authentication.dart';
import 'package:real_estate_app/models/user.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/views/components/rounded_rectangle_border_button.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/input_text_field.dart';
import 'package:real_estate_app/views/components/password_text_field.dart';
import 'package:real_estate_app/views/main/main_screen.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({Key key, this.userType,}) : super (key: key);

  UserType userType;
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;
    String email, pass, name;
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
              'Sign up',
              textAlign: TextAlign.center,
              style: kTitleTextStyle,
            ),
            SizedBox(
              height: screenHeight * 0.15,
            ),
            InputTextField(
              title: 'Name',
              textInputType: TextInputType.name,
              callback: (text) {
                name = text;
              },
              prefixIcon: Icon(
                Icons.account_circle,
                color: kSecondaryAccentColor,
              ),
            ),
            InputTextField(
              textInputType: TextInputType.emailAddress,
              title: 'Email',
              callback: (text) {
                email = text;
              },
              prefixIcon: Icon(
                Icons.mail,
                color: kSecondaryAccentColor,
              ),
            ),
            PasswordTextField(
              title: 'Password',
              callback: (text) {
                pass = text;
              },
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            RoundedRectangleBorderButton(
              onPressed: () async {
                try {
                  // setState(() {
                  //   isLoading = true;
                  // });
                  if (widget.userType == UserType.User) {
                    User user = await registerUser(name, email, pass);
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }),
                      );
                    } else {
                      // setState(() {
                      //   isLoading = false;
                      // });
                      showSnackbar(
                        Icons.info,
                        "Unable to sign in. Please try again.",
                        Colors.redAccent,
                        context,
                      );
                    }
                  } else {
                    // setState(() {
                    //   isLoading = false;
                    // });
                    //agent thing
                    showSnackbar(
                      Icons.info,
                      "Agent functionality not finished yet.",
                      Colors.redAccent,
                      context,
                    );
                  }
                } catch (e) {
                  // setState(() {
                  //   isLoading = false;
                  // });
                  showSnackbar(
                    Icons.info,
                    e.toString(),
                    Colors.redAccent,
                    context,
                  );
                }
              },
              screenWidth: screenWidth,
              title: 'Sign Up',
              width: screenWidth * 0.3,
            ),
            // !isLoading ? Container() : Padding(
            //   padding: EdgeInsets.fromLTRB(150, 50, 150, 50),
            //   child: Center(
            //     child: CircularProgressIndicator(
            //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
