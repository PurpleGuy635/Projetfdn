import 'dart:developer';

import 'package:mysql1/mysql1.dart';
import 'editeur.dart';

class DBEditeur {
  static Future<Editeur> selectEditeur(
      ConnectionSettings settings, int id) async {
    Editeur edi = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SELECT * FROM Editeur WHERE id=" +
            id.toString() +
            " AND EXISTS (SELECT id FROM editeur WHERE id=" +
            id.toString() +
            ");";
        Results reponse = await conn.query(requete);
        edi = Editeur(
            reponse.first['id'], reponse.first['nom'], reponse.first['prenom']);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
    return edi;
  }

  static Future<List<Editeur>> selectAllEditeur(
      ConnectionSettings settings) async {
    List<Editeur> listeEdi = [];
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SELECT * FROM Editeur;";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Editeur edi = Editeur(row['id'], row['nom'], row['prenom']);
          listeEdi.add(edi);
        }
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return listeEdi;
  }
}
