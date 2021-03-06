import 'dart:io';
import 'package:mysql1/mysql1.dart';

import 'data.dart';
import 'db_config.dart';
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

  // module de confirmation
  static bool confirmation() {
    bool saisieValide = false;
    bool confirme = false;
    while (!saisieValide) {
      print("Confirmer vous l'action ? (o/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse.toLowerCase() == "o") {
        saisieValide = true;
        confirme = true;
      } else if (reponse.toLowerCase() == "n") {
        saisieValide = true;
        print("Annulation.");
      } else {
        print("Erreur dans la saisie.");
      }
    }
    return confirme;
  }

  // retourne un string pour saisie de chaine de caractère masqué
  static String saisieMDP() {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      print("> Veuillez saisir le mot de passe :");
      try {
        stdin.echoMode = false; //permet de mettre un mdp en invisible
        s = stdin.readLineSync().toString();
        saisieValide = true;
        stdin.echoMode = true; //permet de remettre la visibiliter
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  // retourne un string pour saisie de chaine de caractère
  static String saisieString(String objectifSaisie) {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      print("> Veuillez saisir $objectifSaisie :");
      try {
        s = stdin.readLineSync().toString();
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  static int saisieInt() {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir un entier :");
      try {
        i = int.parse(stdin.readLineSync().toString());
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  static int saisieID() {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir l'id correspondant:");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i > 0) {
          saisieValide = true;
        } else {
          print("La valeur saisie est inférieur ou égale à zéro.");
        }
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  //methode des menus et actions
  //menu setting
  static ConnectionSettings setting() {
    String bdd = IHMprincipale.saisieString("le nom de la BDD");
    String user = IHMprincipale.saisieString("l'utilisateur");
    String mdp = IHMprincipale.saisieMDP();

    return ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: user,
      password: mdp,
      db: bdd,
    );
  }

  // methode des menus et actions
  // menu d'accueil
  static Future<int> menu(ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("Menu Principal");
      print("1- Gestion de la table Produit");
      print("2- Gestion de la table Editeur");
      print("3- Gestion de la table Auteur");
      print("4- Gestion des tables");
      print("0- Quitter");
      choix = IHMprincipale.choixMenu(5);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMProduit.affichemenu(settings);
      } else if (choix == 2) {
        await IHMEditeur.affichemenu(settings);
      } else if (choix == 3) {
        await IHMAuteur.affichemenu(settings);
      } else if (choix == 4) {
        await IHMTables.menuBDD(settings);
      }
    }
    return 0;
  }

  static void wait() {
    print("Appuyez sur entrer pour continuer ...");
    stdin.readLineSync();
  }

  static void afficherUneDonnee(Data data) {
    print(data.getEntete());
    print(data.getInLine());
  }

  static void afficherDesDonnees(List<Data> dataList) {
    print(dataList.first.getEntete());
    for (var Etudiant in dataList) {
      print(Etudiant.getInLine());
    }
  }
}
