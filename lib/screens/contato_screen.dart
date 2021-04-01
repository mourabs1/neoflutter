import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';
import 'package:neoflutter/services/contato_service.dart';

import '../service_locator.dart';

// Strings
const nomeTela = 'Lista de Contatos';

class ListaContatos extends StatefulWidget {
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  List<Contato> contatos;
  var servico = getIt<ContatoService>();

  void initState() {
    contatos = servico.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('$nomeTela: ${servico.max.toString()} registros')),
      body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, index) {
            final Contato contato = contatos[index];
            return ItemContatos(contato);
          }),
    );
  }
}

class ItemContatos extends StatelessWidget {
  final Contato contato;
  ItemContatos(this.contato);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(contato.iniciais),
          ),
          title: Text(contato.nome),
          subtitle: Text(contato.telefone),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
