import 'package:flutter/material.dart';
import 'package:real_estate_app/controllers/properties.dart';
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
      child: FutureBuilder(
        future: getAllProperties(),
        builder: (BuildContext context, AsyncSnapshot<List<Property>> snapshot) {
          return Column(
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
                          delegate: snapshot.data != null ? PropertiesSearchDelegate(propertyList: snapshot.data) : PropertiesSearchDelegate()
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
              snapshot.data != null ? PropertiesRecycler(propertyList: snapshot.data) : Text("No property found") //Replace with spinner
            ],
          );
        },
      ),
    );
  }
}

class PropertiesSearchDelegate extends SearchDelegate<Property>
{
  PropertiesSearchDelegate({
    this.propertyList,
  });

  final List<Property> propertyList;
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
    final list = query.isEmpty ? propertyList : propertyList.where((element) => element.name.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(list[i].name),
            onTap: () {
              showResults(context);
              print("$i search item pressed");
            },
          );
        },
    );
  }

}
