import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';

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
        appBar: AppBar(title: Text('Detalhes do Contato')),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                child: CircleAvatar(
                  radius: 50,
                  child: Text(
                    widget.contato.iniciais,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                child: Text(widget.contato.nome,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
              Divider(height: 1, thickness: 1, indent: 25, endIndent: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(widget.contato.email),
                    ),
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text(widget.contato.telefone),
                    ),
                    ListTile(
                      leading: Icon(Icons.cake),
                      title: Text(
                          '${widget.contato.nascimento.day}/${widget.contato.nascimento.month}/${widget.contato.nascimento.year}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.integration_instructions),
                      title: Text('${widget.contato.peso.toString()} kg'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
