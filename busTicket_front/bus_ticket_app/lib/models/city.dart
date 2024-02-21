class City {
  final int id;
  final String cityName;

  City({
    required this.id,
    required this.cityName
  });

  factory City.fromJson(Map<String, dynamic> json){
    return City(
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