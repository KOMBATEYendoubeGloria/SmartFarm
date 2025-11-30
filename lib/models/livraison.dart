
class Livraison {
  int? idLivraison;
  String? matriculeVehicule;
  double? distanceLivraison;
  double? carburantLivraison; //en litre par kilomètre
  String? depart;
  String? arrivee;
  double? estimationTempLivraison, tempReelLivraison;

  Livraison({this.idLivraison, 
  this.matriculeVehicule,
  this.distanceLivraison,
  this.carburantLivraison,
  this.depart,
  this.arrivee,
  this.estimationTempLivraison,
  this.tempReelLivraison});

  //Convertir Livraison en map
  Map<String, dynamic> toMap(){
    return{
      'idLivraison':idLivraison,
      'matriculeVehicule':matriculeVehicule,
      'distanceLivraison':distanceLivraison,
      'carburantLivraison': carburantLivraison,
      'depart':depart,
      'arrivee':arrivee,
      'estimationTempLivraison':estimationTempLivraison,
      'tempReelLivraison':tempReelLivraison
    };
  }

  
    //Convertir map en Livraison
     factory Livraison.fromMap(Map<String, dynamic> map){
          return Livraison(
            idLivraison: map['idLivraison'],
            matriculeVehicule: map['matriculeVehicule'],
            distanceLivraison: map['distanceLivraison'],
            carburantLivraison: map['carburantLivraison'],
            depart: map['depart'],
            arrivee: map['arrivee'],
            estimationTempLivraison: map['estimationTempLivraison'],
            tempReelLivraison: map['tempReelLivraison'],
          );
     }

}