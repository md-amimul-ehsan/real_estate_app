import 'package:flutter/material.dart';

class PropertiesRecycler extends StatefulWidget {
  @override
  _PropertiesRecyclerState createState() => _PropertiesRecyclerState();
}

class _PropertiesRecyclerState extends State<PropertiesRecycler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return propertiesAdapter();
          }),
    );
  }
}

Widget propertiesAdapter()
{
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    elevation: 5,
    child: ListTile(
      leading: Image(
        image: NetworkImage("https://www.realestatebd.com/images/pic8.jpg"),
      ),
      title: Text('Title'),
      subtitle: Text('Subtitle'),
      onLongPress: () {
        print('Long Pressed');
      },
      onTap: () {
        print('Tapped');
      },
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.greenAccent,
      ),
    ),
  );
}

