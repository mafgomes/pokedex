import 'package:pokedex/datasource/local/banco_dados.dart';
import 'package:pokedex/models/tipo.dart';
import 'package:sqflite/sqflite.dart';

class TipoHelper {
  static const sqlCreate = """
    CREATE TABLE IF NOT EXISTS ${Tipo.tabela} (
      ${Tipo.campoNome} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Tipo.campoNome} TEXT
    )
  """;

  void inserir(Tipo tipo) async {
    Database db = await BancoDados().db;

    db.insert(Tipo.tabela, tipo.toMap());
  }
}