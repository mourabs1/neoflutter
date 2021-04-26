import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';

const titulo = 'Detalhes do contato';

class DetalhesContato extends StatefulWidget {
  final Contato contato;
  DetalhesContato(this.contato);

  @override
  _DetalhesContatoState createState() => _DetalhesContatoState();
}

class _DetalhesContatoState extends State<DetalhesContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.contato.nome)),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(widget.contato.nome),
              Text(widget.contato.email),
              Text(widget.contato.telefone),
            ],
          ),
        )));
  }
}
