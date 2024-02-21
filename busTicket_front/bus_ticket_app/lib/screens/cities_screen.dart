// import 'package:flutter/material.dart';

// class CitiesScreen extends StatefulWidget {
//   const CitiesScreen({super.key});

//   @override
//   State<CitiesScreen> createState() => _CitiesScreenState();
// }

// class _CitiesScreenState extends State<CitiesScreen> {

//   final TextEditingController _cityController = TextEditingController(); 
//   // final CityService _cityService = CityService();

//   // void _registerCity() async {
//   //   String cityName = _cityController.text.trim();
//   //   BuildContext currentContext = context;
//   //   if(cityName.isNotEmpty){
//   //     CityModel newCity = CityModel(cityName: cityName);
//   //     try {
//   //         await _cityService.registerCity(newCity);
//   //       CustomSnackBar.showSuccess(currentContext, 'City registered successfully!');
//   //     } catch (error) {
//   //       print('Error:$error');
//   //       CustomSnackBar.showError(currentContext, 'Failed to register city. Please try again.');
//   //     }
//   //   }else{
//   //     CustomSnackBar.showInfo(context, 'Enter city name!');
//   //   }

//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cities',
//           style: TextStyle(
//             fontSize: 30, 
//             fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _cityController,
//                 decoration: const InputDecoration(labelText: 'City name'),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: (){
//                   // _registerCity();
//                 },
//                 child: const Text('Register City')
//               ),
//             ],) 
//         ),
//       )
//     );
//   }
// }