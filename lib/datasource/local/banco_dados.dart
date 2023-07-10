import 'package:pokedex/datasource/local/tipo_helper.dart';
import 'package:pokedex/datasource/local/pokemon_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  // Garantir que haja uma única instância de banco,
  // ou seja, que essa classe do banco seja um singleton:
  static final BancoDados _instance = BancoDados._internal();
  BancoDados._internal();
  factory BancoDados() => _instance;

  Database? _db;

  Future<Database> get db async {
    const nomeBanco = 'pokemons.db';
    final caminho = getDatabasesPath();
    final caminhoBanco = join(await caminho, nomeBanco);

    return await openDatabase(
        caminhoBanco,
        version: 1,
        onCreate: _criarTabelas
    );
  }

  void _criarTabelas(Database banco, int versao) async {
    await banco.execute(TipoHelper.sqlCreate);
    await banco.execute(PokemonHelper.sqlCreate);
  }

  void close() {
    _db?.close();
  }
}