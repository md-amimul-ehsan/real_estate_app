import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/open_houses/open_houses_details.dart';

class OpenHousesListItem extends StatefulWidget {
  OpenHousesListItem({
    Key key,
    @required this.property,
  }) : super(key: key);

  final Property property;
  @override
  _OpenHousesListItemState createState() => _OpenHousesListItemState();
}

class _OpenHousesListItemState extends State<OpenHousesListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return OpenHousesDetails(property: widget.property);
          }),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                foregroundColor: Colors.black,
                foregroundImage: NetworkImage(
                  "https://www.realestatebd.com/images/pic8.jpg",
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Open house date - time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Open house address/details",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// CircleAvatar(
// radius: 30,
// foregroundColor: Colors.black,
// foregroundImage: NetworkImage(
// "https://giantbomb1.cbsistatic.com/uploads/scale_medium/1/16944/2427349-426065_10151435086863987_724057164_n.jpg",
// ),
// ),
// SizedBox(
// width: 5,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Agent name",
// ),
// Text(
// "Agent description",
// ),
// ],
// ),
// Spacer(),
// IconButton(
// icon: Icon(Icons.arrow_forward_ios),
// color: kPrimaryAccentColor,
// onPressed: () {},
// ),
// ],
// ),
// ),
