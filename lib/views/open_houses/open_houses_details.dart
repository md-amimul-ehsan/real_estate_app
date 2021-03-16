import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const openHousesImageProportion = 0.4;
const openHousesPanelProportion = 0.6;

class OpenHousesDetails extends StatefulWidget {
  OpenHousesDetails({
    Key key,
    @required this.property,
  }) : super(key: key);

  final Property property;
  @override
  _OpenHousesDetailsState createState() => _OpenHousesDetailsState();
}

class _OpenHousesDetailsState extends State<OpenHousesDetails> {
  @override
  Widget build(BuildContext context) {
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
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://www.realestatebd.com/images/pic8.jpg",
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
                        Spacer(
                          flex: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: kMainScreenPadding,
                            right: kMainScreenPadding,
                          ),
                          child: Text(
                            "Open house date - time",
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
                            'Open house address/details',
                            style: kWhiteTextStyle,
                          ),
                        ),
                        Spacer(
                          flex: 1,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Property name",
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
                    title: 'Date',
                    text: 'button',
                  ),
                  TitleTextColumn(
                    title: 'Address',
                    text: 'chat',
                  ),
                  TitleTextColumn(
                    title: 'Bedroom',
                    text: '3',
                  ),
                  TitleTextColumn(
                    title: 'Bathroom',
                    text: '2',
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
