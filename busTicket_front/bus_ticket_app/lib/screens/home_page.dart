import 'package:bus_ticket_app/screens/bookings_screen.dart';
import 'package:bus_ticket_app/screens/help_screen.dart';
import 'package:bus_ticket_app/screens/home_screen.dart';
import 'package:bus_ticket_app/screens/my_account_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [HomeScreen(), BookingsScreen(), HelpScreen(), MyAccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _screens[_currentIndex],
      bottomNavigationBar:
        BottomNavigationBar(
          
          backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 40,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel, size: 40,), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.live_help_rounded,size: 40,), label: 'help'),
            BottomNavigationBarItem(icon: Icon(Icons.person, size:40), label: 'My Account'),
          ],
          type: BottomNavigationBarType.fixed, // Asegura que los labels siempre estén visibles
          selectedItemColor: Colors.white, // Color de resaltado cuando se toca un ítem
          unselectedItemColor: Colors.grey.withOpacity(0.5), // Color de ítems no seleccionados
  
         ) 
    );
  }
}