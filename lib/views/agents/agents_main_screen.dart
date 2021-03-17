import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/agents.dart';
import 'package:real_estate_app/models/agent.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/agents/agents_recycler.dart';

class AgentsScreen extends StatefulWidget {
  @override
  _AgentsScreenState createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getAllAgents(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Agent>> snapshot) {
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
              SizedBox(height: 10),
              snapshot.data != null
                  ? AgentsRecycler(agentList: snapshot.data)
                  : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(kPrimaryAccentColor),)),
            ],
          );
        },
      ),
    );
  }
}
