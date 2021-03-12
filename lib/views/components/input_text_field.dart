import 'package:flutter/material.dart';
import 'package:real_estate_app/views/utilities/constants.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key key,
    @required this.title,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String title;
  final TextInputType textInputType;
  final Icon prefixIcon;
  final Icon suffixIcon;

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
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
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: textController.text.isEmpty
              ? Container(width: 0.0)
              : IconButton(
                  icon: Icon(
                    Icons.close,
                    color: kSecondaryAccentColor,
                  ),
                  onPressed: () => textController.clear(),
                ),
          prefixIcon: widget.prefixIcon,
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
