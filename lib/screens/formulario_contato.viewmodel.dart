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

  getNome(String nome) {}
  getEmail(String email) {}
  getTelefone(String telefone) {}
  getPeso(int peso) {}
}
