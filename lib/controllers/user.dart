import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/user.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/utilities/constants.dart';

const baseURLProp = baseURL + "users/";

Future<User> getUserByOnDeviceId() async {
  User user;
  try{
    List<String> loginCredentials = await getLoginCredentials();
    String uid = loginCredentials[0];
    String reqBody = jsonEncode({"userId": uid});
    final response = await http.post(Uri.parse(baseURLProp + "getById"),
      headers: <String, String>
      {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: reqBody,
    );

    if ( response.statusCode == 200 )
    {
      dynamic data = jsonDecode(response.body)["user"];
      user = User.fromJson(data);
      return user;
    }
    //Add checks for the other statusCodes
  }
  catch (e)
  {
    print(e);
  }
}