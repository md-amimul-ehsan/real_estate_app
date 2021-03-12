import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/properties/properties_recycler.dart';

class PropertiesScreen extends StatefulWidget {
  @override
  _PropertiesScreenState createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: PropertiesSearchDelegate()
                  );
                },
                iconSize: 30,
              ),
              Text("Properties",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10
          ),
          PropertiesRecycler()
        ],
      ),
    );
  }
}

class PropertiesSearchDelegate extends SearchDelegate<Property>
{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = ""; //Clear query string
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.keyboard_arrow_left),
        onPressed: (){
          close(context, null);
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Navigate to property details screen with result
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Obtain list of properties from controller
    // Sort by query
    // query.isEmpty ? list : list.where( ( prop ) => prop.name.toLowercase().startsWith(query.toLowercase()) ).toList();
    // Handle case when there are no matches
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text("Search item $i"),
            onTap: () {
              showResults(context);
              print("$i search item pressed");
            },
          );
        },
    );
  }

}
