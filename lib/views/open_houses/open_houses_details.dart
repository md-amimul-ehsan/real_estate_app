import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/openhouse.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/agents/agents_details.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';
import 'package:real_estate_app/views/components/title_text_column.dart';
import 'package:real_estate_app/views/properties/properties_details.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

const openHousesImageProportion = 0.4;
const openHousesPanelProportion = 0.6;

class OpenHousesDetails extends StatefulWidget {
  OpenHousesDetails({
    Key key,
    @required this.openhouse,
  }) : super(key: key);

  final Openhouse openhouse;
  @override
  _OpenHousesDetailsState createState() => _OpenHousesDetailsState();
}

class _OpenHousesDetailsState extends State<OpenHousesDetails> {
  @override
  Widget build(BuildContext context) {
    final openhouse = widget.openhouse;
    final property = widget.openhouse.propertyId;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          maxHeight: screenHeight * openHousesPanelProportion,
          boxShadow: [BoxShadow(blurRadius: 0)],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.zero,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * openHousesImageProportion,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              property.img.isNotEmpty
                                  ? property.img.first
                                  : "https://www.realestatebd.com/images/pic8.jpg",
                            ),
                            fit: BoxFit.cover,
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
                        SizedBox(
                          height: screenHeight * 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: kMainScreenPadding,
                            right: kMainScreenPadding,
                          ),
                          child: Text(
                            timestampToNeatTime(openhouse.date.toString()),
                            style: kCardLargeTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: kMainScreenPadding,
                            right: kMainScreenPadding,
                            bottom: 15.0,
                          ),
                          child: Text(
                            property.location,
                            style: kWhiteTextStyle,
                          ),
                        ),
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
                  Row(
                    children: [
                      Text(
                        property.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          child: IconTextHorizontal(
                            title: "Tap to know more",
                            icon: Icons.info,
                            textColor: Colors.black,
                            iconColor: kPrimaryAccentColor,
                          ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PropertiesDetails(property: property);
                            }),
                          );
                        },
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   property.description.isNotEmpty
                  //       ? property.description
                  //       : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Photos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    children: [
                      for (var i in property.img)
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            // "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
                            i,
                            fit: BoxFit.fill,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Contact agent",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return AgentsDetails(agent: property.agentId);
                        }),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            foregroundColor: Colors.black,
                            foregroundImage: NetworkImage(
                              property.agentId.img.isNotEmpty
                                  ? property.agentId.img
                                  : "https://giantbomb1.cbsistatic.com/uploads/scale_medium/1/16944/2427349-426065_10151435086863987_724057164_n.jpg",
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.agentId.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              property.agentId.title,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.phone),
                          color: kPrimaryAccentColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AgentsDetails(agent: property.agentId);
                              }),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.email),
                          color: kPrimaryAccentColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AgentsDetails(agent: property.agentId);
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
