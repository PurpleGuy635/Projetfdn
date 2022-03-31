import 'dart:io';

import 'ihm_auteur.dart';
import 'ihm_produit.dart';
import 'imh_editeur.dart';
import 'ihm_table.dart';

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

  //C'est une méthode de sasisie
  //elle retourne un chiffre choisie entre le chiffre 0 et le chiffre choisie
  static int choixMenu(int nbChoix) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir une action (0-$nbChoix)");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i >= 0 && i <= nbChoix) {
          saisieValide = true;
        } else {
          print("La saisie ne correspond à aucune action.");
        }
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  // methode des menus et actions
  // menu d'accueil
  static Future<int> menu() async {
    int choix = -1;
    while (choix != 0) {
      print("Menu Principal");
      print("1- Gestion de la table Produit");
      print("2- Gestion de la table Editeur");
      print("3- Gestion de la table table");
      print("4- Gestion de la table Auteur");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(5);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMProduit.affichemenu();
      } else if (choix == 2) {
        await IHMEditeur.affichemenu();
      } else if (choix == 3) {
        await IHMTable.affichemenu();
      } else if (choix == 4) {
        await IHMAuteur.affichemenu();
      }
    }
    return 0;
  }
}
