import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/bloc.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_creandose.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_menutabs.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion();
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
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
          if (estado is MostrandoTabs) {
            return const Tabs();
          }
          return const Center(child: Text('ERROR'));
        }),
      ),
    );
  }
}
