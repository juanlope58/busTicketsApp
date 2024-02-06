import 'package:bus_ticket_app/data/cities.dart';
import 'package:bus_ticket_app/utils/adapt.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> cities = [];
  String selectedOriginCity = ' ';
  String selectedDestinationCity = ' ';
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    cities = ['Select City', ...listCities];
    if (cities.isNotEmpty){
        selectedOriginCity = cities.first;
        selectedDestinationCity = cities.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Bus Tickets',
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        height: Adapt.hp(50, context),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.2)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //origin city field
                  DropdownButtonFormField<String>(
                    
                    value: selectedOriginCity,
                    items: cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        enabled: city != 'Select City',
                        child: Text(city,style: TextStyle(fontSize: Adapt.px(20)),),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedOriginCity = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Origin City',
                      labelStyle: TextStyle(fontSize: Adapt.px(30), color: Colors.blue)
                    ),
                  ),
                  const SizedBox(height: 16.0),
              
                  // destination city field
                  DropdownButtonFormField<String>(
                    value: selectedDestinationCity,
                    items: cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        enabled: city != 'Select City',
                        child: Text(city,style: const TextStyle(fontSize: 20),),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedDestinationCity = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Destination City',
                      labelStyle: TextStyle(fontSize: 22, color: Colors.blue)
                    ),
                  ),
                  const SizedBox(height: 16.0),
              
                  // Campo de selección de fecha
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(fontSize: 22, color: Colors.blue)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          ),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
              
                  // Botón para proceder con la búsqueda
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: const Text('Search Trip', style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}