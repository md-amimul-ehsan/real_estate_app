import 'package:flutter/material.dart';

class IconTextVertical extends StatelessWidget {

  const IconTextVertical({
    Key key,
    @required
    this.text,
    @required
    this.color,
    @required
    this.icon,
  }) : super (key: key);

  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(text)
      ],
    );
  }
}
