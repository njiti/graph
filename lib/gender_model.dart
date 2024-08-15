import 'dart:convert';

List<GenderModel> genderModelFromJson(String str) => List<GenderModel>.from(json.decode(str).map((x) => GenderModel.fromJson(x)));

String genderModelToJson(List<GenderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenderModel {
  int count;
  String name;
  String gender;
  double probability;

  GenderModel({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
    count: json["count"],
    name: json["name"],
    gender: json["gender"],
    probability: json["probability"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "name": name,
    "gender": gender,
    "probability": probability,
  };
}