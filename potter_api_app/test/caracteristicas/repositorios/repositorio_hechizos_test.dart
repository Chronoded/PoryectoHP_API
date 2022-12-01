import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_hechizos.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';

void main() {
  group('Repositorio de pruebas de Hechizos', () {
    group('pruebas online de hechizos', () {
      test('con Alohomora me regresa un Hechizo', () async {
        RepositorioPruebaJson repop = RepositorioPruebaJson();
        RepositorioMagiasPruebas repoq = RepositorioMagiasPruebas(repop);
        var resultado =
            await repoq.obtenerHechizo(NombrePersonaje.contructor('Alohomora'));
        resultado.match((l) {
          assert(false);
        }, (r) {
          expect(r, isA<Hechizo>());
          expect(r.descripcion, 'Unlocks objects');
        });
      });
      test('con Almora arroja hechizo inexistente', () async {
        RepositorioPruebaJson repop = RepositorioPruebaJson();
        RepositorioMagiasPruebas repoq = RepositorioMagiasPruebas(repop);
        var resultado =
            await repoq.obtenerHechizo(NombrePersonaje.contructor('Almora'));
        resultado.match((l) {
          expect(l, isA<HechizoInexistente>());
        }, (r) {
          assert(false);
        });
      });
    });
    group('pruebas offline de hechizos', () {
      test('con Reparo me regresa un Hechizo', () async {
        RepositorioPruebaJson repop = RepositorioPruebaJson();
        RepositorioMagiasPruebas repoq = RepositorioMagiasPruebas(repop);
        var resultado =
            await repoq.obtenerHechizo(NombrePersonaje.contructor('Reparo'));
        resultado.match((l) {
          assert(false);
        }, (r) {
          expect(r, isA<Hechizo>());
          expect(r.descripcion, 'Fixes broken objects');
        });
      });
      test('con Reparto espero que hechizo sea inexistente', () async {
        RepositorioPruebaJson repop = RepositorioPruebaJson();
        RepositorioMagiasPruebas repoq = RepositorioMagiasPruebas(repop);
        var resultado =
            await repoq.obtenerHechizo(NombrePersonaje.contructor('Reparto'));
        resultado.match((l) {
          expect(l, isA<HechizoInexistente>());
        }, (r) {
          assert(false);
        });
      });
    });
  });
}
