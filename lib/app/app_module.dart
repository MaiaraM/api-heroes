import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heroes_app/app/app_widget.dart';
import 'package:heroes_app/app/modules/home/home_module.dart';
import 'package:heroes_app/app/modules/home/home_page.dart';
import 'package:heroes_app/app/shared/utils/consts.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          module: HomeModule(),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();
}
