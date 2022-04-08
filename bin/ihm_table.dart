import 'package:mysql1/mysql1.dart';

import 'db_config.dart';
import 'ihm_principale.dart';

class IHMTables {
  static Future<void> menuBDD(ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("Menu - Gestion BDD");
      print("1- Création des tables de la BDD");
      print("2- Verification des tables de la BDD");
      print("3- Afficher les tables de la BDD");
      print("4- Supprimer une table dans la BDD");
      print("5- Supprimer toutes les tables dans la BDD");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(5);
      print("--------------------------------------------------");

      if (choix == 1) {
        await createTable(settings);
      } else if (choix == 2) {
        await checkTable(settings);
      } else if (choix == 3) {
        await selectTable(settings);
      } else if (choix == 4) {
        await deleteTable(settings);
      } else if (choix == 5) {
        await deleteAllTables(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> createTable(ConnectionSettings settings) async {
    print("Création des tables manquantes dans la BDD ...");
    await DBConfig.createTables(settings);
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    IHMprincipale.wait();
  }

  static Future<void> checkTable(ConnectionSettings settings) async {
    print("Verification des tables dans la BDD ...");
    if (await DBConfig.checkTables(settings)) {
      print("Toutes les tables sont présentes dans la BDD.");
    } else {
      print("Il manque des tables dans la BDD.");
    }
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    IHMprincipale.wait();
  }

  static Future<void> selectTable(ConnectionSettings settings) async {
    List<String> listTable = await DBConfig.selectTables(settings);
    print("Liste des tables :");
    for (var table in listTable) {
      print("- $table");
    }
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    IHMprincipale.wait();
  }

  static Future<void> deleteTable(ConnectionSettings settings) async {
    print("Quelle table voulez vous supprimer ?");
    String table = IHMprincipale.saisieString("le nom de la table");
    if (IHMprincipale.confirmation()) {
      DBConfig.dropTable(settings, table);
      print("Table supprimée.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      IHMprincipale.wait();
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      IHMprincipale.wait();
    }
  }

  static Future<void> deleteAllTables(ConnectionSettings settings) async {
    if (IHMprincipale.confirmation()) {
      DBConfig.dropAllTable(settings);
      print("Tables supprimées.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      IHMprincipale.wait();
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      IHMprincipale.wait();
    }
  }
}
