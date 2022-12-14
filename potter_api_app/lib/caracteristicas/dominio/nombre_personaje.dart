import 'package:potter_api_app/caracteristicas/dominio/problema.dart';

class NombrePersonaje {
  late final String valor;

  NombrePersonaje._(this.valor);

  factory NombrePersonaje.contructor(String propuesta) {
    if (propuesta.trim().isEmpty) {
      throw NombreInexistente();
    }
    return NombrePersonaje._(propuesta.toString());
  }
}