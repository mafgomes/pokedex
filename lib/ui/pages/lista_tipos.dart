import 'package:flutter/material.dart';
import 'package:pokedex/blocs/lista_tipos_bloc.dart';
import 'package:pokedex/models/models.dart';
import 'package:pokedex/ui/pages/pokemons_page.dart';
import 'package:pokedex/ui/widgets/item_dismissible.dart';
import 'package:pokedex/ui/widgets/item_lista.dart';

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
    return Column(
      children: [
        Image.asset('images/logo.png'),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return ItemDismissible(
                  filho: _itemLista(lista[index]),
                  dados: [
                    DadosDismissible(
                        titulo: 'Editar Tipo',
                        evento: () { },
                        corFundo: Colors.green.shade200,
                        alinhamento: Alignment.centerLeft,
                        deveConfirmar: false,
                        direction: DismissDirection.startToEnd
                    ),
                    DadosDismissible(
                        titulo: 'Excluir Tipo',
                        evento: () {  },
                        corFundo: Colors.red.shade200,
                        alinhamento: Alignment.centerRight,
                        deveConfirmar: true,
                        txtConfirmar: 'Deseja excluir esse tipo de Pokémon?',
                        direction: DismissDirection.endToStart
                    ),
                  ],
                );
              }
          ),
        ),
      ],
    );
  }

  Widget _itemLista(Tipo tipo) {
    return ItemLista(
      filho: Center(child: Text(tipo.name)),
      clique: () { _abrirPokemons(tipo); },
    );
  }

  void _abrirPokemons(Tipo tipo) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => PokemonsPage(tipo)));
  }
}
