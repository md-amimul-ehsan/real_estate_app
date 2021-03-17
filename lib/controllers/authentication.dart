import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/user.dart';
import 'package:real_estate_app/utilities/common_functions.dart';
import 'package:real_estate_app/utilities/constants.dart';

const baseURLProp = baseURL + "auth/";

Future<User> loginUser(String email, String pass) async {
  User user;
  try{
    String reqBody = jsonEncode({"email": email, "pass": pass});
    final response = await http.post(Uri.parse(baseURLProp + "login/user"),
        headers: <String, String>
        {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: reqBody,
    );

    if ( response.statusCode == 200 )
    {
      dynamic data = jsonDecode(response.body)["user"];
      String jwt = jsonDecode(response.body)["jwt"];
      user = User.fromJson(data);
      await setLoginDetails(user.id, jwt);
      return user;
    }
    //Add checks for the other statusCodes
  }
  catch (e)
  {
    print(e);
    return null;
  }
}

Future<User> registerUser(String name, String email, String pass) async {
  User user;
  try{

    String reqBody = jsonEncode({"name": name, "email": email, "pass": pass});
    final response = await http.post(Uri.parse(baseURLProp + "signup/user"),
        headers: <String, String>
        {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: reqBody,
    );

    if ( response.statusCode == 200 )
    {
      user = await loginUser(email, pass);
      return user;
    }
    //Add checks for the other statusCodes
  }
  catch (e)
  {
    print(e);
    return null;
  }
}