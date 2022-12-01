import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';

void main() {
  group('Hechizos pruebas de la clase', () {
    test('nombre distinto Hechizo distinto', () {
      Hechizo magia1 =
          Hechizo.constructor(nombre: 'hechizo1', descripcion: 'magia');
      Hechizo magia2 =
          Hechizo.constructor(nombre: 'hechizo', descripcion: 'hechizo');
      expect(magia1 == magia2, false);
    });
    test('nombre vacio o con espacios envia error',
        () {
      expect(() => Hechizo.constructor(nombre: '    ', descripcion: 'hechizo'),
          throwsA(isA<HechizoErroneo>()));
    });
    test('si descripcion esta en blanco o espacios marca error',
        () {
      expect(() => Hechizo.constructor(nombre: 'hechizo', descripcion: '    '),
          throwsA(isA<HechizoErroneo>()));
    });
  });
}
