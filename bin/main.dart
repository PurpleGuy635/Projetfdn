import 'ihm_principale.dart';
import 'package:mysql1/mysql1.dart';

void main(List<String> arguments) async {
  IHMprincipale.titre();
  ConnectionSettings settings = IHMprincipale.setting();
  await IHMprincipale.menu(settings);
  IHMprincipale.quitter();
}
