//navigation

import 'package:flutter/material.dart';
import 'home.dart';
import 'mercury.dart';
import 'venus.dart';
import 'earth.dart';
import 'mars.dart';
import 'jupiter.dart';
import 'saturn.dart';
import 'uranus.dart';
import 'neptune.dart';
import 'navigation.dart';
import 'map.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart'; // Ensure this file exists and is correctly configured

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black26),
      ),

      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/navigation': (context) => NavigationPage(),
        '/mercury': (context) => MercuryPage(),
        '/venus': (context) => VenusPage(),
        '/earth': (context) => EarthPage(),
        '/mars': (context) => MarsPage(),
        '/jupiter': (context) => JupiterPage(),
        '/saturn': (context) => SaturnPage(),
        '/uranus': (context) => UranusPage(),
        '/neptune': (context) => NeptunePage(),
        '/map': (context) => MapPage(),

        // Add more routes here as needed
      },
    );
  }
}
