import 'dart:math';
import 'package:neoflutter/models/contato.dart';

class ContatoService {
  List<Contato> contacts = [];
  Random random = Random();
  int max;

  var firstNames = [
    'Saulo',
    'Pedro',
    'Marcela',
    'Reinaldo',
    'Felipe',
    'João',
    'Matheus',
    'Daniel'
  ];
  var lastNames = [
    'Moura',
    'Bueno',
    'Albuquerque',
    'Picone',
    'da Silva',
    'Andrade'
  ];
  var emails = ['administrativo', 'rh', 'dev', 'suporte'];
  var domains = ['@gmail.com', '@yahoo.com', '@live.com', '@outlook.com'];
  var cellphones = ['8197874512', '81954451236', '8195456212', '8194584512'];

  List<Contato> getAll() {
    max = numRandom(50, 80);
    for (int i = 0; i < max; i++) {
      var firtName = firstNames[random.nextInt(firstNames.length)];
      var lastName = lastNames[random.nextInt(lastNames.length)];
      var email = emails[random.nextInt(emails.length)];
      var domain = domains[random.nextInt(domains.length)];
      var cellphone = cellphones[random.nextInt(cellphones.length)];
      var birthday = DateTime.utc(
          numRandom(1900, 2010), numRandom(1, 12), numRandom(1, 30));
      var peso = numRandom(40, 120);

      Contato contact = Contato()
        ..nome = '$firtName $lastName'
        ..email = '$email$domain'
        ..telefone = cellphone
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
