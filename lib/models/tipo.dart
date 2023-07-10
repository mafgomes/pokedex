import 'package:pokedex/extensions/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tipo.g.dart';

@JsonSerializable()
class Tipo {
  static const tabela = 'tbCategoria';
  static const campoId = 'campoId';
  static const campoNome = 'campoNome';

  int? id;
  String nome;

  Tipo({this.id, required this.nome});

  factory Tipo.fromJson(Map<String, dynamic> json) =>
      _$TipoFromJson(json);
  Map<String, dynamic> toJson() => _$TipoToJson(this);

  factory Tipo.fromMap(Map dados) {
    return Tipo(
        id: dados[campoId].toString().toInt(),
        nome: dados[campoNome]
    );
  }
  Map<String, dynamic> toMap() {
    return {
      campoId: id,
      campoNome: nome
    };
  }
}