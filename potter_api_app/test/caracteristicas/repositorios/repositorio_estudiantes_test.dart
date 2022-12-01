import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/dominio/nombre_personaje.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_estudiantes.dart';

void main() {
  group('RepositorioEstudiante', () {
    group('pruebas offline:', () {
      test('con Neville Longbottom espero un estudiante', () async {
        RepositorioEstudiantesPruebas repo = RepositorioEstudiantesPruebas();
        var resultado = await repo
            .obtenerEstudiante(NombrePersonaje.contructor('Neville Longbottom'));
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
    });
  });
}