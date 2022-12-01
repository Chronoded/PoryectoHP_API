import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';

void main() {
  group('Pruebas de Repositorio JSON', () {
    test(
        'cuando es offline y el archivo es datos_estudiantes.json devuelve un json',
        () async {
      RepositorioPruebaJson repoh = RepositorioPruebaJson();
      var resultado = await repoh.obtenerDatos(
          'offline', './lib/caracteristicas/data/datos_estudiantes.json');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<dynamic>>());
      });
    });
    test(
        'cuando es online y url: https://hp-api.onrender.com/api/characters devuelve un json',
        () async {
      RepositorioPruebaJson repoh = RepositorioPruebaJson();
      var resultado = await repoh.obtenerDatos(
          'online', 'https://hp-api.onrender.com/api/characters');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<dynamic>>());
      });
    });
    test('cuando es offline y ruta: "" arroja el problema JsonNoEncontrado',
        () async {
      RepositorioPruebaJson repoy = RepositorioPruebaJson();
      var resultado = await repoy.obtenerDatos('offline', '');
      resultado.match((l) {
        expect(l, isA<JsonNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
    test('cuando es online y url: "" arroja el problema JsonNoEncontrado',
        () async {
      RepositorioPruebaJson repoy = RepositorioPruebaJson();
      var resultado = await repoy.obtenerDatos('online', '');
      resultado.match((l) {
        expect(l, isA<JsonNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
    test(
        'cuando es offline y archivo: estonoesunjson.json arroja problema JsonNoEncontrado',
        () async {
      RepositorioPruebaJson repop = RepositorioPruebaJson();
      var resultado = await repop.obtenerDatos(
          'offline', './test/caracteristicas/data/datos_estonoesunjson.json');
      resultado.match((l) {
        expect(l, isA<JsonNoEncontrado>());
      }, (r) {
        assert(false);
      });
    });
  });

    test('cuando es offline y archivo datos_incorrectos_estudiantes.json arroja JsonInexistente', () async{
    RepositorioPruebaJson rpj = RepositorioPruebaJson();
    var resultado = await rpj.obtenerDatos('offline', 'lib/caracteristicas/data/datos_incorrectos_estudiantes.json');
    resultado.match((l){
      expect(l, isA<JsonInexistente>());
    }, (r){
      assert(false);
    });
  });
}
