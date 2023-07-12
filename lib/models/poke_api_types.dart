import 'package:pokedex/models/models.dart';

class PokeApiTipo {
	static var id = 0;
	List<Tipo> tipos;

	PokeApiTipo({required this.tipos}) {
		id += tipos.length;
	}

	factory PokeApiTipo.fromJson(List<dynamic> jsonData) {
		var tipos = <Tipo>[];
		jsonData.forEach((e) {
			tipos.add(Tipo(id: id, name: e["name"], url: e["url"]));
			id = id + 1;
		});
		return PokeApiTipo(tipos: tipos);
	}
}