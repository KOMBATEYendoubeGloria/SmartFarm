class AffecterEmploye {
  int? idEmploye;
  int? idSection;
  int? qteEmploye;

  AffecterEmploye({this.idEmploye,
  this.idSection,
  this.qteEmploye});

  //Convertir en map
  Map<String,dynamic> topMap(){
    return{
      'idEmploye':idEmploye,
      'idSection':idSection,
      'qteEmploye':qteEmploye
    };
  }

  //Convertir map en AffecterEmploye
    factory AffecterEmploye.fromMap(Map<String, dynamic> map){
      return AffecterEmploye(
        idEmploye: map['idEmploye'],
        idSection: map['idSection'],
        qteEmploye: map['qteEmploye']
      );
    }
}