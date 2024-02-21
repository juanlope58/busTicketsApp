class Seat {
  final int id;
  final String identifier;
  final bool available;
  bool selected;

  Seat({
    required this.id,
    required this.identifier,
    required this.available,
    this.selected=false,
  });

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      id: json['id'],
      identifier: json['identifier'],
      available: json['available'],
    );
  }
}