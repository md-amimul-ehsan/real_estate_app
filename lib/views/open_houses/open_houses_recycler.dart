import 'package:flutter/material.dart';
import 'package:real_estate_app/models/openhouse.dart';
import 'package:real_estate_app/views/open_houses/open_houses_list_item.dart';

class OpenHousesRecycler extends StatefulWidget {
  OpenHousesRecycler({Key key, @required this.openhouseList}) : super(key: key);

  final List<Openhouse> openhouseList;
  @override
  _OpenHousesRecyclerState createState() => _OpenHousesRecyclerState();
}

class _OpenHousesRecyclerState extends State<OpenHousesRecycler> {
  @override
  Widget build(BuildContext context) {
    List<Openhouse> openhouseList = widget.openhouseList;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: openhouseList.length,
        itemBuilder: (context, i) {
          return OpenHousesListItem(openhouse: openhouseList[i]);
        },
      ),
    );
  }
}
