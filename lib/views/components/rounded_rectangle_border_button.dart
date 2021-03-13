import 'package:flutter/material.dart';
import 'package:real_estate_app/views/utilities/constants.dart';

class RoundedRectangleBorderButton extends StatelessWidget {
  const RoundedRectangleBorderButton({
    Key key,
    @required this.screenWidth,
    @required this.title,
    @required this.onPressed,
    this.width = 150.0,
    this.height = 50.0,
  }) : super(key: key);

  final double screenWidth;
  final String title;
  final double height;
  final double width;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.1,
        right: screenWidth * 0.1,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(
              width,
              height,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => kButtonBackgroundColor),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
