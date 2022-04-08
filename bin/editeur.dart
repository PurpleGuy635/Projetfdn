import 'data.dart';

class Editeur implements Data {
  int _id = 0;
  String _nom = "";
  String _prenom = "";

  Editeur(this._id, this._nom, this._prenom);
  Editeur.sansID(this._nom, this._prenom);
  Editeur.fromListString(List<String> unEdi) {
    if (unEdi.length == 7) {
      this._id = int.parse(unEdi[0]);
      this._nom = unEdi[1];
      this._prenom = (unEdi[2]);
    }
  }
  Editeur.vide();

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
