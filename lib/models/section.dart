
class Section{
  int? idSection;
  double? superficieSection;

  Section({this.idSection, this.superficieSection});
  
  //Convertir Section en map
  Map<String, dynamic> toMap(){
    return{
      'idSection' : idSection,
      'superficieSection':superficieSection
    };
  }

  //Convertir map en Section
  factory Section.fromMap(Map<String,dynamic>map){
    return Section(
      idSection: map['idSection'],
      superficieSection: map['superficieSection']
    );
  }
  }


