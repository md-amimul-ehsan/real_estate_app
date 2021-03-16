import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/properties.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/properties/properties_list_item.dart';

class PropertiesRecycler extends StatefulWidget {
  PropertiesRecycler({Key key, @required this.propertyList}) : super(key: key);

  final List<Property> propertyList;

  @override
  _PropertiesRecyclerState createState() => _PropertiesRecyclerState();
}

class _PropertiesRecyclerState extends State<PropertiesRecycler> {
  @override
  Widget build(BuildContext context) {
    List<Property> propertyList = widget.propertyList;
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: propertyList.length,
      //Replace with actual number of properties in fetched data
      itemBuilder: (context, i) {
        return PropertiesListItem(
            property: propertyList[
                i]); //Pass index i of snapshot data (list of Property objects)
      },
    ));
  }
}
