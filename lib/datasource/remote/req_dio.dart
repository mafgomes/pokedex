import 'package:dio/dio.dart';
import 'package:pokedex/models/models.dart';
import 'package:pokedex/models/poke_api_types.dart';

class HttpGetter {
  static const pokeAPI = 'https://pokeapi.co/api/v2/';

  final tiposEP = '${pokeAPI}type';
  final dio = Dio();

  Future<List<Tipo>> getHttpTipos() async {
    final response = await dio.get('${tiposEP}');
    PokeApiTipo tipos = PokeApiTipo.fromJson(response.data);
    return tipos.Tipos ?? [];
  }
}