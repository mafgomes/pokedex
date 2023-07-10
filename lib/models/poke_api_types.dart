import 'package:pokedex/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'poke_api_types.g.dart';

@JsonSerializable()
class PokeApiTipo {
	var numTipos = 0;
	List<Tipo>? Tipos;

	PokeApiTipo({required this.numTipos, this.Tipos});

	factory PokeApiTipo.fromJson(Map<String, dynamic> json) =>
			_$PokeApiTipoFromJson(json);
}