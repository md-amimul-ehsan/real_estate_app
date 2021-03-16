import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const agentsImageProportion = 0.4;
const agentsPanelProportion = 0.6;

class AgentsDetails extends StatefulWidget {
  AgentsDetails({
    Key key,
    @required this.property,
  }) : super(key: key);

  final Property property;
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
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://giantbomb1.cbsistatic.com/uploads/scale_medium/1/16944/2427349-426065_10151435086863987_724057164_n.jpg",
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
                          "Agent name",
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
                    title: 'Active',
                    text: 'true',
                  ),
                  TitleTextColumn(
                    title: 'addbutton1',
                    text: 'button',
                  ),
                  TitleTextColumn(
                    title: 'addbutton2',
                    text: 'chat',
                  ),
                  TitleTextColumn(
                    title: 'contact',
                    text: '123456789',
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

class TitleTextColumn extends StatelessWidget {
  const TitleTextColumn({
    Key key,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
