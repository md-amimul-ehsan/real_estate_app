import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/agent.dart';
import 'package:real_estate_app/utilities/constants.dart';

const baseURLProp = baseURL + "agents/";

Future<List<Agent>> getAllAgents() async {
  List<Agent> agentList = [];
  try{
    final response = await http.post(Uri.parse(baseURLProp + "getAll"));

    if ( response.statusCode == 200 )
    {
      List<dynamic> data = jsonDecode(response.body)["agents"];
      data.forEach((element) {
        agentList.add(Agent.fromJson(element));
      });
      return agentList;
    }
    //Add checks for the other statusCodes
  }
  catch (e)
  {
    print(e);
  }
}