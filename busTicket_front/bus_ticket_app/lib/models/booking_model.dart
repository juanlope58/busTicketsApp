class BookingModel {
  final int id;
  final String username;
  final String originCity;
  final String destinationCity;
  final DateTime date;
  final String hour;
  final int seat;
  final String company;

  BookingModel({
    required this.id,
    required this.username,
    required this.originCity,
    required this.destinationCity,
    required this.date,
    required this.hour,
    required this.seat,
    required this.company,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json){
    return BookingModel(
      id: json['id'],
      username: json['username'],
      originCity: json['origin_city'],
      destinationCity: json['destination_city'],
      date: json['date'],
      hour: json['hour'],
      seat: json['seat'],
      company: json['company'],

    );
  }

  Map<String, dynamic> toJson(){
    return ({
      'id':id,
      'username':username,
      'originCity':originCity,
      'destinationCity' : destinationCity,
      'date' : date,
      'hour' : hour,
      'seat' : seat,
      'company' : company,
    });
  }
}

