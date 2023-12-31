import 'package:flutter/material.dart';

ThemeData carregarTema() {
  const corPrimaria = Color.fromRGBO(215, 46, 53, 1.0);
  const corPrimariaEscura = Color.fromRGBO(175, 1, 1, 1.0);
  const corPrimariaClara = Color.fromRGBO(255, 40, 40, 1.0);

  const appBarTema = AppBarTheme(
    centerTitle: true,
    color: corPrimaria,
  );

  var botaoQuadradoTema = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: corPrimaria,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
    )
  );

  var botaoFlutuanteTema = FloatingActionButtonThemeData(
    backgroundColor: corPrimaria,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
  );

  const campoTextoTema = InputDecorationTheme(
    //border: OutlineInputBorder()
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: corPrimariaEscura, width: 1)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: corPrimariaClara, width: 2)),
    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  );

  return ThemeData(
    primaryColor: corPrimaria,
    primaryColorDark: corPrimariaEscura,
    primaryColorLight: corPrimariaClara,
    appBarTheme: appBarTema,
    elevatedButtonTheme: botaoQuadradoTema,
    floatingActionButtonTheme: botaoFlutuanteTema,
    inputDecorationTheme: campoTextoTema
  );
}