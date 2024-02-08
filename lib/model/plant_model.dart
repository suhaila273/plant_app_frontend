// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';

List<Plant> plantFromJson(String str) => List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
  String name;
  String type;
  String qty;
  String price;

  Plant({
    required this.name,
    required this.type,
    required this.qty,
    required this.price,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    name: json["name"],
    type: json["type"],
    qty: json["qty"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "qty": qty,
    "price": price,
  };
}
