// ignore_for_file: use_build_context_synchronously

import 'package:bus_ticket_app/models/city.dart';
import 'package:bus_ticket_app/models/trip.dart';
import 'package:bus_ticket_app/screens/trips_page.dart';
import 'package:bus_ticket_app/services/city_service.dart';
import 'package:bus_ticket_app/services/trip_service.dart';
import 'package:bus_ticket_app/utils/adapt.dart';
import 'package:bus_ticket_app/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Logger logger = Logger();
  List<City> cities = [];
  int selectedOriginCityId = 0;
  int selectedDestinationCityId = 0;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchDataFromBack();
  }

  Future<void> fetchDataFromBack() async {
    BuildContext currentContext = context;

    final cityService = CityService();
    try {
      final List<City> cityData = await cityService.listAll();

      setState(() {
        cities = cityData;
      });
    } catch (e) {
      CustomSnackBar.showError(currentContext, 'Failed to register city. Please try again.');
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
        margin: EdgeInsets.all(Adapt.px(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Adapt.px(10)),
          color: Colors.grey.withOpacity(0.2)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  //origin city field
                  DropdownButtonFormField<int>(
                    value: selectedOriginCityId,
                    items: [
                      DropdownMenuItem<int>(
                        value: 0,
                        enabled: false,
                        child: Text('Select Origin City', style: TextStyle(fontSize: Adapt.px(30)),),
                      ),
                      ...cities.map((City city) {
                        return DropdownMenuItem<int>(
                          value: city.id,
                          enabled: city.id != 0,
                          child: Text(city.cityName,style: TextStyle(fontSize: Adapt.px(30)),),
                        );
                      }).toList(),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        selectedOriginCityId = value ?? 0;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Origin City',
                      labelStyle: TextStyle(fontSize: Adapt.px(30), color: Colors.blue)
                    ),
                  ),
                  const SizedBox(height: 16.0),
              
                  // destination city field
                  DropdownButtonFormField<int>(
                    value: selectedDestinationCityId,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        enabled: false,
                        child: Text('Select Origin City', style: TextStyle(fontSize: Adapt.px(30)),),
                      ),
                      ...cities.map((City city) {
                        return DropdownMenuItem<int>(
                          value: city.id,
                          enabled: city.id != 0,
                          child: Text(city.cityName,style: TextStyle(fontSize: Adapt.px(30)),),
                        );
                        }).toList(),
                      ],
                    onChanged: (int? value) {
                      setState(() {
                        selectedDestinationCityId = value ?? 0;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Destination City',
                      labelStyle: TextStyle(fontSize: Adapt.px(30), color: Colors.blue)
                    ),
                  ),
                  const SizedBox(height: 16.0),
              
                  // select date field
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
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(fontSize: Adapt.px(30), color: Colors.blue)
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
                  SizedBox(height: Adapt.hp(5, context)),
              
                  // search button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        BuildContext currentContext = context;
                        if (selectedOriginCityId != 0 && selectedDestinationCityId != 0) {
                          try {
                            List<Trip> filteredTrips = await TripService().getFilteredTrips(selectedOriginCityId, selectedDestinationCityId, selectedDate);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (currentContext) => TripsPage(filteredTrips: filteredTrips),
                              ),
                            );
                          } catch (e) {
                            logger.e('Error: $e');
                          }
                        } else {
                          CustomSnackBar.showError(currentContext, 'Please, complete all fields.');
                        }
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