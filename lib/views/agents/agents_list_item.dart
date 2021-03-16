import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/agent.dart';
import 'package:real_estate_app/utilities/constants.dart';
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
          horizontal: kMainScreenPadding,
          vertical: 5,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 8, 8),
                child: CircleAvatar(
                  radius: 40,
                  foregroundColor: Colors.black,
                  foregroundImage: NetworkImage(
                    widget.agent.img,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.agent.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.agent.title,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
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
