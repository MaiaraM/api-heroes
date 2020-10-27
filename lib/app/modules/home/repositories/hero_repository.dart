import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heroes_app/app/modules/home/models/hero.dart';

class Herorepository {
  final Dio dio;

  Herorepository(this.dio);

  Future<List<HeroModel>> getHeroByName(name) async {
    try {
      var response = await dio.get("heroes/search/${name}");
      List<HeroModel> list = [];
      for (var json in (response.data as List)) {
        HeroModel model = HeroModel.fromJson(json);
        list.add(model);
      }
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
