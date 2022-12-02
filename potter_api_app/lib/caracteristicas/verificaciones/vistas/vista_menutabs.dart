
import 'package:flutter/material.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_listaestudiantes.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_listahechizos.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_listapersonajes.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/vista_primerapantalla.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Listas"),
        ),
        body: Center(
          child: SafeArea(
            child: Column(
              children: const [
                TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Todos los personajes"),
                      Tab(text: "Estudiantes"),
                      Tab(text: "Hechizos"),
                    ]),
                Expanded(
                    child: TabBarView(
                  children: [
                    ListaPersonajes(),
                    ListaEstudiantes(),
                    ListaHechizos(),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
