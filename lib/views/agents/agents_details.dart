import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';

class AgentsDetails extends StatefulWidget {
  @override
  _AgentsDetailsState createState() => _AgentsDetailsState();
}

class _AgentsDetailsState extends State<AgentsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://giantbomb1.cbsistatic.com/uploads/scale_medium/1/16944/2427349-426065_10151435086863987_724057164_n.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kMainScreenPadding,
                        right: kMainScreenPadding,
                      ),
                      child: Text(
                        "Rahman",
                        style: kCardLargeTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kMainScreenPadding,
                        right: kMainScreenPadding,
                        bottom: 15.0,
                      ),
                      child: Text(
                        "Real Estate Agent",
                        style: kWhiteTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TitleTextColumn(
            title: 'Active',
            text: 'true',
          ),
          TitleTextColumn(
            title: 'addbutton1',
            text: 'button',
          ),
          TitleTextColumn(
            title: 'addbutton2',
            text: 'chat',
          ),
          TitleTextColumn(
            title: 'contact',
            text: '123456789',
          ),
        ],
      ),
    );
  }
}

class TitleTextColumn extends StatelessWidget {
  const TitleTextColumn({
    Key key,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  final String title;
  final String text;

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
              fontSize: 20,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
