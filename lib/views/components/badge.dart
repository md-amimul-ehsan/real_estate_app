import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.color,
    @required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 3,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
