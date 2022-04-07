import 'dart:developer';

import 'package:mysql1/mysql1.dart';
import 'db_config.dart';
import 'produit.dart';

class DBProduit {
  static Future<Produit> selectProduit(
      ConnectionSettings settings, int id) async {
    Produit pro = Produit.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SELECT * FROM Produit WHERE id=" +
            id.toString() +
            " AND EXISTS (SELECT id FROM produit WHERE id=" +
            id.toString() +
            ");";
        Results reponse = await conn.query(requete);
        pro = Produit(
            reponse.first['id'],
            reponse.first['nom'],
            reponse.first['stock'],
            reponse.first['dateParution'],
            reponse.first['Type'],
            reponse.first['prix'],
            reponse.first['idEditeur']);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
    return pro;
  }
}
