import 'package:pokedex/ui/widgets/botao_texto.dart';
import 'package:pokedex/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {
  show({
    required BuildContext context,
    required String titulo,
    required String texto
  }) {
    MensagemPopup().show(context: context, titulo: titulo, texto: texto,
      botoes: [
        BotaoTexto(titulo: 'OK', clique: (){ Navigator.pop(context); })
      ]
    );
  }
}