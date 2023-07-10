import 'package:pokedex/datasource/local/banco_dados.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class PokemonHelper {
  static const sqlCreate = """
    CREATE TABLE IF NOT EXISTS ${Pokemon.tabela} (
      ${Pokemon.campoNome} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Pokemon.campoNome} TEXT,
      ${Pokemon.campoTipo} INTEGER
    )
  """;

  void inserir(Pokemon pokemon) async {
    Database db = await BancoDados().db;

    db.insert(Pokemon.tabela, pokemon.toMap());
  }
}