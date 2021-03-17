import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String timestampToNeatTime(String timestamp, )
{
  final dateTime = DateTime.parse(timestamp);

  final format = DateFormat("dd MMMM, HH:mm a");
  final clockString = format.format(dateTime);

  return clockString;
}

Future<bool> checkIfUserLoggedIn() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if ( prefs.containsKey("UID") ) {
      return true;
    } else if ( prefs.getString("UID") == null ){
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<void> setLoginDetails(String uid, String jwt) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("UID", uid);
    await prefs.setString("JWT", jwt);
  } catch (e) {
    print("Error storing login credentials");
  }
}

Future<void> removeLoginDetails() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("UID");
    prefs.remove("JWT");
  } catch (e) {
    print("Error removing login credentials");
  }
}

void showSnackbar(dynamic icon, String message, dynamic color, BuildContext context) {
  SnackBar mySnackbar = SnackBar(
      duration: Duration(seconds: 2),
      content: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: color);
  ScaffoldMessenger.of(context).showSnackBar(mySnackbar);
}

Future<List<String>> getLoginCredentials() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("UID");
    String jwt = prefs.getString("JWT");
    return [uid, jwt];
  } catch (e) {
    print("Error getting login credentials");
  }
}