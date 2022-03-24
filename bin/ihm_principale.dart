import 'dart:io';

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
      print("1- Gestion de la BDD");
      print("2- Gestion de la table Produit");
      print("3- Gestion de la table Editeur");
      print("4- Gestion de la table Auteur");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(3);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMprincipale.menuBDD();
      } else if (choix == 2) {
        await IHMProduit.menu();
      } else if (choix == 3) {
        await IHMEditeur.menu();
      }else if (choix == 4) {
        await IHMAuteur.menu();
      }
    }
    return 0;
  }
}
