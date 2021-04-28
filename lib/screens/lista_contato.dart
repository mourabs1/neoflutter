import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';
import 'package:neoflutter/screens/detalhes_contato.screen.dart';
import 'package:neoflutter/screens/lista_contatos.viewmodel.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('$nomeTela'),
              background: Image(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/b/b7/Google_Contacts_logo.png')),
            ),
            expandedHeight: 200,
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return ItemContatos(_viewModel.contato[index],
                onClick: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetalhesContato(_viewModel.contato[index]))));
          }, childCount: _viewModel.contato.length))
        ],
      ),
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
          leading: CircleAvatar(child: Text(contato.iniciais)),
          title: Text(contato.nome),
          subtitle: Text(contato.telefone),
        ),
        Divider(height: 1, thickness: 1),
      ],
    );
  }
}
