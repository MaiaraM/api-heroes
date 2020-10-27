import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heroes_app/app/modules/home/home_controller.dart';
import 'package:heroes_app/app/modules/home/models/hero.dart';

import 'home_controller.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  final homeController = Modular.get<HomeController>();
  HeroModel hero;

  @override
  void initState() {
    super.initState();
    if (homeController.hero != null) {
      hero = homeController.hero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.name),
        backgroundColor: Colors.green,
        elevation: 3,
      ),
      backgroundColor: Colors.grey[900],
      body: hero != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shadowColor: Colors.green,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Hero(
                          tag: hero.id,
                          child: Image.network(
                            hero.image,
                            width: 250,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 0),
                          child: Text(hero.name),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(child: Text("Error")),
    );
  }
}
