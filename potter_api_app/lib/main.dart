import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/bloc.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_creandose.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocVerificacion(),
      child: const Aplicacion(),
    );
  }
     
  }
   class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocVerificacion>().state;
          if (estado is Creandose) {
            return const VistaEnCreacion();
          }
          return const Center(child: Text('ERROR'));
        }),
      ),
    );
  }
}
