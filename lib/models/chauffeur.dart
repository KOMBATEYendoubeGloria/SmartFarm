class Chauffeur {
  int? idChauffeur;
  String? nomCompletChauffeur;
  String? permisChauffeur;
  String? disponibiliteChauffeur;

  Chauffeur({
    this.idChauffeur,
    this.nomCompletChauffeur,
    this.permisChauffeur,
    this.disponibiliteChauffeur,
  });

  Map<String, dynamic> topMap() {
    return {
      'idChauffeur': idChauffeur,
      'nomCompletChauffeur': nomCompletChauffeur,
      'permisChauffeur': permisChauffeur,
      'disponibiliteChauffeur': disponibiliteChauffeur,
    };
  }

  factory Chauffeur.fromMap(Map<String, dynamic> map) {
    return Chauffeur(
      idChauffeur: map['idChauffeur'],
      nomCompletChauffeur: map['nomCompletChauffeur'],
      permisChauffeur: map['permisChauffeur'],
      disponibiliteChauffeur: map['disponibiliteChauffeur'],
    );
  }
}
