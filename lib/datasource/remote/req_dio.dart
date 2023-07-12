import 'package:dio/dio.dart';
import 'package:pokedex/models/models.dart';
import 'package:pokedex/models/poke_api_types.dart';

class HttpGetter {
  // Instância da biblioteca Dio
  final dio = Dio();

  // Base dos webservices dessa API
  static const pokeAPI = 'https://pokeapi.co/api/v2/';
  // Endpoint para retornar os tipos de Pokémon existentes
  final tiposEP = '${pokeAPI}type';

  Future<List<Tipo>> getHttpTipos() async {
    final response = await dio.get(tiposEP);
    try {
      if (response.statusCode! >= 200 &&
          response.statusCode! <= 299
      ) {
        PokeApiTipo tipos = PokeApiTipo.fromJson(response.data["results"]);
        return tipos.tipos;
      } else {
        throw Exception('Erro: "${response.statusMessage}" (${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro: "${e.toString()}');
    }
  }
}