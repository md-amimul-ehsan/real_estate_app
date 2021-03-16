import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/agent.dart';
import 'package:real_estate_app/views/agents/agents_details.dart';

class AgentsListItem extends StatefulWidget {
  AgentsListItem({
    Key key,
    @required this.agent,
  }) : super(key: key);

  final Agent agent;
  @override
  _AgentsListItemState createState() => _AgentsListItemState();
}

class _AgentsListItemState extends State<AgentsListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return AgentsDetails(agent: widget.agent);
          }),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  foregroundColor: Colors.black,
                  foregroundImage: NetworkImage(
                    widget.agent.img,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.agent.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    widget.agent.title,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
