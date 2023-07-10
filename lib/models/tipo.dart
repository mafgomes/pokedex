import 'package:pokedex/extensions/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tipo.g.dart';

@JsonSerializable()
class Tipo {
  static const tabela     = 'tbCategoria';
  static const campoId    = 'campoId';
  static const campoNome  = 'campoNome';
  static const campoUrl   = 'campoUrl';

  int? id;
  String name;
  String? url;

  Tipo({this.id, required this.name, this.url});

  factory Tipo.fromJson(Map<String, dynamic> json) =>
      _$TipoFromJson(json);
  Map<String, dynamic> toJson() => _$TipoToJson(this);

  factory Tipo.fromMap(Map dados) {
    return Tipo(
        id: dados[campoId].toString().toInt(),
        name: dados[campoNome],
        url: dados[campoUrl]
    );
  }
  Map<String, dynamic> toMap() {
    return {
      campoId: id,
      campoNome: name,
      campoUrl: url
    };
  }
}