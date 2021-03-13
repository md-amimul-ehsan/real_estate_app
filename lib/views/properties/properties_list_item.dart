import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';
import 'package:real_estate_app/views/properties/properties_details.dart';

class PropertiesListItem extends StatefulWidget {
  PropertiesListItem({
    Key key,
    @required this.property,
  }) : super(key: key);

  Property property;
  @override
  _PropertiesListItemState createState() => _PropertiesListItemState();
}

class _PropertiesListItemState extends State<PropertiesListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return PropertiesDetails(property: widget.property);
          }),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: kMainScreenPadding,
          right: kMainScreenPadding,
          bottom: 10,
          top: 10,
        ),
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
                        "https://www.realestatebd.com/images/pic8.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kMainScreenPadding,
                    right: kMainScreenPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Clinton Villa",
                        style: kCardLargeTextStyle,
                      ),
                      Text(
                        "\$3,500.00",
                        style: kCardLargeTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kMainScreenPadding,
                    right: kMainScreenPadding,
                    bottom: 15.0,
                  ),
                  child: Row(
                    children: [
                      IconTextHorizontal(
                        title: 'Los Angeles',
                        icon: Icons.location_on_outlined,
                      ),
                      Spacer(),
                      IconTextHorizontal(
                        title: '4.4 Reviews',
                        icon: Icons.star_rate,
                        iconColor: Color(0xFFFDC125),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
