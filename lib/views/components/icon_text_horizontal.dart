import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/constants.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key key,
    @required this.title,
    @required this.icon,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        )
      ],
    );
  }
}
