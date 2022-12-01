import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/personajes.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';

void main() {
  group('Probando test personaje:', () {
    test('Nombres personajes iguales', () {
      Personaje p1 = Personaje.constructor(nombre: 'harry');
      Personaje p2 = Personaje.constructor(nombre: 'ron');
      expect(p1 == p2, false);
    });

    test('atributos opcionales del personaje', () {
      Personaje p1 =
          Personaje.constructor(nombre: 'harry', actor: 'daniel radcliff');
      expect(p1.actor, 'daniel radcliff');
    });
  });

  group('manejo de errores:', () {
    test('nombre vacío arroja personaje que no existe', () {
      expect(() => Personaje.constructor(nombre: ''),
          throwsA(isA<PersonajeInexistente>()));
    });
  });
}