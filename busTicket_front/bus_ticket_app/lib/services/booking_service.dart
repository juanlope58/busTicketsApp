import 'dart:convert';

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/booking.dart';

import 'package:http/http.dart' as http;

class BookingService {
  Future<bool> proceedWithBooking(Map<String, dynamic> bookingData) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/bookings'), 
        headers: {'Content-Type':'application/json'},
        body: jsonEncode(bookingData),
      );

      if (response.statusCode == 200) {
        
        return true;
      } else {
        
        return false;
      }
    } catch (e) {
      
      print('Error during booking: $e');
      return false;
    }
  }

  Future<List<Booking>> getBookingsByUserId(int userId) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/bookings?userId=$userId'));

      if (response.statusCode == 200) {
        
        List<dynamic> data = json.decode(response.body);
        List<Booking> bookings = data.map((item) => Booking.fromJson(item)).toList();
        return bookings;
      } else {
        
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      
      print('Error during booking request: $e');
      throw Exception('Failed to load bookings');
    }
  }
}