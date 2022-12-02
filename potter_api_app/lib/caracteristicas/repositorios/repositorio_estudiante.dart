// @dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/dominio/magias.dart';
import 'package:potter_api_app/caracteristicas/dominio/personaje.dart';


class PersonajesService {
  Future<List<Personajes>>  obtenerPersonajes() async {
    var url = Uri.parse("https://hp-api.onrender.com/api/characters");
    List<Personajes> list = List<Personajes>.empty();
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Personajes>((item) => Personajes.fromJson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    }else{
      return null;
    }
  }
}

class EstudiantesService {
  Future<List<Personajes>>  obtenerEstudiantes() async {
    var url = Uri.parse("https://hp-api.onrender.com/api/characters/students");
    List<Personajes> list = List<Personajes>.empty();
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Personajes>((item) => Personajes.fromJson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    }else{
      return null;
    }
  }
}

class MagiaService {
  Future<List<Magias>> obtenerMagias() async {
    var url = Uri.parse("https://hp-api.onrender.com/api/spells");
    List<Magias> list = List<Magias>.empty();
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Magias>((item) => Magias.fromJson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    }else{
      return null;
    }
  }
}