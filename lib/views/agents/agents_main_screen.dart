import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/properties.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/agents/agents_list_item.dart';

class AgentsScreen extends StatefulWidget {
  @override
  _AgentsScreenState createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getAllProperties(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Property>> snapshot) {
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
                    "Agents",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 10
              ),
              snapshot.data != null // Replace with agents recycler
                  ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return agentsListItem(
                            snapshot.data[i],
                          );
                        },
                      ),
                  )
                  : Text("No agent found"),
            ],
          );
        },
      ),
    );
  }
}
