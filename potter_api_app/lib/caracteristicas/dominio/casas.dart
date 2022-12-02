// @dart=2.9

import 'package:flutter/material.dart';

Color houseColor (String house){
  switch (house) {
    case "Gryffindor": 
      return Colors.red;
    case "Slytherin": 
      return Colors.green;
    case "Ravenclaw": 
      return Colors.purple;
    case "Hufflepuff": 
      return Colors.amber;
    default:
      return Colors.black;
  }
  
}