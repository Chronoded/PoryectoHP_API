import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';
import '../dominio/problema.dart';

String api ='https://hp-api.onrender.com/api/spells';
String rutaJson='./lib/caracteristicas/data/datos_hechizos.json';
List<Hechizo> listaHechizos = [];

abstract class RepositorioHechizo{
  late RepositorioPruebaJson constructor;
  RepositorioHechizo(this.constructor);
  Future<Either<Problema,Hechizo>> obtenerHechizo(NombrePersonaje nombre);
}
class RepositorioMagias extends RepositorioHechizo{
  RepositorioMagias(super.constructor);

  @override
  Future<Either<Problema, Hechizo>> obtenerHechizo(NombrePersonaje nombre) {
    throw UnimplementedError();
  }

}
class RepositorioMagiasPruebas extends RepositorioHechizo{
  RepositorioMagiasPruebas(super.constructor);

  @override
  Future<Either<Problema,Hechizo>> obtenerHechizo(NombrePersonaje nombre) async{
    try {
     var resultado = await constructor.obtenerDatos('offline', rutaJson);
     resultado.match((l) {
      return Left(l);
      }, 
      (r) {
      listaHechizos = obtenerListaHechizos(r);
      for (var i = 0; i < listaHechizos.length; i++) {
        if (listaHechizos[i].nombre==nombre.valor) {
          return Right(listaHechizos[i]);
        }
      } 
      return Left(HechizoInexistente());
      }); 
    } catch (e) {
      return Left(JsonNoEncontrado());
    }
    return Left(HechizoErroneo());
  }

  List<Hechizo> obtenerListaHechizos(List<dynamic> json) {
    List<Hechizo> listaHechizos = [];
    Hechizo a;
    for (var i = 0; i < json.length; i++) {
      a = Hechizo.constructor(nombre: json[i]['name'], descripcion: json[i]['description']);    
      listaHechizos.add(a);
    }
    return listaHechizos;
  }

}