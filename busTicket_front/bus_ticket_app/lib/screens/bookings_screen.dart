import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  final List<String> userBookings = [
    'Reserva 1 - Destino A',
    'Reserva 2 - Destino B',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    'Reserva 3 - Destino C',
    // ... Puedes agregar más reservas según sea necesario
  ];

  BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Bookings',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.85, // Ajusta la altura según tus necesidades
        child: ListView.builder(
          itemCount: userBookings.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: Colors.blue,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                onTap: () {},
                title: Center(
                  child: Text(
                    'Booking ${index + 1}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    userBookings[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
),
    );
  }
}