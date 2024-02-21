import 'package:bus_ticket_app/models/city.dart';
import 'package:bus_ticket_app/models/company.dart';

class Trip {
  int id;
  City originCity;
  City destinationCity;
  DateTime date;
  String hour;
  Company company;

  Trip({
    required this.id,
    required this.originCity,
    required this.destinationCity,
    required this.date,
    required this.hour,
    required this.company,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      originCity: City.fromJson(json['originCity']),
      destinationCity: City.fromJson(json['destinationCity']),
      date: DateTime.parse(json['date']),
      hour: json['hour'],
      company: Company.fromJson(json['company']),
    );
  }
}