import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/agents/agents_list_item.dart';

class AgentsRecycler extends StatefulWidget {
  AgentsRecycler({Key key, @required this.propertyList}) : super(key: key);

  final List<Property> propertyList;
  @override
  _AgentsRecyclerState createState() => _AgentsRecyclerState();
}

class _AgentsRecyclerState extends State<AgentsRecycler> {
  @override
  Widget build(BuildContext context) {
    List<Property> propertyList = widget.propertyList;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: propertyList.length,
        itemBuilder: (context, i) {
          return AgentsListItem(property: propertyList[i]);
        },
      ),
    );
  }
}
