import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/dominio/personajes.dart';
import '../dominio/problema.dart';
import 'package:http/http.dart' as http;

String nombrejson = '';
List<dynamic>? nombresAlt;
String? especie;
String? escuela;
String? fechaNac;
int? anioNac;
bool? mago;
String? ancestro;
String? colorOjos;
String? colorCabello;
Map? varita;
String? patronus;
bool? estudianteHowarts;
bool? varitaHowarts;
String? actor;
List<dynamic>? actoresAlt;
bool? vive;
String? imagen;

abstract class RepositorioPersonaje {
  Future<Either<Problema, Personaje>> obtenerPersonaje(NombrePersonaje nombre);
}
class RepositorioPersonajesReales extends RepositorioPersonaje {
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombrePersonaje nombre) async {
    List<Personaje> listaPersonajes = [];
    List<dynamic> json = [];
    String base = 'https://hp-api.onrender.com/api/characters';
    if (listaPersonajes.isEmpty) {
      Uri direccion = Uri.parse(base);
      final respuesta = await http.get(direccion);
      if (respuesta.statusCode != 200) {
      return left(ErrordeJson());
      }
      json = jsonDecode(respuesta.body);
      try {
        listaPersonajes = obtenerListaPersonajes(json);
      } catch (e) {
         return Left(JsonInexistente());
      }
    }
    for (var i = 0; i < listaPersonajes.length; i++) {
      if (listaPersonajes[i].nombre == nombre.valor) {
        return Right(listaPersonajes[i]);
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}

class RepositorioObtenerPersonaje extends RepositorioPersonaje {
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombrePersonaje nombre) async {
    Personaje p;
    String jsonPersonaje = './lib/caracteristicas/data/datos_personaje.json';
    List<dynamic> json;
    try {
      json = lecturaJson(jsonPersonaje);
    } catch (e) {
      return Left(JsonNoEncontrado());
    }
    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.valor) {
          nombrejson = json[i]['name'];
          nombresAlt = json[i]['alternate_names'];
          especie = json[i]['species'];
          escuela = json[i]['house'];
          fechaNac = json[i]['dateOfBirth'];
          anioNac = json[i]['yearOfBirth'];
          mago = json[i]['wizard'];
          ancestro = json[i]['ancestry'];
          colorOjos = json[i]['eyeColour'];
          colorCabello = json[i]['hairColour'];
          varita = json[i]['wand'];
          patronus = json[i]['patronus'];
          estudianteHowarts = json[i]['hogwartsStudent'];
          varitaHowarts = json[i]['hogwartsStaff'];
          actor = json[i]['actor'];
          actoresAlt = json[i]['alternate_actors'];
          vive = json[i]['alive'];
          imagen = json[i]['image'];
          p = Personaje.constructor(
              nombre: nombrejson,
              actor: actor,
              actoresAlt: actoresAlt,
              ancestro: ancestro,
              anioNac: anioNac,
              colorCabello: colorCabello,
              colorOjos: colorOjos,
              escuela: escuela,
              especie: especie,
              estudianteHowarts: estudianteHowarts,
              fechaNac: fechaNac,
              mago: mago,
              nombresAlt: nombresAlt,
              imagen: imagen,
              patronus: patronus,
              varita: varita,
              varitaHowarts: varitaHowarts,
              vive: vive);
          return Right(p);
        }
      } catch (e) {
        return Left(JsonInexistente());
      }
    }
    return Left(PersonajeNoEncontrado());
  }
}
List<dynamic> lecturaJson(String rutaJson) {
  List<dynamic> json;
  json = jsonDecode((File(rutaJson).readAsStringSync()));
  return json;
}

List<Personaje> obtenerListaPersonajes(List<dynamic> json)  {
  List<Personaje> listaPersonajes = [];
  Personaje p;
  for (var i = 0; i < json.length; i++) {
      nombrejson = json[i]['name'];
      nombresAlt = json[i]['alternate_names'];
      especie = json[i]['species'];
      escuela = json[i]['house'];
      fechaNac = json[i]['dateOfBirth'];
      anioNac = json[i]['yearOfBirth'];
      mago = json[i]['wizard'];
      ancestro = json[i]['ancestry'];
      colorOjos = json[i]['eyeColour'];
      colorCabello = json[i]['hairColour'];
      varita = json[i]['wand'];
      patronus = json[i]['patronus'];
      estudianteHowarts = json[i]['hogwartsStudent'];
      varitaHowarts = json[i]['hogwartsStaff'];
      actor = json[i]['actor'];
      actoresAlt = json[i]['alternate_actors'];
      vive = json[i]['alive'];
      imagen = json[i]['image'];
      p = Personaje.constructor(
          nombre: nombrejson,
          actor: actor,
          actoresAlt: actoresAlt,
          ancestro: ancestro,
          anioNac: anioNac,
          colorCabello: colorCabello,
          colorOjos: colorOjos,
          escuela: escuela,
          especie: especie,
          estudianteHowarts: estudianteHowarts,
          fechaNac: fechaNac,
          mago: mago,
          nombresAlt: nombresAlt,
          imagen: imagen,
          patronus: patronus,
          varita: varita,
          varitaHowarts: varitaHowarts,
          vive: vive);
      listaPersonajes.add(p);
  }
  return listaPersonajes;
}