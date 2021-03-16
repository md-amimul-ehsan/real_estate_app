import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/open_houses/open_houses_list_item.dart';

class OpenHousesRecycler extends StatefulWidget {
  OpenHousesRecycler({Key key, @required this.propertyList}) : super(key: key);

  final List<Property> propertyList;
  @override
  _OpenHousesRecyclerState createState() => _OpenHousesRecyclerState();
}

class _OpenHousesRecyclerState extends State<OpenHousesRecycler> {
  @override
  Widget build(BuildContext context) {
    List<Property> propertyList = widget.propertyList;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: propertyList.length,
        itemBuilder: (context, i) {
          return OpenHousesListItem(property: propertyList[i]);
        },
      ),
    );
  }
}
