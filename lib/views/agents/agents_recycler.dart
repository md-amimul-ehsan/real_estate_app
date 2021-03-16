import 'package:flutter/material.dart';
import 'package:real_estate_app/models/agent.dart';
import 'package:real_estate_app/views/agents/agents_list_item.dart';

class AgentsRecycler extends StatefulWidget {
  AgentsRecycler({Key key, @required this.agentList}) : super(key: key);

  final List<Agent> agentList;
  @override
  _AgentsRecyclerState createState() => _AgentsRecyclerState();
}

class _AgentsRecyclerState extends State<AgentsRecycler> {
  @override
  Widget build(BuildContext context) {
    List<Agent> agentList = widget.agentList;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: agentList.length,
        itemBuilder: (context, i) {
          return AgentsListItem(agent: agentList[i]);
        },
      ),
    );
  }
}
