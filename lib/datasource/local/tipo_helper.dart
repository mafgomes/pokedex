import 'package:pokedex/datasource/local/banco_dados.dart';
import 'package:pokedex/models/models.dart';
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

  Future<List<Tipo>> getTodos() async {
    await Future.delayed(const Duration(seconds: 1));

    Database db = await BancoDados().db;

    var listaDados = await db.query(Tipo.tabela);
    return listaDados.map((e) => Tipo.fromMap(e)).toList();
  }

  Future<Tipo?> getById(int id) async {
    Database db = await BancoDados().db;

    var listaDados = await db.query(Tipo.tabela,
        where: '${Tipo.campoId} = ?',
        whereArgs: [ id ]
    );

    if (listaDados.isNotEmpty) {
      return Tipo.fromMap(listaDados.first);
    }
    return null;
  }
}