// To parse this JSON data, do
//
//     final agent = agentFromJson(jsonString);

import 'dart:convert';

Agent agentFromJson(String str) => Agent.fromJson(json.decode(str));

String agentToJson(Agent data) => json.encode(data.toJson());

class Agent {
  Agent({
    this.title,
    this.phone,
    this.img,
    this.active,
    this.id,
    this.name,
    this.email,
  });

  String title;
  String phone;
  String img;
  bool active;
  String id;
  String name;
  String email;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
    title: json["title"],
    phone: json["phone"],
    img: json["img"],
    active: json["active"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "phone": phone,
    "img": img,
    "active": active,
    "_id": id,
    "name": name,
    "email": email,
  };
}
