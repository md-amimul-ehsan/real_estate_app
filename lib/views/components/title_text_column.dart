import 'package:flutter/material.dart';

class TitleTextColumn extends StatelessWidget {
  const TitleTextColumn({
    Key key,
    @required this.title,
    @required this.text,
    this.textColor = Colors.black,
  }) : super(key: key);

  final String title;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
