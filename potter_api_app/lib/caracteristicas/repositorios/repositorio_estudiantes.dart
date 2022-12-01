import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import '../dominio/personajes.dart';
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

String jsonEstudiante = './lib/caracteristicas/data/datos_estudiantes.json';
List<dynamic> json = [];
List<Personaje> listaEstudiantes = [];

abstract class RepoEstudiante {
  Future<Either<Problema, Personaje>> obtenerEstudiante(NombrePersonaje nombre);
}

class RepositorioEstudiantes extends RepoEstudiante {
  @override
  Future<Either<Problema, Personaje>> obtenerEstudiante(
      NombrePersonaje nombre) async {
    String base = 'https://hp-api.onrender.com/api/characters';
    if (listaEstudiantes.isEmpty) {
      Uri direccion = Uri.parse(base);
      final respuesta = await http.get(direccion);
      if (respuesta.statusCode != 200) {
        return left(ErrordeJson());
      }
      json = jsonDecode(respuesta.body);
      try {
        listaEstudiantes = obtenerListaEstudiantes(json);
      } catch (e) {
        return Left(JsonInexistente());
      }
    }
    for (var i = 0; i < listaEstudiantes.length; i++) {
      if (listaEstudiantes[i].estudianteHowarts == false) {
        return Left(NoEsEstudiante());
      }
      if (listaEstudiantes[i].nombre == nombre.valor) {
        return Right(listaEstudiantes[i]);
      }
    }
    return Left(EstudianteNoEsta());
  }
}

class RepositorioEstudiantesPruebas extends RepoEstudiante {
  @override
  Future<Either<Problema, Personaje>> obtenerEstudiante(
      NombrePersonaje nombre) async {
    if (listaEstudiantes.isEmpty) {
      try {
        json = leeJson(jsonEstudiante);
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
    }
    try {
      listaEstudiantes = obtenerListaEstudiantes(json);
      for (var i = 0; i < listaEstudiantes.length; i++) {
        if (listaEstudiantes[i].estudianteHowarts == false) {
          return Left(NoEsEstudiante());
        }
        if (listaEstudiantes[i].nombre == nombre.valor) {
          return Right(listaEstudiantes[i]);
        }
      }
    } catch (e) {
      return Left(JsonInexistente());
    }
    return Left(EstudianteNoEsta());
  }
}

List<dynamic> leeJson(String rutaJson) {
  List<dynamic> json;
  json = jsonDecode((File(rutaJson).readAsStringSync()));
  return json;
}

List<Personaje> obtenerListaEstudiantes(List<dynamic> json) {
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