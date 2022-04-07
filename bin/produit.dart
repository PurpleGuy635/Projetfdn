import 'data.dart';

class Produit implements Data {
  int _id = 0;
  String _nom = "";
  int _Stock = 0;
  String _DateParution = "";
  String _Type = "";
  int _Prix = 0;
  int _idEditeur = 0;

  Produit(this._id, this._nom, this._Stock, this._DateParution, this._Type,
      this._Prix, this._idEditeur);
  Produit.sansID(this._nom, this._Stock, this._DateParution, this._Type,
      this._Prix, this._idEditeur);
  Produit.fromListString(List<String> unPro) {
    if (unPro.length == 7) {
      this._id = int.parse(unPro[0]);
      this._nom = unPro[1];
      this._Stock = int.parse(unPro[2]);
      this._DateParution = unPro[3];
      this._Type = unPro[4];
      this._Prix = int.parse(unPro[5]);
      this._idEditeur = int.parse(unPro[6]);
    }
  }
  Produit.vide();

  int getId() {
    return this._id;
  }

  String getNom() {
    return this._nom;
  }

  int getStock() {
    return this._Stock;
  }

  String getDateParution() {
    return this._DateParution;
  }

  String getType() {
    return this._Type;
  }

  int getPrix() {
    return this._Prix;
  }

  int getidEditeur() {
    return this._idEditeur;
  }

  bool estNull() {
    bool estnull = false;
    if (_id == 0 &&
        _nom == "" &&
        _Stock == 0 &&
        _DateParution == "" &&
        _Type == "" &&
        _Prix == 0 &&
        _idEditeur == 0) {
      estnull = true;
    }
    return estnull;
  }

  @override
  String getEntete() {
    return "| id | nom | Stock | Date de Parution | Type | Prix | idEditeur |";
  }

  @override
  String getInLine() {
    return "| " +
        _id.toString() +
        " | " +
        _nom +
        " | " +
        _Stock.toString() +
        " | " +
        _DateParution +
        " |" +
        _Type +
        " | " +
        _Prix.toString() +
        " | " +
        _idEditeur.toString();
  }
}
