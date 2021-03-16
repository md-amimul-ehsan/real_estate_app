import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/agent.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/title_text_column.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const agentsImageProportion = 0.4;
const agentsPanelProportion = 0.6;

class AgentsDetails extends StatefulWidget {
  AgentsDetails({
    Key key,
    @required this.agent,
  }) : super(key: key);

  final Agent agent;
  @override
  _AgentsDetailsState createState() => _AgentsDetailsState();
}

class _AgentsDetailsState extends State<AgentsDetails> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          maxHeight: screenHeight * agentsPanelProportion,
          boxShadow: [BoxShadow(blurRadius: 0)],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.zero,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * agentsImageProportion,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.agent.img,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_left,
                              color: Colors.white, size: 50),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          defaultPanelState: PanelState.OPEN,
          isDraggable: false,
          panelBuilder: (scrollController) => SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            controller: scrollController,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text(
                          widget.agent.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.phone),
                          color: kPrimaryAccentColor,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.email),
                          color: kPrimaryAccentColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  TitleTextColumn(
                    title: 'Title',
                    text: widget.agent.title,
                  ),
                  TitleTextColumn(
                    title: 'Status',
                    text: widget.agent.active ? "Active" : "Inactive",
                    textColor: widget.agent.active ? Colors.green : Colors.red,
                  ),
                  TitleTextColumn(
                    title: 'Email',
                    text: widget.agent.email,
                  ),
                  TitleTextColumn(
                    title: 'Contact',
                    text: widget.agent.phone,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
