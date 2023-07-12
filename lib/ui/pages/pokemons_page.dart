import 'package:pokedex/blocs/lista_pokemons_bloc.dart';
import 'package:pokedex/models/models.dart';
import 'package:pokedex/ui/widgets/circulo_espera.dart';
import 'package:pokedex/ui/widgets/item_dismissible.dart';
import 'package:pokedex/ui/widgets/item_lista.dart';
import 'package:flutter/material.dart';

class PokemonsPage extends StatefulWidget {
  final Tipo tipo;

  const PokemonsPage(this.tipo, {super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  final _bloc = ListaPokemonsBloc();

  @override
  Widget build(BuildContext context) {
    var tipo = widget.tipo;

    return Scaffold(
      appBar: AppBar(title: Text(tipo.name)),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _bloc.getTodosPorTipo(tipo),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CirculoEspera();
            default:
              if (snapshot.hasError) {
                return Text('Deu erro: ${snapshot.error}');
              }
              return _criarLista(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _criarLista(List<Pokemon> lista) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return ItemDismissible(
          filho: _criarItemLista(lista[index]),
          dados: [
            DadosDismissible(
              titulo: 'Editar Pokemon',
              evento: () { _abrirCadastro(pokemon: lista[index]); },
              deveConfirmar: false,
              direction: DismissDirection.startToEnd,
              corFundo: Colors.green.shade200,
              alinhamento: Alignment.centerLeft,
            ),
            DadosDismissible(
              titulo: 'Excluir Pokemon',
              evento: () {  },
              deveConfirmar: true,
              direction: DismissDirection.endToStart,
              corFundo: Colors.red.shade200,
              alinhamento: Alignment.centerRight,
              txtConfirmar: 'Deseja excluir esse pokemon?'
            ),
          ]
        );
      },
    );
  }

  Widget _criarItemLista(Pokemon pokemon) {
    return ItemLista(
      filho: Row(
        children: [
          Expanded(child: Text(pokemon.name)),
          Text(pokemon.tipo.name)
        ],
      ),
      clique: () { _abrirCadastro(pokemon: pokemon); },
    );
  }

  void _abrirCadastro({Pokemon? pokemon}) async {
  }
}