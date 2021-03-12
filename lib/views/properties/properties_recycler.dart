import 'package:flutter/material.dart';

class PropertiesRecycler extends StatefulWidget {
  @override
  _PropertiesRecyclerState createState() => _PropertiesRecyclerState();
}

class _PropertiesRecyclerState extends State<PropertiesRecycler> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10, //Replace with actual number of properties in fetched data
          itemBuilder: (context, i) {
            return propertiesAdapter(); //Pass index i of snapshot data (list of Property objects)
          }),
    );
  }
}

Widget propertiesAdapter() //Include Property object as parameter
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
      title: Text('Title'), //Replace with actual property name
      subtitle: Text('Subtitle'), //Replace with actual property description
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

