import 'package:bloc/bloc.dart';
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_magias.dart';

RepositorioPruebaJson repojson = RepositorioPruebaJson();
RepositorioHechizosReal repomagias = RepositorioHechizosReal(repojson);

class Estado {}

class Creandose extends Estado {}

class MostrandoTabs extends Estado {}

class MostrandoMagias extends Estado {
  List<Hechizo>listaMagias;
  MostrandoMagias(this.listaMagias);
}

class ApareceError extends Estado{
  String? mensaje;
  ApareceError({this.mensaje});
}

class Evento {}

class Creado extends Evento {}

class VistaListaHechizos extends Evento{}


class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoTabs());
    });
    on<VistaListaHechizos>((event, emit) async {
      var resultado = await repomagias.obtenerHechizos();
      resultado.match((l)  {
      emit(ApareceError(mensaje: l.toString()));
      }, (r)  {
        emit(MostrandoMagias(r));
      });
    });
  }
}