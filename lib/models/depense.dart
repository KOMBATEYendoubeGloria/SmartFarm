

class Depense{
  int idDepense = 0;
  int idSection = 0;
  int jourDepense = 0;
  int moisDepense = 0;
  int anneeDepense = 0;
  double? valeurDepense;
  String? motifDepense;

  Depense({required this.idDepense,required this.idSection, required this.jourDepense, required this.moisDepense, required this.anneeDepense,this.valeurDepense, this.motifDepense});

  //Convertir Depense en Map
  Map<String, dynamic> toMap(){
    return{
      'idDepense':idDepense,
      'idSection': idSection,
      'jourDepense':jourDepense,
      'moisDepense':moisDepense,
      'anneeDepense':anneeDepense,
      'valeurDepense':valeurDepense,
      'motifDepense':motifDepense,
    };
  }

  //Convertir map en Depense
  factory Depense.fromMap(Map<String, dynamic> map){
      return Depense(
      idDepense: map['idDepense'],
      idSection: map['idSection'], 
      jourDepense: map['jourDepense'], 
      moisDepense: map['moisDepense'], 
      anneeDepense: map['anneeDepense'],
      valeurDepense: map['valeurDepense'],
      motifDepense: map['motifDepense']);
  }
}
