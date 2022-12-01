import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/bloc.dart';

void main() {
  blocTest<BlocVerificacion, Estado>(
    'emite el estado "PrimeraPantalla" cuando se agrega el evento "Creado"',
    build: () => BlocVerificacion(),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<MostrandoTabs>()],
  );
}