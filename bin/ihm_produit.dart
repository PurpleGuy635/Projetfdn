import 'package:mysql1/mysql1.dart';

import 'db_produit.dart';
import 'ihm_principale.dart';
import 'produit.dart';

class IHMProduit {
  static Future<void> affichemenu(ConnectionSettings settings) async {
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
        await IHMProduit.menuSelectPro(settings);
      } else if (choix == 2) {
        await IHMProduit.updateProduit(settings);
      } else if (choix == 3) {
        await IHMProduit.insertProduit(settings);
      } else if (choix == 4) {
        await IHMProduit.deleteProduit(settings);
      } else if (choix == 5) {
        await IHMProduit.deleteAllProduit(settings);
      }
    }
    print("Menu précédént");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuSelectPro(ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("Menu - Select Produits");
      print("1- Afficher selon ID");
      print("2- Afficher toute la table.");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(2);
      print("--------------------------------------------------");

      if (choix == 1) {
        await IHMProduit.selectProduit(settings);
        await IHMProduit.selectProduit(settings);
      } else if (choix == 2) {
        await IHMProduit.selectAllProduit(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> insertProduit(ConnectionSettings settings) async {
    String nom = IHMprincipale.saisieString("nom");
    String email = IHMprincipale.saisieString("email");
    int age = IHMprincipale.saisieInt();
    if (IHMprincipale.confirmation()) {
      //await DBProduit.insertProduit(nom, email, age);
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

  static Future<void> updateProduit(ConnectionSettings settings) async {
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

  static Future<void> deleteProduit(ConnectionSettings settings) async {
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

  static Future<void> deleteAllProduit(ConnectionSettings settings) async {
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

  static Future<void> selectProduit(ConnectionSettings settings) async {
    print("Quelle Produit voulez vous afficher ?");
    int id = IHMprincipale.saisieID();
    Produit pro = await DBProduit.selectProduit(settings, id);
    if (!pro.estNull()) {
      IHMprincipale.afficherUneDonnee(pro);
      print("Fin de l'opération.");
      print("--------------------------------------------------");
    } else {
      print("Le Produit $id n'existe pas");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
    }
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> selectAllProduit(ConnectionSettings settings) async {
    List<Produit> listePro = await DBProduit.selectAllProduit(settings);
    if (listePro.isNotEmpty) {
      IHMprincipale.afficherDesDonnees(listePro);
      print("Fin de l'opération.");
      print("--------------------------------------------------");
    } else {
      print("la table est vide");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
    }
    IHMprincipale.wait();
  }
}
