import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_personaje.dart';

void main() {
  group('pruebas de personajes: ', () {
    test('con Harry Potter me devuelve un personaje', () {
      RepositorioObtenerPersonaje repo = RepositorioObtenerPersonaje();
      var resultado =
          repo.obtenerPersonaje(NombrePersonaje.contructor('Harry Potter'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.actor, equals('Daniel Radcliffe'));
        expect(r.nombre, equals('Harry Potter'));
        expect(r.patronus, equals('stag'));
      });
    });
  });

}
