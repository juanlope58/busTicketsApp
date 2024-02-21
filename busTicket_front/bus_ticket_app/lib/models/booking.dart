
import 'package:bus_ticket_app/models/seat.dart';
import 'package:bus_ticket_app/models/trip.dart';
import 'package:bus_ticket_app/models/user.dart';

class Booking {
  final int id;
  final Trip trip;
  final User user;
  final Seat seat;

  Booking({
    required this.id,
    required this.trip,
    required this.user,
    required this.seat,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      trip: Trip.fromJson(json['trip']),
      user: User.fromJson(json['user']),
      seat: Seat.fromJson(json['seat']),
    );
  }
}



//   factory Booking.fromJson(Map<String, dynamic> json){
//     return Booking(
//       id: json['id'],
//       username: json['username'],
//       originCity: json['origin_city'],
//       destinationCity: json['destination_city'],
//       date: json['date'],
//       hour: json['hour'],
//       seat: json['seat'],
//       company: json['company'],

//     );
//   }

//   Map<String, dynamic> toJson(){
//     return ({
//       'id':id,
//       'username':username,
//       'originCity':originCity,
//       'destinationCity' : destinationCity,
//       'date' : date,
//       'hour' : hour,
//       'seat' : seat,
//       'company' : company,
//     });
//   }
// }

