import 'package:bus_ticket_app/models/trip.dart';
import 'package:bus_ticket_app/screens/seats_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripsPage extends StatelessWidget {
  final List<Trip> filteredTrips;

  TripsPage({required this.filteredTrips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Trips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtered Trips',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _buildTripsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripsList() {
    return ListView.builder(
      itemCount: filteredTrips.length,
      itemBuilder: (context, index) {
        final trip = filteredTrips[index];

        final formattedDate = DateFormat('yyyy-MM-dd').format(trip.date);

        return ListTile(
          title: Text('Origin: ${trip.originCity.cityName}'),
          subtitle: Text('Destination: ${trip.destinationCity.cityName}\nDate: $formattedDate'),
          //Me falta agregar detalles del viaje
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeatsPage(trip: trip)),
            );
          },
        );
      },
    );
  }
}