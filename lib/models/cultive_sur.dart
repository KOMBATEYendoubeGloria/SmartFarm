class CultiveSur {
  int? idSection;
  int? idLegumineuse;

  CultiveSur({this.idSection,this.idLegumineuse});

  //Convertir en map
  Map<String,dynamic> toMap(){
    return{
      'idSection':idSection,
      'idLegumineuse':idLegumineuse
    };
  }

  //Convertir class en map
  factory CultiveSur.fromMap(Map<String, dynamic> map) {
    return CultiveSur(
      idSection: map['idSection'],
      idLegumineuse: map['idLegumineuse'],
    );
  }
}