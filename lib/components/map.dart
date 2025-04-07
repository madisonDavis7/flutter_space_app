import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'wave.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String latitude = 'Latitude: '; // Placeholder for latitude
  String longitude = 'Longitude: '; // Placeholder for longitude

  // fetch ISS location
  Future<void> _fetchIssLocation() async {
    const String apiUrl = 'https://api.wheretheiss.at/v1/satellites/25544';

    try {
      // Fetch ISS location
      //GET request to api, converted to object then stored 
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) { //200 is good
        final data = json.decode(response.body); //omly process when good 

        // Log the API response debugginggg
        print('API response: $data');

        // Convert to numbers so no error maybe possibly 
        final latitudeValue = double.parse(data['latitude'].toString());
        final longitudeValue = double.parse(data['longitude'].toString());

        // Log the extracted values
        //cause nonsene with api not working
        print('Extracted latitude: $latitudeValue, longitude: $longitudeValue');

        // Update UI
        setState(() {
          latitude = 'Latitude: $latitudeValue';
          longitude = 'Longitude: $longitudeValue';
        });

        try {
          // Call the Cloud Function 
          final callable = FirebaseFunctions.instanceFor(
            region: 'us-central1',
          ).httpsCallable('updateIssLocation');
          
          final result = await callable.call({
            'latitude': latitudeValue,
            'longitude': longitudeValue,
          });

          print('Cloud Function result: ${result.data}');
        } catch (functionError) {
          print('Cloud Function error: $functionError');
          setState(() {
            latitude = 'Error: Cloud Function failed';
            longitude = 'Error: Cloud Function failed';
          });

        }
      } else {
        print('Error fetching ISS location: ${response.statusCode}');
        print('Response body: ${response.body}');
        setState(() {
          latitude = 'Error: HTTP ${response.statusCode}';
          longitude = 'Error: HTTP ${response.statusCode}';
        });
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      //print('Stack trace: $stackTrace');
      setState(() {
        latitude = 'Error: $e';
        longitude = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height, // Full screen height
        width: MediaQuery.of(context).size.width, // Full screen width
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WaveText(
                  text: 'ISS Location',
                  textStyle: TextStyle(
                    fontSize: 72,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Click to see where the ISS is located now',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                // Display latitude and longitude
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      latitude,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 60),
                    Text(
                      longitude,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Button to fetch ISS location
                ElevatedButton(
                  onPressed: _fetchIssLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 20, 47, 70),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Get ISS Location',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
