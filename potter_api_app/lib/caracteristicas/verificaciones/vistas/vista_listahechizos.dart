// @dart=2.9
import 'package:flutter/material.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_estudiante.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/Detalles_hechizos.dart';

import '../../dominio/magias.dart';


class ListaHechizos extends StatefulWidget {
  const ListaHechizos({Key key}) : super(key: key);


  @override
  State<ListaHechizos> createState() => _ListaHechizosState();
}

class _ListaHechizosState extends State<ListaHechizos> {
  MagiaService service = MagiaService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<Magias>>(
          future: service.obtenerMagias(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Column(
                  children: snapshot.data.map((item) => Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
                  child:  GestureDetector(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          title: Text(item.name),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push
                      (context, MaterialPageRoute
                      (builder: ((context) => 
                      DetallesHechizos(item))));
                    },
                  ),
                )
              ).toList());
            } else {
                return const Padding(
                  padding:  EdgeInsets.only(top: 300),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                       height: 200,
                       child: CircularProgressIndicator.adaptive()
                    )
                  ),
                );
            } 
          },
        )
      ),
    );
  }
}