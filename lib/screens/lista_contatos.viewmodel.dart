import 'package:neoflutter/models/contato.dart';
import 'package:neoflutter/services/contato_service.dart';

import '../service_locator.dart';

class ListaContatosViewModel {
  var servico = getIt<ContatoService>();
  List<Contato> contato = <Contato>[];

  String minMaxLimit() {
    return servico.max.toString(); // retornando o valor máximo de registros
  }

  update() {
    var _lista = servico.getAll();
    _lista != null && _lista.isNotEmpty ? contato = _lista : contato = null;
  }
}
