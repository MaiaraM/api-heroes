class Powerstats {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  Powerstats(
      {this.intelligence,
      this.strength,
      this.speed,
      this.durability,
      this.power,
      this.combat});

  factory Powerstats.fromJson(Map<String, dynamic> json) => new Powerstats(
        intelligence:
            json["intelligence"] == null ? null : json["intelligence"],
        strength: json["strength"] == null ? null : json["strength"],
        speed: json["speed"] == null ? null : json["speed"],
        durability: json["durability"] == null ? null : json["durability"],
        power: json["power"] == null ? null : json["power"],
        combat: json["combat"] == null ? null : json["combat"],
      );

  Map<String, dynamic> toJson() => {
        "intelligence": intelligence == null ? null : intelligence,
        "strength": strength == null ? null : strength,
        "speed": speed == null ? null : speed,
        "durability": durability == null ? null : durability,
        "combat": power == null ? null : combat
      };
}
