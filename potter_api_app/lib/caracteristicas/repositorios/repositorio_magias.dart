import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';

String api = 'https://hp-api.onrender.com/api/spells';
List<Hechizo> _listaHechizos = [];

abstract class RepositorioHechizos {
  late RepositorioPruebaJson constructor;
  RepositorioHechizos(this.constructor);
  Future<Either<Problema, List<Hechizo>>> obtenerHechizos();
}

class RepositorioHechizosReal extends RepositorioHechizos {
  RepositorioHechizosReal(super.constructor);

  @override
  Future<Either<Problema, List<Hechizo>>> obtenerHechizos() async {
    if (_listaHechizos.isEmpty) {
      var resultado = await constructor.obtenerDatos('online', api);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        _listaHechizos = _obtenerListaHechizos(r);
      });
    }
    if (_listaHechizos.isNotEmpty) {
      return Right(_listaHechizos);
    }
    return Left(HechizoInexistente());
  }
}

List<Hechizo> _obtenerListaHechizos(List<dynamic> json) {
  List<Hechizo> listaHechizos = [];
  Hechizo h;
  for (var i = 0; i < json.length; i++) {
    h = Hechizo.constructor(
        nombre: json[i]['name'], descripcion: json[i]['description']);
    listaHechizos.add(h);
  }
  return listaHechizos;
}

