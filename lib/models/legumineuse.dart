class Legumineuse {
  int? idLegumineuse;
  String? nomLegumineuse;

  Legumineuse({this.idLegumineuse, this.nomLegumineuse});

  //Convertir legumineuse en Map
  Map<String, dynamic> toMap() {
    return{
      'idLegumineuse':idLegumineuse,
      'nomLegumineuse':nomLegumineuse,
    };
  }

  //Convertir map en Legumnineuse
  factory Legumineuse.fromMap(Map<String, dynamic> map) {
    return Legumineuse(
      idLegumineuse: map['idLegumineuse'],
      nomLegumineuse: map['nomLegumineuse']
    );
  }
}
