import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heroes_app/app/modules/home/home_controller.dart';
import 'package:heroes_app/app/modules/home/models/hero.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  final searchHero = new TextEditingController();
  Timer _debounce;
  String searchName = "";

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchHero.text.isNotEmpty && searchHero.text != searchName) {
        searchName = searchHero.text;
        homeController.getHeroesByName(searchHero.text);
      } else if (searchHero.text.isEmpty) homeController.clean();
    });
  }

  @override
  void initState() {
    super.initState();
    searchHero.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchHero.removeListener(_onSearchChanged);
    searchHero.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heroes Cards"),
        backgroundColor: Colors.green,
        elevation: 3,
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                color: Colors.green,
              ),
              decoration: new InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.green),
                ),
                filled: true,
                contentPadding:
                    EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                hintText: 'Procure seu Herói/Vilão',
              ),
              cursorColor: Colors.green,
              controller: searchHero,
            ),
            Observer(builder: (_) {
              if (homeController.heroes == null)
                return SizedBox(
                  height: 20,
                );
              if (homeController.heroes.value == null) {
                return Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return ListHeroes(homeController.heroes.value, homeController);
              }
            })
          ],
        ),
      ),
    );
  }
}

class ListHeroes extends StatelessWidget {
  List<HeroModel> heroes;
  HomeController homeController;

  ListHeroes(this.heroes, this.homeController);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: heroes.length,
            padding: const EdgeInsets.only(top: 16),
            itemBuilder: (context, i) {
              return Hero(
                tag: heroes[i].id,
                child: InkWell(
                  onTap: () => {
                    homeController.setHero(heroes[i]),
                    Modular.to.pushNamed('/hero'),
                  },
                  child: Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Image.network(
                          heroes[i].image,
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Id: "),
                                  Text("${heroes[i].id}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Nome: "),
                                  Text(heroes[i].name),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
