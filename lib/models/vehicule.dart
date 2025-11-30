
class Vehicule{
    String? matriculeVehicule;
    double? consommationVehicule;
    int? capaciteMaxVehicule;

    Vehicule({this.matriculeVehicule,
    this.consommationVehicule,
    this.capaciteMaxVehicule});

    //Convertir en map
    Map<String, dynamic> toMap() {
      return{
          'matriculeVehicule':matriculeVehicule,
          'consommationVehicule':consommationVehicule,
          'capaciteMaxVehicule':capaciteMaxVehicule
      };
    }

    //Convertir map en Vehicule
    factory Vehicule.fromMap(Map<String, dynamic> map){
      return Vehicule(
        matriculeVehicule: map['matriculeVehicule'],
        consommationVehicule: map['consommationVehicule'],
        capaciteMaxVehicule: map['capaciteMaxVehicule']
      );
    }
}