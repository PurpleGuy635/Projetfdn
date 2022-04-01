import 'ihm_principale.dart';

class IHMAuteur {
  static Future<void> affichemenu() async {
    int choix = -1;
    while (choix != 0) {
      print("--------------------------------");
      print("menu gestion de la table Editeur");
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
        await IHMAuteur.menuSelectEdi();
      } else if (choix == 2) {
        await IHMAuteur.updateEditeur();
      } else if (choix == 3) {
        await IHMAuteur.insertEditeur();
      } else if (choix == 4) {
        await IHMAuteur.deleteEditeur();
      } else if (choix == 5) {
        await IHMAuteur.deleteAllEditeur();
      }
    }
    print("Menu précédént");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuSelectEdi() async {
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

  static Future<void> insertEditeur() async {
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

  static Future<void> updateEditeur() async {
    print("Quelle Etudiant voulez vous mettre à jour ?");
    int id = IHMprincipale.saisieID();
    //if (await DBProduit.exist(id)) {
    if (id != 635) {
      String nom = IHMprincipale.saisieString("nom");
      String email = IHMprincipale.saisieString("email");
      int age = IHMprincipale.saisieInt();
      if (IHMprincipale.confirmation()) {
        //await DBEtudiant.updateEtudiant(id, nom, email, age);
        print("Produit $id mis à jour.");
        print("--------------------------------------------------");
      } else {
        print("Annulation de l'opération.");
        print("--------------------------------------------------");
      }
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Le Produit $id n'existe pas");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> deleteEditeur() async {
    print("Quelle Etudiant voulez vous supprimer ?");
    int id = IHMprincipale.saisieID();
    if (IHMprincipale.confirmation()) {
      //DBEtudiant.deleteEtudiant(id);
      print("Etudiant $id supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> deleteAllEditeur() async {
    if (IHMprincipale.confirmation()) {
      //DBEtudiant.deleteAllEtudiant();
      print("Tables supprimées.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
