import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';
import 'detalhes_contato.viewmodel.dart';
import 'package:intl/intl.dart';

class DetalhesContato extends StatefulWidget {
  final Contato contato;
  DetalhesContato(this.contato);
  @override
  _DetalhesContatoState createState() => _DetalhesContatoState();
}

class _DetalhesContatoState extends State<DetalhesContato> {
  DetalhesContatoViewModel _viewModel;
  @override
  void initState() {
    _viewModel = DetalhesContatoViewModel(widget.contato);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Detalhes do contato'),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                  child: CircleAvatar(
                    radius: 50,
                    child: Text(
                      _viewModel.contato.iniciais,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                  child: Text(_viewModel.contato.nome,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
                Divider(height: 1, thickness: 1, indent: 25, endIndent: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(Icons.email),
                          title: Text(
                              stringNullOrEmpty(_viewModel.contato.email))),
                      ListTile(
                        leading: Icon(Icons.call),
                        title: Text(
                            stringNullOrEmpty(_viewModel.contato.telefone)),
                      ),
                      ListTile(
                        leading: Icon(Icons.cake),
                        title: Text(
                            '${dateFormatted(_viewModel.contato.nascimento)}'),
                      ),
                      ListTile(
                        leading: Icon(Icons.integration_instructions),
                        title: Text(intNullOrEmpty(_viewModel.contato.peso)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  dateFormatted(DateTime date) {
    if (date != null) {
      final String formatted = DateFormat('dd/MM/yyyy').format(date);
      return formatted;
    } else {
      return 'Sem dados';
    }
  }

  String intNullOrEmpty(int valor) {
    if (valor == null) {
      return 'Sem dados';
    } else {
      return '$valor kg';
    }
  }

  String stringNullOrEmpty(String texto) {
    if (texto == null || texto.isEmpty) {
      return 'Sem dados';
    } else {
      return '$texto';
    }
  }
}
