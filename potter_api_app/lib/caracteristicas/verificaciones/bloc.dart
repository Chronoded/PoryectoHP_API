import 'package:bloc/bloc.dart';

class Estado {}

class Creandose extends Estado {}

class PantallaInicial extends Estado {}

class Evento {}

class Creado extends Evento {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(PantallaInicial());
    });
  }
}