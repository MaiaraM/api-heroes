// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$heroesAtom = Atom(name: '_HomeController.heroes');

  @override
  ObservableFuture<List<HeroModel>> get heroes {
    _$heroesAtom.reportRead();
    return super.heroes;
  }

  @override
  set heroes(ObservableFuture<List<HeroModel>> value) {
    _$heroesAtom.reportWrite(value, super.heroes, () {
      super.heroes = value;
    });
  }

  final _$heroAtom = Atom(name: '_HomeController.hero');

  @override
  HeroModel get hero {
    _$heroAtom.reportRead();
    return super.hero;
  }

  @override
  set hero(HeroModel value) {
    _$heroAtom.reportWrite(value, super.hero, () {
      super.hero = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic getHeroesByName(String name) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.getHeroesByName');
    try {
      return super.getHeroesByName(name);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHero(HeroModel hero) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setHero');
    try {
      return super.setHero(hero);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clean() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.clean');
    try {
      return super.clean();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heroes: ${heroes},
hero: ${hero}
    ''';
  }
}
