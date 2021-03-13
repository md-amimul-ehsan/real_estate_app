import 'package:flutter/material.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/agents/agents_main_screen.dart';
import 'package:real_estate_app/views/agents/agents_details.dart';
import 'package:real_estate_app/views/properties/properties_details.dart';
import 'package:real_estate_app/views/properties/properties_main_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PropertiesScreen(), //For testing purposes
    PropertiesDetails(),
    AgentsScreen(),
    AgentsDetails(),
    // Text(
    //   'Index 3: Inside Walkthrough',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Properties',
            backgroundColor: kPrimaryAccentColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Open Houses',
            backgroundColor: kPrimaryAccentColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Agents',
            backgroundColor: kPrimaryAccentColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Inside Walkthrough',
            backgroundColor: kPrimaryAccentColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
