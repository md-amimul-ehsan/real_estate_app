import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/views/utilities/constants.dart';

const baseURLProp = baseURL + "props/";

Future<List<Property>> getAllProperties() async {
  List<Property> propertyList = [];
  try{
    final response = await http.post(Uri.parse(baseURLProp + "getAllProp"));

    if ( response.statusCode == 200 )
      {
        List<dynamic> data = jsonDecode(response.body)["props"];
        data.forEach((element) {
          propertyList.add(Property.fromJson(element));
        });
        return propertyList;
      }
    //Add checks for the other statusCodes
  }
  catch (e)
  {
    print(e);
  }
}