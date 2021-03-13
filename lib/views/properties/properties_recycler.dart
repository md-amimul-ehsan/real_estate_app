import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/properties.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/properties/properties_list_item.dart';

class PropertiesRecycler extends StatefulWidget {
  @override
  _PropertiesRecyclerState createState() => _PropertiesRecyclerState();
}

class _PropertiesRecyclerState extends State<PropertiesRecycler> {

  Future<void> futureProperty;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: getAllProperties(),
        builder: (BuildContext context, AsyncSnapshot<List<Property>> snapshot) {
          print(snapshot);
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              //Replace with actual number of properties in fetched data
              itemBuilder: (context, i) {
                return propertiesListItem(snapshot.data[i]); //Pass index i of snapshot data (list of Property objects)
              });
        },
      ),
    );
  }
}

