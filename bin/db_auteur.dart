import 'dart:developer';

import 'package:mysql1/mysql1.dart';

import 'auteur.dart';

class DBAuteur {
  static Future<Auteur> selectAuteur(
      ConnectionSettings settings, int id) async {
    Auteur aut = Auteur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SELECT * FROM Auteur WHERE id=" +
            id.toString() +
            " AND EXISTS (SELECT id FROM auteur WHERE id=" +
            id.toString() +
            ");";
        Results reponse = await conn.query(requete);
        aut = Auteur(
            reponse.first['id'], reponse.first['nom'], reponse.first['prenom']);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
    return aut;
  }

  static Future<List<Auteur>> selectAllAuteur(
      ConnectionSettings settings) async {
    List<Auteur> listeAut = [];
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SELECT * FROM Auteur;";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Auteur aut = Auteur(row['id'], row['nom'], row['prenom']);
          listeAut.add(aut);
        }
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return listeAut;
  }
}
