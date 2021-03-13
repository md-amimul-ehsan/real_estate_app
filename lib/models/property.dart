// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

Property propertyFromJson(String str) => Property.fromJson(json.decode(str));

String propertyToJson(Property data) => json.encode(data.toJson());

class Property {
  Property({
    this.description,
    this.bed,
    this.bath,
    this.pool,
    this.img,
    this.status,
    this.video,
    this.id,
    this.name,
    this.zip,
    this.type,
  });

  String description;
  int bed;
  int bath;
  int pool;
  List<dynamic> img;
  int status;
  String video;
  String id;
  String name;
  String zip;
  String type;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    description: json["description"],
    bed: json["bed"],
    bath: json["bath"],
    pool: json["pool"],
    img: List<dynamic>.from(json["img"].map((x) => x)),
    status: json["status"],
    video: json["video"],
    id: json["_id"],
    name: json["name"],
    zip: json["zip"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "bed": bed,
    "bath": bath,
    "pool": pool,
    "img": List<dynamic>.from(img.map((x) => x)),
    "status": status,
    "video": video,
    "_id": id,
    "name": name,
    "zip": zip,
    "type": type,
  };
}
