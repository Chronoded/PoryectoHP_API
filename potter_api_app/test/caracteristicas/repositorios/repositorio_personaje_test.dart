import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_personaje.dart';

void main() {
  group('pruebas de personajes offline: ', () {
    test('con Harry Potter me devuelve un personaje', () async {
      RepositorioObtenerPersonaje repo = RepositorioObtenerPersonaje();
      var resultado =
        await repo.obtenerPersonaje(NombrePersonaje.contructor('Harry Potter'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.actor, equals('Daniel Radcliffe'));
        expect(r.nombre, equals('Harry Potter'));
        expect(r.patronus, equals('stag'));
      });
    });
  });

   group('pruebas manejo de errores: ', () {
    test('con Harry Porter arroja error', () async {
      RepositorioObtenerPersonaje repo = RepositorioObtenerPersonaje();
      var resultado =
         await repo.obtenerPersonaje(NombrePersonaje.contructor('Harry Porter'));
      resultado.match((l) {
        expect(l, isA<PersonajeNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
  });

   group('pruebas de personajes online: ', () {
    test('con Hermione Granger me devuelve un personaje', () async {
      RepositorioPersonajesReales repo = RepositorioPersonajesReales();
      var resultado = await repo
          .obtenerPersonaje(NombrePersonaje.contructor('Hermione Granger'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.actor, 'Emma Watson');
        expect(r.nombre, 'Hermione Granger');
        expect(r.patronus, 'otter');
      });
    });

    test('con Hermione Gringa arroja personaje no encontrado', () async {
      RepositorioPersonajesReales rp = RepositorioPersonajesReales();
      var resultado = await rp
          .obtenerPersonaje(NombrePersonaje.contructor('Hermione Gringa'));
      resultado.match((l) {
        expect(l, isA<PersonajeNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
  });
}

