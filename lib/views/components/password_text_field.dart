import 'package:flutter/material.dart';
import 'package:real_estate_app/views/utilities/constants.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final textController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.08,
        right: screenWidth * 0.08,
        top: 10.0,
        bottom: 10.0,
      ),
      child: TextField(
        obscureText: !isPasswordVisible,
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: kSecondaryAccentColor,
          ),
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Icon(
                    Icons.visibility_off,
                    color: kSecondaryAccentColor,
                  )
                : Icon(
                    Icons.visibility,
                    color: kSecondaryAccentColor,
                  ),
            onPressed: () => setState(() {
              isPasswordVisible = !isPasswordVisible;
            }),
          ),
          fillColor: kPrimaryAccentColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kSecondaryAccentColor,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: widget.title,
          labelStyle: kWhiteTextStyle,
        ),
      ),
    );
  }
}
