import 'package:heroes_app/app/modules/home/models/powerstats_model.dart';

class HeroModel {
  final int id;
  final String name;
  final String image;
  final Powerstats powerstats;

  HeroModel({this.id, this.name, this.image, this.powerstats});

  factory HeroModel.fromJson(Map<String, dynamic> json) => new HeroModel(
      id: json["id"] == null ? null : int.parse(json["id"]),
      name: json["name"] == null ? null : json["name"],
      image: json["image"] == null ? null : json["image"],
      powerstats: json["powerstats"] == null
          ? null
          : Powerstats.fromJson(json["powerstats"]));

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "powerstats": powerstats == null ? null : powerstats,
      };
}
