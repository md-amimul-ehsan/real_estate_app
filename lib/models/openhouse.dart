// To parse this JSON data, do
//
//     final openhouse = openhouseFromJson(jsonString);

import 'dart:convert';

import 'package:real_estate_app/models/property.dart';

Openhouse openhouseFromJson(String str) => Openhouse.fromJson(json.decode(str));

String openhouseToJson(Openhouse data) => json.encode(data.toJson());

class Openhouse {
  Openhouse({
    this.id,
    this.date,
    this.propertyId,
  });

  String id;
  DateTime date;
  Property propertyId;

  factory Openhouse.fromJson(Map<String, dynamic> json) => Openhouse(
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        propertyId: Property.fromJson(json["propertyId"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date.toIso8601String(),
        "propertyId": propertyId.toJson(),
      };
}
