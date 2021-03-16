import 'package:flutter/material.dart';

class IconTextVertical extends StatelessWidget {
  const IconTextVertical({
    Key key,
    @required this.text,
    this.titleText = "",
    @required this.iconColor,
    this.textColor = Colors.black,
    @required this.icon,
  }) : super(key: key);

  final String titleText;
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor),
        Text(
          titleText,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
