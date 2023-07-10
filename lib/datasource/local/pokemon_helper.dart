import 'package:pokedex/datasource/local/banco_dados.dart';
import 'package:pokedex/models/models.dart';
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

  // Obtém todos os Pokémons de um dado tipo
  Future<List<Pokemon>> getTodosPorTipo(Tipo tipo) async {
    await Future.delayed(const Duration(seconds: 1));

    Database db = await BancoDados().db;

    var listaDados = await db.query(Pokemon.tabela);
    if( listaDados.isNotEmpty ) {
      return listaDados.map((e) => Pokemon.fromMap(e, tipo)).toList();
    }
    return [];
  }

  // Obtém o Pokémon associado ao ID fornecido
  Future<Pokemon?> getById(int id) async {
    Database db = await BancoDados().db;

    var listaPokemons = await db.query(Pokemon.tabela,
        where: '${Pokemon.campoId} = ?',
        whereArgs: [ id ]
    );

    if (listaPokemons.isNotEmpty ) {
      // Tenta buscar o tipo associado a esse Pokémon
      int tp = 0;
      listaPokemons.first.forEach((k, v) {
        if( k == '${Pokemon.campoTipo}' ) {
          tp = v as int;
        }
      });
      var listaTipos = await db.query(Tipo.tabela,
          where: '${Tipo.campoId} = ?',
          whereArgs: [ tp ]
      );

      // TODO: Tratar corretamente o caso em que o tipo ainda não está no banco
      // Em princípio, não deve acontecer de algum Pokémon existir no banco
      // sem que seu tipo associado também exista, mas seguro morreu de velho!
      if (listaTipos.isNotEmpty ) {
        return Pokemon.fromMap(
            listaPokemons.first,
            Tipo.fromMap(listaTipos.first)
        );
      }
    }
    return null;
  }
}