import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'wave.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String latitude = 'Latitude: '; // Placeholder for latitude
  String longitude = 'Longitude: '; // Placeholder for longitude

  // Function to fetch ISS location
  Future<void> _fetchIssLocation() async {
    const String apiUrl = 'https://api.wheretheiss.at/v1/satellites/25544';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          latitude = 'Latitude: ${data['latitude']}';
          longitude = 'Longitude: ${data['longitude']}';
        });
      } else {
        setState(() {
          latitude = 'Error fetching data';
          longitude = 'Error fetching data';
        });
      }
    } catch (e) {
      setState(() {
        latitude = 'Error fetching data';
        longitude = 'Error fetching data';
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
