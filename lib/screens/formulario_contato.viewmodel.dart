import 'package:flutter/material.dart';
import 'package:neoflutter/models/contato.dart';
import 'package:neoflutter/services/contato_service.dart';
import '../service_locator.dart';

class FormularioContatoViewModel {
  var servico = getIt<ContatoService>();
  var nome, email, telefone, nascimento, peso;

  Contato save() {
    Contato contato = Contato()
      ..nome = nome
      ..email = email
      ..telefone = telefone
      ..nascimento = nascimento
      ..peso = peso;
    servico.insert(contato);

    return contato;
  }

  String getNome(String nome) {
    return nullEmpty(nome, 'Insira um nome');
  }

  String getEmail(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (email == null || email.isEmpty) {
      return 'Insira um e-mail';
    } else if (!RegExp(pattern).hasMatch(email)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String getPeso(String peso) {
    int pesoAtual = int.tryParse(peso);
    if (peso == null || peso.isEmpty) {
      return null;
    } else if (pesoAtual.isNegative) {
      return 'Insira acima de 0';
    } else if (pesoAtual > 1000) {
      return 'Peso acima de 1000 não é permitido';
    }
    return null;
  }

  String getTelefone(String telefone) {}

  String nullEmpty(String e, String texto) {
    if (e == null || e.isEmpty) {
      return texto;
    }
    return null;
  }
}
