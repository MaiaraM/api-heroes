import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heroes_app/app/modules/home/hero_page.dart';
import 'package:heroes_app/app/modules/home/home_controller.dart';
import 'package:heroes_app/app/modules/home/home_page.dart';
import 'package:heroes_app/app/modules/home/repositories/hero_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<Herorepository>())),
        Bind((i) => Herorepository(i.get<Dio>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter('/hero', child: (_, args) => HeroPage()),
      ];
}
