import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';
import 'package:neoflutter/screens/detalhes_contato.screen.dart';
import 'package:neoflutter/screens/lista_contatos.viewmodel.dart';

// Strings
const nomeTela = 'Lista de Contatos';
const registros = 'registros';

class ListaContatos extends StatefulWidget {
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final ListaContatosViewModel _viewModel = ListaContatosViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.update();

    return Scaffold(
      appBar: AppBar(
          title: Text('$nomeTela: ${_viewModel.minMaxLimit()} $registros')),
      body: ListView.builder(
          itemCount: _viewModel.contato.length,
          itemBuilder: (context, index) {
            return ItemContatos(
              _viewModel.contato[index],
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetalhesContato(_viewModel.contato[index]))),
            );
          }),
    );
  }
}

class ItemContatos extends StatelessWidget {
  final Contato contato;
  final Function onClick;

  ItemContatos(this.contato, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onClick(),
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
