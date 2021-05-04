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
    if (nome == null || nome.isEmpty) {
      return 'Insira um nome';
    }
    return null;
  }

  String getEmail(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (email == null || email.isEmpty) {
      return null;
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

  String getTelefone(String telefone) {
    const pattern = r'^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$';
    if (telefone == null || telefone.isEmpty) {
      return null;
    } else if (!RegExp(pattern).hasMatch(telefone)) {
      return 'Telefone inválido';
    }
    return null;
  }

  String getNascimento(DateTime nascimento) {
    var aniversario = nascimento.toString();
    return '$aniversario';
  }
}
