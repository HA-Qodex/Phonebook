// To parse this JSON data, do
//
//     final contactData = contactDataFromJson(jsonString);

import 'dart:convert';

ContactData contactDataFromJson(String str) => ContactData.fromJson(json.decode(str));

String contactDataToJson(ContactData data) => json.encode(data.toJson());

class ContactData {
  ContactData({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.altrphone,
    this.email,
    this.blood,
    this.address,
    this.relation,
    this.favourite,
  });

  int? id;
  String? name;
  String? image;
  String? phone;
  String? altrphone;
  String? email;
  String? blood;
  String? address;
  String? relation;
  int? favourite;

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
    altrphone: json["altrphone"],
    email: json["email"],
    blood: json["blood"],
    address: json["address"],
    relation: json["relation"],
    favourite: json["favourite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "phone": phone,
    "altrphone": altrphone,
    "email": email,
    "blood": blood,
    "address": address,
    "relation": relation,
    "favourite": favourite,
  };
}
