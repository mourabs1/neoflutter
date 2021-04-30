import 'package:neoflutter/models/contato.dart';
import 'package:neoflutter/services/contato_service.dart';

import '../service_locator.dart';

class ListaContatosViewModel {
  List<Contato> contato = <Contato>[];
  var servico = getIt<ContatoService>();

  String minMaxLimit() {
    return servico.max.toString();
  }

  update() {
    var _lista = servico.getAll();
    _lista != null && _lista.isNotEmpty ? contato = _lista : contato = null;
  }

  updateCreate() {
    var _listaCriada = servico.getAllCreated();
    contato = _listaCriada;
  }
}
