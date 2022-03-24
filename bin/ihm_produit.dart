class IHMProduit {
  static Future<void> affichemenu() async {
    print("--------------------------------");
    print("menu gestion de la table Produit");
    print("");
    print("+------------------------+");
    print("| 1 - consulter la table |");
    print("| 2 - modifié une valeur |");
    print("| 3 - inséré une valeur  |");
    print("| 4 - suprimé une valeur |");
    print("|                        |");
    print("| 0 - quitter            |");
    print("+------------------------+");
  }
}
