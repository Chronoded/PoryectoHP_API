import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';

void main() {
  test('si no esta vacio no arroja error', () {
    NombrePersonaje nom = NombrePersonaje.contructor('Oliver');
    expect(nom.valor, 'Oliver');
  });

  test('nombre vacio o con espacios arroja error', () {
    expect(() => NombrePersonaje.contructor('    '),
        throwsA(isA<NombreInexistente>()));
  });
}