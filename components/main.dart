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

void main() {
  runApp(SpaceApp());
}

class SpaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      theme: ThemeData.dark(),
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

        // Add more routes here as needed
      },
    );
  }
}
