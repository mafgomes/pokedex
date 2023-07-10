import 'package:flutter/material.dart';
import 'package:pokedex/blocs/lista_tipos_bloc.dart';
import 'package:pokedex/models/models.dart';

class ListaTipos extends StatefulWidget {
  const ListaTipos({super.key});

  @override
  State<ListaTipos> createState() => _ListaTiposState();
}

class _ListaTiposState extends State<ListaTipos> {
  final _bloc = ListaTiposBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Pokémons'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _bloc.getTodos(),
        builder: (contexto, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if(snapshot.hasError) {
                return Text('Deu erro: ${snapshot.error}');
              } else {
                return _criarLista(snapshot.data!);
              }
          }
        }
      ),
    );
  }

  Widget _criarLista(List<Tipo>lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Text(lista[index].name);
      },
    );
  }
}
