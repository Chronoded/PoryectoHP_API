// @dart=2.9
import 'package:flutter/material.dart';
import 'package:potter_api_app/caracteristicas/dominio/casas.dart';
import 'package:potter_api_app/caracteristicas/dominio/personaje.dart';

class DetallesPersonajes extends StatefulWidget {
  final Personajes personajes;
  const DetallesPersonajes(this.personajes, {Key key}) : super(key: key);

  @override
  State<DetallesPersonajes> createState() => _DetallesPersonajesState();
}

class _DetallesPersonajesState extends State<DetallesPersonajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.personajes.name)),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(widget.personajes.image),
              height: 300,
              margin: EdgeInsets.only(top: 30, bottom: 10),
            ),
            Center(
              child: Container(
                width: 600,
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Casa a la que pertenece: ",
                          style: informacionStyle(),
                        ),
                        Text(
                          widget.personajes.house,
                          style: TextStyle(
                              fontSize: 20,
                              color: houseColor(widget.personajes.house)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 600,
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "¿Es Estudiante de hogwarts? ",
                        style: informacionStyle(),
                      ),
                      Text(
                        widget.personajes.isStudent.toString(),
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 600,
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Interpretado por: ",
                        style: informacionStyle(),
                      ),
                      Text(
                        widget.personajes.actor,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 600,
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Patronus: ",
                        style: informacionStyle(),
                      ),
                      Text(
                        widget.personajes.patronus,
                        style: TextStyle(fontSize: 20,
                        color: Colors.blue[600]
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle informacionStyle() {
    return const TextStyle(fontSize: 20);
  }
}
