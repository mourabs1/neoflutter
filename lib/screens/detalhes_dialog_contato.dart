import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';

const titulo = 'Detalhes do contato';

class DetalhesDialog extends StatefulWidget {
  final Contato contato;
  DetalhesDialog(this.contato);

  @override
  _DetalhesDialogState createState() => _DetalhesDialogState();
}

class _DetalhesDialogState extends State<DetalhesDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(widget.contato.nome),
      children: <Widget>[
        SimpleDialogOption(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('E-mail: ${widget.contato.email}',
                  style: TextStyle(fontSize: 16.0)),
              Text('Telefone: ${widget.contato.telefone}',
                  style: TextStyle(fontSize: 16.0)),
              Text(
                  'Nascimento: ${widget.contato.nascimento.day}/${widget.contato.nascimento.month}/${widget.contato.nascimento.year}',
                  style: TextStyle(fontSize: 16.0)),
              Text('Peso: ${widget.contato.peso.toString()} kg',
                  style: TextStyle(fontSize: 16.0))
            ],
          ),
        ),
      ],
    );
  }
}
