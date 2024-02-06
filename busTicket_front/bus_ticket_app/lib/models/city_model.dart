class CityModel {
  final int id;
  final String cityName;

  CityModel({
    this.id = 0,
    required this.cityName
  });

  factory CityModel.fromJson(Map<String, dynamic> json){
    return CityModel(
      id: json['id'],
      cityName: json['city_name']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'city_name' : cityName,
    };
  }
  
}