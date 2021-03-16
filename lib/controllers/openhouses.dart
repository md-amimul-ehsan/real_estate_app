import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/openhouse.dart';
import 'package:real_estate_app/utilities/constants.dart';

const baseURLProp = baseURL + "openhouses/";

Future<List<Openhouse>> getAllOpenhouses() async {
  List<Openhouse> openhouseList = [];
  try {
    final response =
        await http.post(Uri.parse(baseURLProp + "getAllOpenhouses"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)["openhouses"];
      data.forEach((element) {
        openhouseList.add(Openhouse.fromJson(element));
      });
      return openhouseList;
    }
    //Add checks for the other statusCodes
  } catch (e) {
    print(e);
  }
}
