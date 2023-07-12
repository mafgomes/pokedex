import 'package:pokedex/models/models.dart';
import 'package:pokedex/datasource/local/tipo_helper.dart';
import 'package:pokedex/datasource/remote/req_dio.dart';

class ListaTiposBloc {
  final _helper = TipoHelper();

  Future<List<Tipo>> getTodos() {
    return _helper.getTodos();
  }
  Future<List<Tipo>> getStrings() {
    return HttpGetter().getHttpTipos();
  }
}