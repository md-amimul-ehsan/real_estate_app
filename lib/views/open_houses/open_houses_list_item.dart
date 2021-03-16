import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/openhouse.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/open_houses/open_houses_details.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';
import 'package:real_estate_app/views/components/badge.dart';

class OpenHousesListItem extends StatefulWidget {
  OpenHousesListItem({
    Key key,
    @required this.openhouse,
  }) : super(key: key);

  final Openhouse openhouse;
  @override
  _OpenHousesListItemState createState() => _OpenHousesListItemState();
}

class _OpenHousesListItemState extends State<OpenHousesListItem> {
  @override
  Widget build(BuildContext context) {
    final openhouse = widget.openhouse;
    final property = widget.openhouse.propertyId;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return OpenHousesDetails(openhouse: widget.openhouse);
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
                    image: NetworkImage(property.img.isNotEmpty
                        ? property.img.first
                        : "https://www.realestatebd.com/images/pic8.jpg"),
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
                      timestampToNeatTime(openhouse.date.toString()),
                      style: kCardLargeTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kMainScreenPadding,
                    right: kMainScreenPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.name,
                        style: kCardLargeTextStyle,
                      ),
                      Text(
                        "\$${property.price}",
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
                        title: property.location,
                        icon: Icons.location_on_outlined,
                      ),
                      Spacer(),
                      Badge(
                        color: Colors.green,
                        title: 'OPEN',
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
