// @dart=2.9
import 'package:flutter/material.dart';
import 'package:potter_api_app/caracteristicas/dominio/casas.dart';
import 'package:potter_api_app/caracteristicas/dominio/personaje.dart';
import 'package:potter_api_app/caracteristicas/repositorios/repositorio_estudiante.dart';
import 'package:potter_api_app/caracteristicas/verificaciones/vistas/Detalles_personajes.dart';

class Aplicacion extends StatefulWidget {
  const Aplicacion({Key key}) : super(key: key);


  @override
  State<Aplicacion> createState() => _AplicacionState();
}

class _AplicacionState extends State<Aplicacion> {
  PersonajesService service = PersonajesService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<Personajes>>(
          future: service.obtenerPersonajes(),
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
                          leading: Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(item.image),
                            ),
                          ),
                          trailing: Text(item.house,
                           style: TextStyle(color: houseColor(item.house))),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push
                      (context, MaterialPageRoute
                      (builder: ((context) => 
                      DetallesPersonajes(item))));
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