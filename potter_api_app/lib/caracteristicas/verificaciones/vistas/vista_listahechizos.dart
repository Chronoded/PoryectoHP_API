import "package:flutter/material.dart";
import 'package:potter_api_app/caracteristicas/dominio/hechizos.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_json.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_magias.dart';

class ListaHechizos extends StatefulWidget {
  const ListaHechizos({super.key});

  @override
  State<ListaHechizos> createState() => _ListaHechizosState();
}

class _ListaHechizosState extends State<ListaHechizos> {
   RepositorioPruebaJson repo = RepositorioPruebaJson();
 
  @override
  Widget build(BuildContext context) {
    RepositorioHechizosReal magias = RepositorioHechizosReal(repo);
    return Scaffold(
      body: SingleChildScrollView(
        child:FutureBuilder<List<Hechizo>>(
          future: magias.obtenerHechizos(),
          builder: (context, snapshot) {
            
          },
        ),
      ),
    );
  }
}