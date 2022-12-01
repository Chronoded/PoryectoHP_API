import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_estudiantes.dart';

void main() {
  group('RepositorioEstudiante pruebas', () {
    group('pruebas offline de repositorio estudiante:', () {
      test('con Neville Longbottom espero un estudiante', () async {
        RepositorioEstudiantesPruebas repo = RepositorioEstudiantesPruebas();
        var resultado = await repo.obtenerEstudiante(
            NombrePersonaje.contructor('Neville Longbottom'));
        resultado.match((l) {
          expect(false, equals(true));
        }, (r) {
          expect(r.actor, 'Matthew Lewis');
          expect(r.anioNac, 1980);
          expect(r.varita?['wood'], 'cherry');
          expect(r.varita?['core'], 'unicorn tail-hair');
          expect(r.varita?['length'], 13);
          expect(r.estudianteHowarts, true);
          expect(r.varitaHowarts, false);
        });
      });

      test('con Neville Langbattam arroja EstudianteNoEncontrado', () async {
        RepositorioEstudiantesPruebas repo = RepositorioEstudiantesPruebas();
        var resultado = await repo.obtenerEstudiante(
            NombrePersonaje.contructor('Neville Langbattam'));
        resultado.match((l) {
          expect(l, isA<EstudianteNoEsta>());
        }, (r) {
          assert(false);
        });
      });
    });
  });

  group('pruebas online de repo estudiante:', () {
    test('con Percy Weasley espero un estudiante', () async {
      RepositorioEstudiantesPruebas repo = RepositorioEstudiantesPruebas();
      var resultado = await repo
          .obtenerEstudiante(NombrePersonaje.contructor('Percy Weasley'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.actor, 'Chris Rankin');
        expect(r.estudianteHowarts, true);
        expect(r.varitaHowarts, false);
      });
    });

    test('con Percy Wasly espero estudiante no esta', () async {
      RepositorioEstudiantesPruebas repo = RepositorioEstudiantesPruebas();
      var resultado = await repo
          .obtenerEstudiante(NombrePersonaje.contructor('Miguel Corner'));
      resultado.match((l) {
        expect(l, isA<EstudianteNoEsta>());
      }, (r) {
        assert(false);
      });
    });
  });
}
