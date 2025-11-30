class Rendement {
  int? idRendement;
  int? idSection;
  int? moisRendement;
  int? anneeRendement;
  double? rendementFinancier;
  double? rendementPhysique;

  Rendement({
    this.idRendement,
    this.idSection,
    this.moisRendement,
    this.anneeRendement,
    this.rendementFinancier,
    this.rendementPhysique,
  });

  Map<String, dynamic> toMap() {
    return {
      'idRendement': idRendement,
      'idSection': idSection,
      'moisRendement': moisRendement,
      'anneeRendement': anneeRendement,
      'rendementFinancier': rendementFinancier,
      'rendementPhysique': rendementPhysique,
    };
  }

  factory Rendement.fromMap(Map<String, dynamic> map) {
    return Rendement(
      idRendement: map['idRendement'],
      idSection: map['idSection'],
      moisRendement: map['moisRendement'],
      anneeRendement: map['anneeRendement'],
      rendementFinancier: map['rendementFinancier'],
      rendementPhysique: map['rendementPhysique'],
    );
  }
}
