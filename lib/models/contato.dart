import 'package:uuid/uuid.dart';

class Contato {
  String _id = Uuid().v4();
  get id => _id;
  String nome;
  String telefone;
  String email;
  int peso;
  DateTime nascimento;

  get iniciais => nome.isNotEmpty
      ? nome.trim().split(' ').map((e) => e[0]).take(2).join()
      : '';

  Contato({this.nome, this.email, this.telefone, this.nascimento, this.peso});
}
