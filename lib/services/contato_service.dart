import 'dart:math';
import 'package:neoflutter/models/contato.dart';
import 'data.dart';

class ContatoService {
  final List<Contato> contacts = [];
  final Random random = Random();
  int max;

  List<Contato> getAll() {
    max = numRandom(50, 80);
    for (int i = 0; i < max; i++) {
      var firtName = firstNames[random.nextInt(firstNames.length)];
      var lastName = lastNames[random.nextInt(lastNames.length)];
      var email = emails[random.nextInt(emails.length)];
      var domain = domains[random.nextInt(domains.length)];
      var ddd = ddds[random.nextInt(ddds.length)];
      var cellphone = cellphones[random.nextInt(cellphones.length)];
      var birthday = DateTime.utc(
          numRandom(1900, 2010), numRandom(1, 12), numRandom(1, 30));
      var peso = numRandom(40, 120);

      Contato contact = Contato()
        ..nome = '$firtName $lastName'
        ..email = '$email$domain'
        ..telefone = '$ddd$cellphone'
        ..nascimento = birthday
        ..peso = peso;

      contacts.add(contact);
    }
    return contacts;
  }

  int numRandom(int min, int max) {
    return min + random.nextInt(max - min);
  }
}
