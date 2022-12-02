// @dart=2.9

class Magias {
  final String name;
  final String descripcion;

  Magias({this.descripcion, this.name});

  factory Magias.fromJson(Map<String, dynamic> json) {
    return Magias(  
      name: json["name"],
      descripcion: json["description"]
    );
  }
}
