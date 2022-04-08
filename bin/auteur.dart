import 'data.dart';

class Auteur implements Data {
  int _id = 0;
  String _nom = "";
  String _prenom = "";

  Auteur(this._id, this._nom, this._prenom);
  Auteur.sansID(this._nom, this._prenom);
  Auteur.fromListString(List<String> unAut) {
    if (unAut.length == 7) {
      this._id = int.parse(unAut[0]);
      this._nom = unAut[1];
      this._prenom = (unAut[2]);
    }
  }
  Auteur.vide();

  int getId() {
    return this._id;
  }

  String getNom() {
    return this._nom;
  }

  String getprenom() {
    return this._prenom;
  }

  bool estNull() {
    bool estnull = false;
    if (_id == 0 && _nom == "" && _prenom == "") {
      estnull = true;
    }
    return estnull;
  }

  @override
  String getEntete() {
    return "| id | nom | prenom |";
  }

  @override
  String getInLine() {
    return "| " +
        _id.toString() +
        " | " +
        _nom +
        " | " +
        _prenom.toString() +
        " | ";
  }
}
