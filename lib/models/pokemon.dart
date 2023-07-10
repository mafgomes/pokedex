import 'package:pokedex/extensions/string_extension.dart';
import 'package:pokedex/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  static const tabela = 'tbPokemons';
  static const campoId = 'campoId';
  static const campoNome = 'campoNome';
  static const campoTipo = 'campoTipo';

  final int? id;
  final String nome;
  final Tipo tipo;

  Pokemon({this.id, required this.nome, required this.tipo});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  factory Pokemon.fromMap(Map dados, Tipo tipo) {
    return Pokemon(
        id: dados[campoId].toString().toInt(),
        nome: dados[campoNome],
        tipo: tipo
    );
  }
  Map<String, dynamic> toMap() {
    return {
      campoId: id,
      campoNome: nome,
      campoTipo: tipo.id
    };
  }
}