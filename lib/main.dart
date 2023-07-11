import 'package:flutter/material.dart';
import 'package:pokedex/ui/pages/lista_tipos.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Pokédex',
    home: ListaTipos(),
    debugShowCheckedModeBanner: false,
  ));
}