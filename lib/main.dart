import 'package:flutter/material.dart';
import 'package:pokedex/ui/pages/lista_tipos.dart';
import 'package:pokedex/ui/tema.dart';

void main() {
  runApp(MaterialApp(
    title: 'Pokédex',
    home: ListaTipos(),
    theme: carregarTema(),
    debugShowCheckedModeBanner: false,
  ));
}