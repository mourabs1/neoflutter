import 'package:get_it/get_it.dart';
import 'package:neoflutter/services/contato_service.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void setupLocator() {
    getIt.registerSingleton<ContatoService>(ContatoService());
  }
}
