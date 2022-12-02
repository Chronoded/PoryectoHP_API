// @dart=2.9
class Personajes {
  final String name;
  final String house;
  final bool isStudent;
  final String actor;
  final String image;
  final String patronus;

  Personajes ({this.actor,this.house, this.image,this.isStudent, this.name, this.patronus});

  factory Personajes.fromJson(Map<String, dynamic> json) {
    return Personajes(  
      actor: json["actor"],
      house: json["house"],
      image: json["image"],
      isStudent: json["hogwartsStudent"],
      name: json["name"],
      patronus: json["patronus"]
    );
  }
}
