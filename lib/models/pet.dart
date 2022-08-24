// To parse this JSON data, do
//
//     final ReqPetResponse = ReqPetResponseFromJson(jsonString);

import 'dart:convert';

ReqPetResponse reqPetResponseFromJson(String str) =>
    ReqPetResponse.fromJson(json.decode(str));

String dataToJson(ReqPetResponse data) => json.encode(data.toJson());

class ReqPetResponse {
  List<Pet> data;

  ReqPetResponse({
    this.data,
  });

  factory ReqPetResponse.fromJson(Map<String, dynamic> json) => ReqPetResponse(
        data: List<Pet>.from(json["data"].map((x) => Pet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Pet {
  Pet({
    this.id,
    this.name,
    this.slug,
    this.color,
    this.image,
  });

  int id;
  String name;
  String slug;
  String color;
  String image;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        color: json["color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "color": color,
        "image": image,
      };
}
