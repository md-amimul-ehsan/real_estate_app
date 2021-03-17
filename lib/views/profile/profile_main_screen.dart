import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/user.dart';
import 'package:real_estate_app/models/user.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/auth/landing_screen.dart';
import 'package:real_estate_app/views/components/title_text_column.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfileMainScreen extends StatefulWidget {
  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(
        future: getUserByOnDeviceId(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? SafeArea(
                  child: SlidingUpPanel(
                    maxHeight: screenHeight * personImageProportion,
                    boxShadow: [BoxShadow(blurRadius: 0)],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.zero,
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight * (personImageProportion + 0.1),
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
                                        snapshot.data.img.isNotEmpty
                                            ? snapshot.data.img
                                            : "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    IconButton(
                                      icon: Icon(Icons.logout,
                                          color: Colors.white, size: 40),
                                      onPressed: () async {
                                        await removeLoginDetails();
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return LandingScreen();
                                          }),
                                        );
                                      },
                                    ),
                                  ],
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
                                    snapshot.data.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TitleTextColumn(
                              title: 'Email',
                              text: snapshot.data.email,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(kPrimaryAccentColor),
                ));
        },
      ),
    );
  }
}
