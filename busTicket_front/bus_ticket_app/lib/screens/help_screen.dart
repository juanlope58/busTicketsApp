import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpScreen> {
   String selectedOption = ''; // Variable para almacenar la opción seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Help'),
      ),
      body: Center(
        child: Text(
          'Contenido de la página de ayuda',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para iniciar el chat
          // Puedes implementar la lógica para abrir una página de chat o cualquier otra acción
          // por ejemplo, Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
        },
        child: Icon(Icons.chat),
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
                'Menú de Ayuda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                handleOptionSelected('about_us');
                Navigator.pop(context); // Cierra el drawer
              },
              selected: selectedOption == 'about_us',
            ),
            ListTile(
              title: Text('Offers'),
              onTap: () {
                handleOptionSelected('offers');
                Navigator.pop(context); // Cierra el drawer
              },
              selected: selectedOption == 'offers',
            ),
            ListTile(
              title: Text('PQRS'),
              onTap: () {
                handleOptionSelected('pqrs');
                Navigator.pop(context); // Cierra el drawer
              },
              selected: selectedOption == 'pqrs',
            ),
          ],
        ),
      ),
    );
  }

  // Función para manejar la opción seleccionada
  void handleOptionSelected(String option) {
    setState(() {
      selectedOption = option;
    });

    // Aquí puedes agregar la lógica adicional según la opción seleccionada
  }
}