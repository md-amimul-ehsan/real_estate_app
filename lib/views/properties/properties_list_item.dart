import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';

Widget propertiesListItem(Property property) //Include Property object as parameter
{
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    elevation: 5,
    child: ListTile(
      leading: Image(
        image: NetworkImage("https://www.realestatebd.com/images/pic8.jpg"), //Replace with actual image URL
      ),
      title: Text(property.name), //Replace with actual property name
      subtitle: Text(property.description), //Replace with actual property description
      onLongPress: () {
        print('Long Pressed'); //Think of something to do here
      },
      onTap: () {
        print('Tapped'); //Take user to property_details screen
      },
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.greenAccent,
      ),
    ),
  );
}