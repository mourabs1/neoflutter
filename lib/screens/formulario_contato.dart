import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neoflutter/screens/formulario_contato.viewmodel.dart';

class ContatoFormulario extends StatefulWidget {
  @override
  _ContatoFormularioState createState() => _ContatoFormularioState();
}

class _ContatoFormularioState extends State<ContatoFormulario> {
  final FormularioContatoViewModel _viewModel = FormularioContatoViewModel();

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorNascimento = TextEditingController();
  final TextEditingController _controladorPeso = TextEditingController();

  DateTime pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Novo contato'),
            ),
            expandedHeight: 50,
          ),
          SliverToBoxAdapter(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _controladorNome,
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                    TextFormField(
                      controller: _controladorEmail,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: _controladorNascimento,
                      decoration: InputDecoration(labelText: 'Nascimento'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controladorTelefone,
                      validator: (_controladorTelefone) {
                        return _viewModel.getTelefone(_controladorTelefone);
                      },
                      decoration: InputDecoration(labelText: 'Telefone'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controladorPeso,
                      decoration: InputDecoration(labelText: 'Peso'),
                    ),
                    TextButton(
                        onPressed: () {
                          _viewModel.nome = _controladorNome.text;
                          _viewModel.email = _controladorEmail.text;
                          _viewModel.telefone = _controladorTelefone.text;
                          _viewModel.nascimento = DateTime.now();
                          _viewModel.peso = int.tryParse(_controladorPeso.text);
                          Navigator.pop(context, _viewModel.save());
                        },
                        child: Text('CONFIRMAR'))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // _pickDate() async {
  //   final dataInicial = DateTime.now();
  //   final DateTime date = await showDatePicker(
  //       context: context,
  //       initialDate: dataInicial,
  //       firstDate: DateTime(DateTime.now().year - 5),
  //       lastDate: DateTime(DateTime.now().year + 5));

  //   if (date != null) {
  //     setState(() {
  //       pickedDate = date;
  //     });
  //   }
  // }

  // String getText() {
  //   if (pickedDate != null) {
  //     return '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
  //   } else {
  //     return 'Nascimento';
  //   }
  // }
}
