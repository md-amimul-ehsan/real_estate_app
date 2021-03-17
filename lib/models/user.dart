// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.img,
    this.id,
    this.name,
    this.email,
  });

  String img;
  String id;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
    img: json["img"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "_id": id,
    "name": name,
    "email": email,
  };
}
