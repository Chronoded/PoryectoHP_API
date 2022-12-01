import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/dominio/personajes.dart';
import '../dominio/problema.dart';
import 'package:http/http.dart' as http;

abstract class RepositorioPersonaje {
  Future<Either<Problema, Personaje>> obtenerPersonaje(NombrePersonaje nombre);
}

class RepositorioPersonajesReales extends RepositorioPersonaje {
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(
      NombrePersonaje nombre) async {
    Personaje p;
    String base = 'https://hp-api.onrender.com/api/characters';
    Uri direccion = Uri.parse(base);
    final respuesta = await http.get(direccion);
    if (respuesta.statusCode != 200) {
      return left(ErrordeJson());
    }
    List<dynamic> json = jsonDecode(respuesta.body);
    String nombrejson;
    List<dynamic> nombresAlt;
    String especie;
    String escuela;
    String fechaNac;
    int anioNac;
    bool mago;
    String ancestro;
    String colorOjos;
    String colorCabello;
    Map varita;
    String patronus;
    bool estudianteHowarts;
    bool varitaHowarts;
    String actor;
    List<dynamic> actoresAlt;
    bool vive;
    String imagen;
    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.nombre) {
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


class RepositorioObtenerPersonaje extends RepositorioPersonaje {
  @override
  Future<Either<Problema, Personaje>> obtenerPersonaje(NombrePersonaje nombre) async {
    Personaje p;
    String jsonPersonaje = './lib/caracteristicas/data/datos_personaje.json';
    List<dynamic> json;
    try {
      json = lecturaJson((File(jsonPersonaje).readAsStringSync()));
    } catch (e) {
      return Left(JsonNoEncontrado());
    }
    String nombrejson;
    List<dynamic> nombresAlt;
    String especie;
    String escuela;
    String fechaNac;
    int anioNac;
    bool mago;
    String ancestro;
    String colorOjos;
    String colorCabello;
    Map varita;
    String patronus;
    bool estudianteHowarts;
    bool varitaHowarts;
    String actor;
    List<dynamic> actoresAlt;
    bool vive;
    String imagen;
    for (var i = 0; i < json.length; i++) {
      try {
        if (json[i]["name"] == nombre.nombre) {
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

  List<dynamic> lecturaJson(String rutaJson) {
    List<dynamic> json;
    json = jsonDecode((File(rutaJson).readAsStringSync()));
    return json;
  }
}