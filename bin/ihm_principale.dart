import 'dart:io';

import 'ihm_auteur.dart';
import 'ihm_produit.dart';
import 'imh_editeur.dart';

class IHMprincipale {
  static void titre() {
    print("");
    print("Bienvenue dans :");
    print("le furet du nord");
    print("--------------------------------------------------");
  }

  static void quitter() {
    print("");
    print("--------------------------------------------------");
    print("au revoir");
    print("programme dévelopé par");
    print("François Oudart");
    print("Lucas Delfosse");
    print("--------------------------------------------------");
  }

  // methode des menus et actions
  // menu d'accueil
  static Future<int> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("Menu Principal");
      print("1- Gestion de la table Produit");
      print("2- Gestion de la table Editeur");
      print("3- Gestion de la table Auteur");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(4);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMProduit.affichemenu();
      } else if (choix == 2) {
        await IHMEditeur.affichemenu();
      } else if (choix == 3) {
        await IHMAuteur.affichemenu();
      }
    }
    return 0;
  }
}
