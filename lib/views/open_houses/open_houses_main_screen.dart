import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/openhouses.dart';
import 'package:real_estate_app/models/openhouse.dart';
import 'package:real_estate_app/views/open_houses/open_houses_recycler.dart';

class OpenHousesScreen extends StatefulWidget {
  @override
  _OpenHousesScreenState createState() => _OpenHousesScreenState();
}

class _OpenHousesScreenState extends State<OpenHousesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getAllOpenhouses(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Openhouse>> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.search,
                  //     color: Colors.black,
                  //   ),
                  //   onPressed: () {
                  //     showSearch(
                  //         context: context,
                  //         delegate: snapshot.data != null ? PropertiesSearchDelegate(propertyList: snapshot.data) : PropertiesSearchDelegate()
                  //     );
                  //   },
                  //   iconSize: 30,
                  // ),
                  Text(
                    "Open Houses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              snapshot.data != null
                  ? OpenHousesRecycler(openhouseList: snapshot.data)
                  : Text("No open house found"),
            ],
          );
        },
      ),
    );
  }
}
