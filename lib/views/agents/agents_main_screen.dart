import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/properties.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/agents/agents_list_item.dart';
import 'package:real_estate_app/views/properties/properties_list_item.dart';

class AgentsScreen extends StatefulWidget {
  @override
  _AgentsScreenState createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getAllProperties(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Property>> snapshot) {
                return snapshot.data != null
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        //Replace with actual number of properties in fetched data
                        itemBuilder: (context, i) {
                          return agentsListItem(
                            snapshot.data[i],
                          ); //Pass index i of snapshot data (list of Property objects)
                        })
                    : Text("No property found"); //Replace with spinner
              },
            ),
          ),
        ],
      ),
    );
  }
}
