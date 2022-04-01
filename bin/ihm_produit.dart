import 'ihm_principale.dart';

class IHMProduit {
  static Future<void> affichemenu() async {
    int choix = -1;
    while (choix != 0) {
      print("--------------------------------");
      print("menu gestion de la table Produit");
      print("");
      print("+-------------------------------+");
      print("| 1 - consulter la table        |");
      print("| 2 - modifié une valeur        |");
      print("| 3 - inséré une valeur         |");
      print("| 4 - suprimé une valeur        |");
      print("| 5 - effacer toute les valeurs |");
      print("|                               |");
      print("| 0 - quitter                   |");
      print("+-------------------------------+");

      choix = IHMprincipale.choixMenu(5);
      print("--------------------------------");

      if (choix == 1) {
        await IHMProduit.menuSelectPro();
      } else if (choix == 2) {
        await IHMProduit.updateProduit();
      } else if (choix == 3) {
        await IHMProduit.insertProduit();
      } else if (choix == 4) {
        await IHMProduit.deleteProduit();
      } else if (choix == 5) {
        await IHMProduit.deleteAllProduit();
      }
    }
    print("Menu précédént");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuSelectPro() async {
    int choix = -1;
    while (choix != 0) {
      print("Menu - Select Produits");
      print("1- Afficher selon ID");
      print("2- Afficher toute la table.");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(2);
      print("--------------------------------------------------");

      if (choix == 1) {
        //await IHMEtudiants.selectEtudiant();
      } else if (choix == 2) {
        //await IHMEtudiants.selectAllEtudiants();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> insertProduit() async {
    //String nom = IHMprincipale.saisieString();
    //String email = IHMprincipale.saisieString();
    //int age = IHMprincipale.saisieInt();
    if (IHMprincipale.confirmation()) {
      //await DBEtudiant.insertEtudiant(nom, email, age);
      print("Produit inséré dans la table.");
      print("--------------------------------------------------");
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
    }
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }
}
