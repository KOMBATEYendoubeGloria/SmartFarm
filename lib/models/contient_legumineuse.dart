
class ContientLegumineuse {
  int? idLegumineuse;
  int? idLivraison;
  double? qteLegumineuse;

  ContientLegumineuse({
    this.idLegumineuse,
    this.idLivraison,
    this.qteLegumineuse,
  });

  //Convertir en map
  Map<String,dynamic> toMap(){
    return{
        'idLegumineuse':idLegumineuse,
        'idLivraison': idLivraison,
        'qteLegumineuse':qteLegumineuse,
    };
  }

  //Convertir map en ContientLegumineuse
  factory ContientLegumineuse.fromMap(Map<String, dynamic> map){
    return ContientLegumineuse(
      idLegumineuse: map['idLegumineuse'],
      idLivraison: map['idLivraison'],
      qteLegumineuse: map['qteLegumineuse']
    );
  }
}