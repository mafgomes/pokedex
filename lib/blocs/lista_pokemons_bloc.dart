import 'package:pokedex/datasource/local/pokemon_helper.dart';
import 'package:pokedex/models/models.dart';

class ListaPokemonsBloc {
  final _helper = PokemonHelper();

  Future<List<Pokemon>> getTodosPorTipo(Tipo tipo) {
    return _helper.getTodosPorTipo(tipo);
  }
}