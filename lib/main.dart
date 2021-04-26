import 'package:flutter/material.dart';
import 'package:neoflutter/screens/lista_contato.dart';
import 'package:neoflutter/service_locator.dart';

void main() {
  ServiceLocator().setupLocator();
  runApp(NeoContatos());
}

class NeoContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaContatos());
  }
}
