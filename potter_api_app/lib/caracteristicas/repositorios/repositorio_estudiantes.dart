import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';
import '../dominio/personajes.dart';
import '../dominio/problema.dart';


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
  late RepositorioPruebaJson constructor;
  RepoEstudiante (this.constructor);
  Future<Either<Problema, Personaje>> obtenerEstudiante(NombrePersonaje nombre);
}

class RepositorioEstudiantes extends RepoEstudiante {
  RepositorioEstudiantes(super.constructor);
  @override
  Future<Either<Problema, Personaje>> obtenerEstudiante(
      NombrePersonaje nombre) async {
    String base = 'https://hp-api.onrender.com/api/characters/students';
    if (listaEstudiantes.isEmpty) {
      var resultado = await constructor.obtenerDatos('online', base);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        listaEstudiantes = obtenerListaEstudiantes(r);
      });
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
  RepositorioEstudiantesPruebas(super.constructor);
  @override
  Future<Either<Problema, Personaje>> obtenerEstudiante(
      NombrePersonaje nombre) async {
    if (listaEstudiantes.isEmpty) {
      var resultado =
          await constructor.obtenerDatos('offline', jsonEstudiante);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        listaEstudiantes = obtenerListaEstudiantes(r);
      });
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