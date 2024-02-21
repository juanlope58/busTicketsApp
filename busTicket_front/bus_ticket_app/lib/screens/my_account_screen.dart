import 'package:bus_ticket_app/screens/bookings_screen.dart';
import 'package:bus_ticket_app/screens/help_screen.dart';
import 'package:bus_ticket_app/screens/home_page.dart';
import 'package:bus_ticket_app/screens/login_page.dart';
import 'package:bus_ticket_app/screens/register_page.dart';
import 'package:bus_ticket_app/utils/user_state.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Account'),
        actions: [
          
          if (UserState.currentUser == null) ...[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ] else ...[
            TextButton(
              onPressed: () {
                
                UserState.signOut(); 
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ],
      ),
      body: Center(
        child: Text('My Account'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('My Bookings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingsScreen()));
              },
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}