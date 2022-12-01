import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:potter_api_app/caracteristicas/dominio/problema.dart';
import 'package:http/http.dart' as http;

List<dynamic> json = [];

abstract class RepositorioJson{
  Future<Either<Problema,List<dynamic>>> obtenerDatos(String modo, String ruta);
}
class RepositorioPruebaJson extends RepositorioJson{
  @override
  Future<Either<Problema,List<dynamic>>> obtenerDatos(String modo, String ruta)async{
    if (modo == 'online') {
      try {
      Uri direccion = Uri.parse(ruta);
      final respuesta = await http.get(direccion);
      if (respuesta.statusCode != 200) {
        return left(ErrordeJson());
      }
      json = jsonDecode(respuesta.body);
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
      return Right(json);
    }
    if (modo == 'offline') {
      try {
        json = jsonDecode((File(ruta).readAsStringSync()));
      } catch (e) {
        return Left(JsonNoEncontrado());
      }
      return Right(json);
    }
    return Left(ManeraErronea());
  }
}