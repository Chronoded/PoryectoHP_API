// @dart=2.9
import 'package:flutter/material.dart';
import 'package:potter_api_app/caracteristicas/dominio/magias.dart';


class DetallesHechizos extends StatefulWidget {
  final Magias magias;
  const DetallesHechizos(this.magias, {Key key}) : super(key: key);

  @override
  State<DetallesHechizos> createState() => _DetallesHechizosState();
}

class _DetallesHechizosState extends State<DetallesHechizos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.magias.name)),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: 600,
                margin: EdgeInsets.only(top: 300),
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text(
                          "Nombre del Hechizo: ",
                          style: informacionStyle(),
                        ),
                        Text(
                          widget.magias.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        "Descripcion: ",
                        style: informacionStyle(),
                      ),
                      Text(
                        widget.magias.descripcion,
                        style: const TextStyle(fontSize: 20),
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