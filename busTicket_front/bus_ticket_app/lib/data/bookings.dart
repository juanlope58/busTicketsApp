class Booking {
  final String originCity;
  final String destinationCity;
  final DateTime date;
  final String hour;
  final int seat;

  Booking({
    required this.originCity,
    required this.destinationCity,
    required this.date,
    required this.hour,
    required this.seat,
  });
}
  // Lista ficticia de reservas
  List<Booking> bookings = [
    Booking(
      originCity: 'City A',
      destinationCity: 'City B',
      date: DateTime.now(),
      hour: '12:00 PM',
      seat: 1,
    ),
    Booking(
      originCity: 'City C',
      destinationCity: 'City D',
      date: DateTime.now().add(const Duration(days: 1)),
      hour: '3:30 PM',
      seat: 2,
    ),
    // Agrega más reservas según sea necesario
  ];
