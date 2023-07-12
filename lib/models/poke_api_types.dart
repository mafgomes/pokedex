import 'package:pokedex/models/models.dart';

class PokeApiTipo {
	var numTipos = 0;
	List<Tipo> tipos;

	PokeApiTipo({required this.tipos}) {
		numTipos = tipos.length;
	}

	factory PokeApiTipo.fromJson(List<dynamic> jsonData) {
		var tipos = <Tipo>[];
		var id = 0;
		jsonData.forEach((e) {
			id = id + 1;
			tipos.add(Tipo(id: id, name: e["name"], url: e["url"]));
		});
		return PokeApiTipo(tipos: tipos);
	}
}