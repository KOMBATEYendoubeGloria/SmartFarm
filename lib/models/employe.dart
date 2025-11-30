class Employe {
  int? idEmploye;
  String? nomCompletEmploye;
  int? ageEmploye;
  String? posteEmploye;
  String? disponibiliteEmploye;

  Employe({this.idEmploye,this.nomCompletEmploye,this.ageEmploye,this.posteEmploye,this.disponibiliteEmploye});

  //Convertir en map
  Map<String,dynamic> toMap(){
    return{
        'idEmploye':idEmploye,
        'nomCompletEmploye':nomCompletEmploye,
        'ageEmploye':ageEmploye,
        'posteEmploye':posteEmploye,
        'disponibiliteEmploye':disponibiliteEmploye
    };
  }

  factory Employe.fromMap(Map<String, dynamic> map){
    return Employe(
      idEmploye: map['idEmploye'],
      nomCompletEmploye: map['nomCompletEmploye'],
      ageEmploye: map['ageEmploye'],
      posteEmploye: map['posteEmploye'],
      disponibiliteEmploye: map['disponibiliteEmploye']
    );
  }
}