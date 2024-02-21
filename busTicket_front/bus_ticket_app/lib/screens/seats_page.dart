import 'package:bus_ticket_app/models/seat.dart';
import 'package:bus_ticket_app/models/trip.dart';
import 'package:bus_ticket_app/screens/bookings_screen.dart';
import 'package:bus_ticket_app/screens/home_page.dart';
import 'package:bus_ticket_app/screens/login_page.dart';
import 'package:bus_ticket_app/services/booking_service.dart';
import 'package:bus_ticket_app/services/seat_service.dart';
import 'package:bus_ticket_app/utils/adapt.dart';
import 'package:bus_ticket_app/utils/custom_snack_bar.dart';
import 'package:bus_ticket_app/utils/user_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class SeatsPage extends StatefulWidget {
  final Trip trip;

  SeatsPage({required this.trip});

  @override
  _SeatsPageState createState() => _SeatsPageState();

}

class _SeatsPageState extends State<SeatsPage> {

  Logger logger = Logger();
  late List<Seat> seats;

  void _proceedWithBooking() {
    if (UserState.currentUser == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      return;
    }

    List<Seat> selectedSeats = seats.where((seat) => seat.selected).toList();

    // Verificar si se han seleccionado asientos
    if (selectedSeats.isEmpty) {
      CustomSnackBar.showInfo(context, 'Select a seat');
      return;
    }

    // Construir el cuerpo de la solicitud para el backend
    final userId = UserState.currentUser!.id;

    selectedSeats.forEach((seat) {
      final bookingData = {
        'tripId': widget.trip.id,
        'userId': userId,
        'seatId': seat.id,
      };

      // Realizar la reserva llamando al servicio de reserva
      BookingService bookingService = BookingService();
      bookingService.proceedWithBooking(bookingData);
    });
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

  }

  @override
  void initState() {
    super.initState();
    seats=[];
    loadSeats();
  }

  Future<void> loadSeats() async {
    try {
      final List<Seat> loadedSeats = await SeatService().getSeatsByTrip(widget.trip.id);
      setState(() {
        seats = loadedSeats;
      });
    } catch (e) {
      logger.e('Error loading seats: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    bool anySeatSelected = seats.any((seat) => seat.selected);

    return Scaffold(
      appBar: AppBar(
        title: Text('Seats for ${widget.trip.originCity.cityName} to ${widget.trip.destinationCity.cityName}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${DateFormat('yyyy-MM-dd').format(widget.trip.date)}'),
          _buildSeatsList(),

          SizedBox(
              width: Adapt.wp(100, context),
              child: ElevatedButton(
                onPressed: () {
                  if(anySeatSelected){
                    _proceedWithBooking();
                  }else{
                    CustomSnackBar.showInfo(context, 'Select a seat');
                  }
                },
                child: Text("Procced")),
            )
        ],
      ),
    );
  }

  Widget _buildSeatsList() {
 
    if (seats.isEmpty) {
      return Center(
        child: Text('No seats available'),
      );
    }

    return Container(
      height: Adapt.hp(80, context),
      width: Adapt.wp(80, context),
      margin: EdgeInsets.all(Adapt.px(15)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Seats',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
      
            // Lista de asientos con GridView.builder
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: seats.length,
              itemBuilder: (context, index) {
                final seat = seats[index];
                return _buildSeatItem(seat);
              },
            ),
            
          ],
        ),
      ),
    );
  }



  Widget _buildSeatItem(Seat seat) {
  Color iconColor;

  if (!seat.available) {
    iconColor = const Color.fromARGB(255, 173, 23, 23); 
  } else {
    iconColor = seat.selected ? Colors.green : Colors.white;
  }

  return GestureDetector(
    onTap: () {
      // Solo permite seleccionar y deseleccionar seats disponibles
      if (seat.available) {
        setState(() {
          // Cambia el estado selected
          seat.selected = !seat.selected;
        });
      }
    },
    child: Icon(
      Icons.chair,
      size: Adapt.px(70),
      color: iconColor,
    ),
  );
}

  
}