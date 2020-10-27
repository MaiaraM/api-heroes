import 'package:heroes_app/app/modules/home/models/hero.dart';
import 'package:heroes_app/app/modules/home/repositories/hero_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final Herorepository repository;

  @observable
  ObservableFuture<List<HeroModel>> heroes;

  @observable
  HeroModel hero;

  _HomeController(this.repository);

  @action
  getHeroesByName(String name) {
    heroes = repository.getHeroByName(name).asObservable();
  }

  @action
  setHero(HeroModel hero) {
    this.hero = hero;
  }

  @action
  clean() {
    heroes = null;
  }
}
